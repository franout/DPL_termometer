----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:21 11/19/2019 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name:  
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real."log2";
use IEEE.math_real."ceil";


entity control_unit is
GENERIC ( WATCH_DOG_COUNT: integer:= 100);
PORT ( reset,clk: IN std_logic;
-- selecting the indoor or outdoor temp sensor
in_out_sel: IN std_logic;

init_set_up: OUT std_logic ; -- commond signal to all component for setting up the lcd and sensors

-----------------------------------------------------------------------------------------------------------------------
-- done signals for each and every component will be also used for understanding that we are out of the set up phase ---
------------------------------------------------------------------------------------------------------------------------

in_out:OUT std_logic; -- common signal to all component for indoor outdoor sensor
-- from/to comparison 
start_comparison : OUT std_logic;
done_comparison: IN std_logic;
select_data: OUT std_logic_vector(1 DOWNTO 0); -- selecting between max,min and curr tmp 
-- from/to lcd interface
display: OUT std_logic;
done_lcd: IN std_logic;
-- from/to sensor interface
start_meas: OUT std_logic;
done_meas:IN std_logic
);
end entity control_unit;


architecture Behavioral of control_unit is
type  state_t is (set_up,set_up_hang,idle,measure_tmp,compute_max_min,display_curr_tmp,display_max_tmp,display_min_tmp);

SIGNAL curr_state,next_state: state_t;
SIGNAL in_out_val: std_logic:='0';
SIGNAL tc_wd: std_logic;

-- component declaration it works like a watchdog timer for the setup phase and the idle period ( for refreshing the temperature) 


component counter is
generic ( N : integer := 8;
			MAX_VAL: integer :=255);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC);
end component counter;


begin


watch_dog: counter GENERIC MAP (N=> 1+integer(ceil(log2(real(WATCH_DOG_COUNT)))),MAX_VAL=>WATCH_DOG_COUNT) PORT MAP(clk=>clk,reset=>reset,tc=> tc_wd);


regs:PROCESS(clk,reset)
BEGIN
IF (reset='1') THEN
curr_state<=set_up;

ELSE 
	IF(clk='1' AND clk'EVENT) THEN
	curr_state<=next_state;
	END IF;

END IF;
END PROCESS regs;



comb_logic:PROCESS(in_out_sel,done_comparison,done_lcd,done_meas,curr_state,tc_wd)
BEGIN
-- default assignments of all signal 
next_state<=curr_state;
start_meas<='0';
display<='0';
select_data<="00";
in_out<=in_out_val;
start_comparison<='0';init_set_up<='0';

CASE curr_state IS
WHEN set_up=> init_set_up<='1';
			-- interfaces will maintain the done signals up ( if they have completed the initialization ) as soon as the init_set-up remains at 1
			IF ( done_comparison='1' AND done_lcd='1' AND done_meas='1' ) THEN
			next_state<=idle;
			ELSIF ( tc_wd='1' ) THEN 
			next_state<=set_up_hang;
			ELSE
			next_state<=curr_state;
			END IF;
WHEN set_up_hang=> -- tear downt the initialization signal for one clock cycle
					next_state<=set_up;
WHEN idle=> 
				IF( in_out_sel'EVENT OR tc_wd='1' ) THEN
				next_state<=measure_tmp;
				in_out_val<=in_out_sel; -- keeping constant until next idle period
				ELSE 
				next_state<=curr_state;
				END IF;
WHEN measure_tmp=>
				start_meas<='1';
				IF(done_meas='1')THEN
				next_state<=compute_max_min;
				ELSE 
				next_state<=curr_state;
				END IF;			
WHEN compute_max_min=>
						start_comparison<='1';
						IF(done_comparison='1') THEN
						next_state<=display_max_tmp;
						ELSE
						next_state<=curr_state;
						END IF;
WHEN display_max_tmp=>
							select_data<="01";
							display<='1';
							IF ( done_lcd ='1') THEN
							next_state<=display_min_tmp;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN display_min_tmp=>select_data<="10";
							display<='1';
							IF ( done_lcd ='1') THEN
							next_state<=display_curr_tmp;
							ELSE 
							next_state<=curr_state;
							END IF;

WHEN display_curr_tmp=> 
							select_data<="11";
							display<='1';
							IF ( done_lcd ='1') THEN
							next_state<=idle;
							ELSE 
							next_state<=curr_state;
							END IF;

-- for a safe fsm
WHEN OTHERS=> 
	next_state<=set_up;
	start_meas<='0';display<='0';select_data<="00";in_out<='0';start_comparison<='0';init_set_up<='0';
END CASE;

END PROCESS comb_logic;

end Behavioral;

