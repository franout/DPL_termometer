----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:01 11/19/2019 
-- Design Name: 
-- Module Name:    top_termomemter - Behavioral 
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


entity top_termometer is
    Port ( reset : in  STD_LOGIC;
           main_clk : in  STD_LOGIC;
			  ind_outd_sw: in STD_LOGIC;
           tmp_sensor : inout  STD_LOGIC;
           lcd_enable : out  STD_LOGIC;
           lcd_rw : out  STD_LOGIC;
           lcd_rs : out  STD_LOGIC;
           lcd_data : out  STD_LOGIC_VECTOR (7 downto 0);
				system_ready: out std_logic); -- signal to an led on the board
end top_termometer;

architecture structural of top_termometer is
 
 
 
 
 component clock_generator_pll
port
 (-- Clock in ports  100 Mhz
  CLK_IN1           : in    std_logic;
  -- Clock out ports  10 Mhz
  CLK_OUT1          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
    LOCKED            : out    std_logic

 );
end component;
 
 
 -- main control unit
 COMPONENT control_unit is
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
done_meas:IN std_logic;
reset_i: OUT std_logic; -- internal reset for all interfaces 
ready: OUT std_logic; -- switch on an led for notifyinh that the system is operative
locked_clock: IN std_logic -- notify from pll that clock speed has been reached
);
end COMPONENT control_unit;

 
 
 
 -- datapath ( interfaces have its own CU ) 
 -- comparison 

component comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC;
           select_data : in  STD_LOGIC_VECTOR (1 downto 0));
end component comparison; 


-- termometer interfaces

component temperature is
port (	clk: in std_logic;
		nrst:in std_logic;
		in_out_door:in std_logic;
		dq	:inout std_logic;
		led1: out std_logic;
		data:out std_logic_vector(8 downto 0));
end component temperature;

-- lcd interfaces 

COMPONENT top_display is
GENERIC(n: INTEGER := 9);
PORT(clk,reset,start_lcd,init_set_up,ind_outd_select: in std_logic;
		data_in: in std_logic_vector(N-1 DOWNTO 0);
		done_lcd: out std_logic;
		-- for lcd
		data_out: OUT std_logic_vector(N-2 downto 0);
		rs,r_w,enable: out std_logic
	);

end  COMPONENT top_display;

SIGNAL reset_top,start_display,clk,locked_clock,reset_start_tmp,init_set_up,in_out_sel ,start_comparison,done_display,done_comparison,done_meas,start_meas,reset_i: std_logic;
SIGNAL select_data_comparison: std_logic_vector(1 DOWNTO 0);
SIGNAL data_from_comparison,data_from_tmp_interface: std_logic_vector(8 DOWNTO 0);

begin

reset_top<= reset or reset_i;
-- interconnecting components
interface_lcd: top_display GENERIC MAP(9) PORT MAP(clk=>clk,reset=>reset_top,start_lcd=>start_display, 
									init_set_up=>init_set_up, ind_outd_select=>in_out_sel,
									data_in=>data_from_comparison,
									done_lcd=>done_display,
									data_out=>lcd_data,
									enable=>lcd_enable,
									r_w=>lcd_rw,
									rs=>lcd_rs );
interface_tmp_sensor: temperature PORT MAP(clk=>clk,
														in_out_door=>in_out_sel,
														led1=>done_meas,
														data=>data_from_tmp_interface,
														dq=> tmp_sensor,
														nrst=>reset_start_tmp);
comparison_block:comparison GENERIC MAP (9) PORT MAP(clk=>clk,reset=>reset_top,
				in_out_sel=>in_out_sel,
				data_in=>data_from_tmp_interface ,
           data_out=>data_from_comparison ,
           start_comparison=>start_comparison ,
           done_comparison=>done_comparison ,
           select_data =>select_data_comparison);
cu: control_unit GENERIC MAP (300) PORT MAP(locked_clock=>locked_clock,clk=>clk,reset=>reset,
									in_out_sel=>ind_outd_sw,
									init_set_up=> init_set_up,
									in_out=>in_out_sel,
									start_comparison=> start_comparison,
									done_comparison=> done_comparison,
									select_data=>select_data_comparison, 
									display=>start_display,
									done_lcd=>done_display,
									start_meas=>start_meas,
									done_meas=>done_meas ,
									reset_i=>reset_i,
									ready=> system_ready);

reset_start_tmp<=not(start_meas or reset_top);

-- pll 
clk_gen : clock_generator_pll   port map    ( CLK_IN1 => main_clk,
    -- Clock out ports
    CLK_OUT1 => clk,
    -- Status and control signals
    RESET  => RESET,
	 locked=> locked_clock
    );
	 
-- additional components 



end structural;

