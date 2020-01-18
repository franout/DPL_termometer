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
--led: out std_logic_vector( 8 downto 0);
init_set_up: OUT std_logic ; -- commond signal to all component for setting up the lcd and sensors
swtem: 	in std_logic;
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
done_meas:IN std_logic;
reset_i: OUT std_logic; -- internal reset for all interfaces 
ready: OUT std_logic; -- switch on an led for notifyinh that the system is operative
locked_clock: IN std_logic; -- notify from pll that clock speed has been reached
-- to humidity sensor interface
enable_humidity_sensor: OUT std_logic

);
end entity control_unit;


architecture Behavioral of control_unit is
type  state_t is (pll_lock_clock,set_up,set_up_hang,idle,measure_tmp,compute_max_min,display_curr_tmp,display_max_tmp,display_min_tmp,display_wait_min,display_wait_max,display_wait_now);

SIGNAL curr_state,next_state: state_t;
SIGNAL curr_in_out_val,next_in_out_val: std_logic:='0';
SIGNAL tc_wd,enable_wd: std_logic;

-- component declaration it works like a watchdog timer for the setup phase and the idle period ( for refreshing the temperature) 


component counter_wd is
generic ( N : integer := 8;
			MAX_VAL: integer :=255);
    Port ( clk : in  STD_LOGIC;
	 				enable: in std_logic;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC);
end component counter_wd;

signal edge_detect : std_logic_vector( 1 downto 0 );
signal edge_detect_com:std_logic_vector( 1 downto 0 );
begin


watch_dog: counter_wd GENERIC MAP (N=> 1+integer(ceil(log2(real(WATCH_DOG_COUNT)))),MAX_VAL=>WATCH_DOG_COUNT) PORT MAP(enable=>enable_wd,clk=>clk,reset=>reset,tc=> tc_wd);


regs:PROCESS(clk,reset)
BEGIN
IF (reset='1') THEN
curr_state<=pll_lock_clock;
curr_in_out_val<='0';
ELSE 
	IF(clk='1' AND clk'EVENT) THEN
	    edge_detect <= edge_detect(0) &in_out_sel ;
		edge_detect_com <= edge_detect_com(0) &swtem ;
	curr_state<=next_state;
	curr_in_out_val<=next_in_out_val;
	END IF;

END IF;
END PROCESS regs;


comb_logic:PROCESS(locked_clock,in_out_sel,done_comparison,done_lcd,done_meas,curr_state,tc_wd,edge_detect,curr_in_out_val)
BEGIN
-- default assignments of all signal 
next_state<=curr_state;
display<='1';
select_data<="00";
next_in_out_val<=curr_in_out_val;
start_comparison<='0';
init_set_up<='0';
enable_wd<='0';
start_meas<='1';
reset_i<='0';
ready<='1';
in_out<=curr_in_out_val;
enable_humidity_sensor<='1';
CASE curr_state IS
WHEN pll_lock_clock=> 	enable_humidity_sensor<='0';
--						ready<='0';
                    --    led(0)<='1';
						enable_wd<='1';
						IF (locked_clock='1') THEN 
						-- desired frequnecy reached
						next_state<=set_up;
						ELSE
						next_state<=curr_state;
						END IF;
WHEN set_up=> init_set_up<='1';
				enable_wd<='1';
				
				-- led(1)<='1';
				enable_humidity_sensor<='0';
--			ready<='0';
			-- interfaces will maintain the done signals up ( if they have completed the initialization ) as soon as the init_set-up remains at 1
			IF ( done_lcd='1' ) THEN
			next_state<=idle;
			ELSIF ( tc_wd='1' ) THEN 
			next_state<=set_up_hang;
			ELSE
			next_state<=curr_state;
			END IF;
WHEN set_up_hang=> -- tear downt the initialization signal for one clock cycle
					enable_humidity_sensor<='0';
					    --                    led(2)<='1';
--					ready<='0';
					reset_i<='1';
					next_state<=set_up;
WHEN idle=> enable_wd<='1';
            start_meas<='0';
			display<='0';

                        --led(3)<='1';
				IF( edge_detect="01" or edge_detect_com="01") THEN
				-- rising edge  INDOOR
				next_state<=measure_tmp;
				next_in_out_val<=in_out_sel; -- keeping constant until next idle period
				ELSIF (edge_detect="10" or edge_detect_com="10") THEN 
				-- falling edge outdoor
				next_state<=measure_tmp;
				next_in_out_val<=in_out_sel; -- keeping constant until next idle period	
				ELSIF ( tc_wd='1') THEN  -- timer has expired
				next_state<=measure_tmp;
				--next_in_out_val<=in_out_sel; -- using the old one  the previous indoor/outdoor until next idle period
				ELSE 
				next_state<=curr_state;
				END IF;
WHEN measure_tmp=>--led(4)<='1';
				display<='0';
				IF(done_meas='1')THEN
				next_state<=compute_max_min;
				ELSE 
				next_state<=curr_state;
				END IF;			
WHEN compute_max_min=>--led(5)<='1';
						   start_meas<='0';
						start_comparison<='1';
						display<='0';
						IF(done_comparison='1') THEN
						next_state<=display_max_tmp;
						ELSE
						next_state<=curr_state;
						END IF;
WHEN display_max_tmp=>		--display<='0';
							start_meas<='0';
							select_data<="01";
							IF ( done_lcd ='1') THEN
							next_state<=display_wait_max;
							ELSE 
							next_state<=curr_state;
							END IF;
							
WHEN display_wait_max=>		--display<='0';
							select_data<="01";   start_meas<='0';
							IF ( done_lcd ='0') THEN
							next_state<=display_min_tmp;
							ELSE 
							next_state<=curr_state;
							END IF;
												
WHEN display_min_tmp=>select_data<="10";   
						start_meas<='0';
--led(7)<='1';
						--	display<='1';
							IF ( done_lcd ='1') THEN
							next_state<=display_wait_min;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN display_wait_min=>		--display<='0';
							select_data<="10";   
							start_meas<='0';
							IF ( done_lcd ='0') THEN
							next_state<=display_curr_tmp;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN display_curr_tmp=> --led(8)<='1';
							--select_data<="11";   
							start_meas<='0';
					--		display<='1';
							IF ( done_lcd ='1') THEN
							next_state<=display_wait_now;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN display_wait_now=>		--display<='0';
							--select_data<="11";   
							start_meas<='0';
							IF ( done_lcd ='0') THEN
							next_state<=idle;
							ELSE 
							next_state<=curr_state;
							END IF;					

-- for a safe fsm
WHEN OTHERS=> 
	next_state<=set_up;
	start_meas<='0';display<='0';select_data<="00";in_out<='0';start_comparison<='0';init_set_up<='0';enable_wd<='0';
	enable_humidity_sensor<='0';
reset_i<='0';
END CASE;

END PROCESS comb_logic;

end Behavioral;
