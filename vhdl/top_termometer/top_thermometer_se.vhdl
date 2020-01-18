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


entity top_thermometer is
    Port ( reset : in  STD_LOGIC;					--SW[15]
           clk : in  STD_LOGIC;
		   ind_outd_sw: in STD_LOGIC;				--SW[0]
--------------------TEMPERATURE-------------------------
           tmp_sensor : inout  STD_LOGIC;			--dq indoor JC[1]
		   data_receive_from_rece: in std_logic;			--JC[2]
		   ledtest: out std_logic_vector(8 downto 0);
		   finishtem: out std_logic;
---------------------LCD----------------------------------
           lcd_rs : out  STD_LOGIC;				--JB[7]
           lcd_rw : out  STD_LOGIC;				--JB[8]
           lcd_enable : out  STD_LOGIC;				--JB[9]
           lcd_data : out  STD_LOGIC_VECTOR (7 downto 0);			--JA[0] --JA[10]
		   temstart: out std_logic;
		   swtem: 	in std_logic;
--		   led: out std_logic_vector( 8 downto 0);
			compare_start: out std_logic;
			compare_done: out std_logic;
		   system_ready: out std_logic; -- signal to an led on the board    LED15
---------------------humidity sensor----------------------------------
           pwm_out: OUT std_logic;
           sclk,sdata: INOUT std_logic
				);
end top_thermometer;

architecture structural of top_thermometer is
 
 
 
 
 
 -- main control unit
 COMPONENT control_unit is
GENERIC ( WATCH_DOG_COUNT: integer:= 100);
PORT ( reset,clk: IN std_logic;
-- selecting the indoor or outdoor temp sensor
in_out_sel: IN std_logic;

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
--led: out std_logic_vector( 8 downto 0);
-- from/to sensor interface
start_meas: OUT std_logic;
done_meas:IN std_logic;
reset_i: OUT std_logic; -- internal reset for all interfaces 
ready: OUT std_logic; -- switch on an led for notifyinh that the system is operative
locked_clock: IN std_logic ; -- notify from pll that clock speed has been reached
-- to humidity sensor interface
enable_humidity_sensor: OUT std_logic
);
end COMPONENT control_unit;

 
 
 
 -- datapath ( interfaces have its own CU ) 
 -- comparison 

component comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_outmax : out  STD_LOGIC_VECTOR (N-1 downto 0);
		   data_outmin : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC);
end component comparison; 


-- termometer interfaces

component temall is
port	(clk : in std_logic;
		 nrst:in std_logic;
		 in_out: in std_logic;
		 led: out std_logic_vector(8 downto 0);
		 dq:  inout std_logic;            --ja[1]
		ledtest: out std_logic_vector(10 downto 0);
		 data_recei :in std_logic;        --ja[2]
		 finish:	out std_logic
		 );
end component temall;		 

-- lcd interfaces 

COMPONENT LCD is
	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	   	dataIN:         IN STD_LOGIC_VECTOR(8 downto 0);
		datacompare_max:	in std_logic_vector(8 downto 0);
		datacompare_min:	in std_logic_vector(8 downto 0);
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		swtem:			in std_logic;
		enable_lcd: OUT std_logic;
		dataOUT:        OUT STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             out STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC  );

end  COMPONENT LCD;

--humidity sensor
component  top_humidity_sensors_interface is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           pwm_out : out  STD_LOGIC;
           sclk : inout  STD_LOGIC;
           sdata : inout  STD_LOGIC);
end component top_humidity_sensors_interface;


SIGNAL reset_top,start_display,reset_start_tmp,init_set_up,
			in_out_sel ,start_comparison,done_display,done_comparison,done_meas,
			start_meas,reset_i,enable_humidity_sensor: std_logic;
SIGNAL select_data_comparison: std_logic_vector(1 DOWNTO 0);
SIGNAL data_from_comparison_max,data_from_comparison_min,data_from_tmp_interface: std_logic_vector(8 DOWNTO 0);
signal datainter : std_logic_vector(8 DOWNTO 0);

begin
datainter<=data_from_tmp_interface;
reset_top<= reset ;
-- interconnecting components

interface_lcd: LCD  PORT MAP(clk=>clk,reset=>reset_top,	
					dataIN=>data_from_tmp_interface,				--data_from_comparison,
					enable_init=>init_set_up,
					enable=>start_display, 
					ind_outd_select=>in_out_sel,
					swtem=>swtem,
					datacompare_max=>data_from_comparison_max,
					datacompare_min=>data_from_comparison_min,
					done=>done_display,
					dataOUT=>lcd_data,
					enable_lcd=>lcd_enable,
					R_W=>lcd_rw,
					RS=>lcd_rs );
interface_tmp_rf_sensor: temall PORT MAP		(clk=>clk,
							 nrst=>start_meas,
							in_out=>in_out_sel,
							led=>data_from_tmp_interface,
							dq=> tmp_sensor,           --ja[1]
--							ledtest=>ledtest,
							data_recei=>data_receive_from_rece,        --ja[2]
							finish=>done_meas);	
comparison_block:comparison GENERIC MAP (9) PORT MAP(clk=>clk,reset=>reset_top,
				in_out_sel=>ind_outd_sw,
				data_in=>datainter ,
			data_outmax=>data_from_comparison_max , 
		   data_outmin=>data_from_comparison_min ,
     --      data_out=>data_from_comparison ,
           start_comparison=>start_comparison ,
           done_comparison=>done_comparison 
           --select_data =>select_data_comparison
		   );
cu: control_unit GENERIC MAP (200000000) PORT MAP(locked_clock=>'1',clk=>clk,reset=>reset,
									in_out_sel=>ind_outd_sw,
									init_set_up=> init_set_up,
									swtem=>swtem,
									in_out=>in_out_sel,
									start_comparison=> start_comparison,
									done_comparison=> done_comparison,
									select_data=>select_data_comparison, 
									display=>start_display,
									done_lcd=>done_display,
									start_meas=>start_meas,
									done_meas=>done_meas ,
									reset_i=>reset_i,
									ready=> system_ready,
									enable_humidity_sensor=>enable_humidity_sensor);
									
			  
			  
reset_start_tmp<=not(start_meas or reset_top);
ledtest<=data_from_tmp_interface;
temstart<=start_meas;
finishtem<=done_meas;
compare_start<=start_comparison;
compare_done<=done_comparison;


humidity_interface: top_humidity_sensors_interface PORT MAP (clk=>clk,
                                                            reset=>reset_top,
                                                             pwm_out=>pwm_out,  
                                                               enable=>enable_humidity_sensor,
                                                               sdata=>sdata,sclk=>sclk);


end structural;
