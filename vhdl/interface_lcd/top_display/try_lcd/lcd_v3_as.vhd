----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:03:14 12/18/2019 
-- Design Name: 
-- Module Name:    lcd_v3_as - Behavioral 
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
use IEEE.numeric_std.ALL;
use IEEE.math_real."log2";
use IEEE.math_real."ceil";


entity lcd_v3_as is
GENERIC (clk_val:integer := 10); -- 100 mhz
	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	   dataIN:         IN STD_LOGIC_VECTOR(7 downto 0);
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		
		enable_translator: OUT STD_LOGIC;
		enable_lcd: OUT std_logic;
		dataOUT:        inout STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             OUT STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC     );                      -- 0 write  /   1 read

	     
end lcd_v3_as;

architecture Behavioral of lcd_v3_as is


type state_t is (power_up,init_1,init_2,init_3,init_4, init_5,init_6,init_7 , init_8 ,
							idle, done_lcd, hang,writing_max,writing_max2);
constant max_cnt_pw: integer:= 20000000/clk_val;

SIGNAL cnt_pw,next_cnt_pw: std_logic_vector(  1+integer(ceil(log2(real(max_cnt_pw))))-1 DOWNTO 0);
SIGNAL data_i: std_logic_vector( 7 DOWNTO 0);
SIGNAL curr_state,next_state: state_t;
signal busy_flag: std_logic;
begin

regs:PROCESS(reset,clk)
BEGIN

IF (reset='1') THEN
curr_state<=power_up;
cnt_pw<=(OTHERS=>'0');
ELSif (rising_edge(clk))THEN
curr_state<=next_state;
cnt_pw<=next_cnt_pw;
END IF;
END PROCESS regs;



cl:PROCESS(curr_state,cnt_pw,enable_init,dataIN,enable,ind_outd_select,busy_flag)
BEGIN
enable_lcd<='0';
rs<='0';
r_w<='0';
next_state<=curr_state;
next_cnt_pw<=(OTHERS=>'0');
					data_i<=x"00";
done<='0';
enable_translator<='0';
CASE curr_state IS

WHEN power_up=>
					data_i<=x"00";

					-- wait for 20 ms
				IF ( enable_init='1' AND (max_cnt_pw)=to_integer(unsigned(cnt_pw)) ) THEN
						next_state<=init_1;
						next_cnt_pw<=(OTHERS=>'0');
					ELSIF (enable_init='1' AND (max_cnt_pw)=to_integer(unsigned(cnt_pw))) then 
					next_state<=curr_state;
					next_cnt_pw<=cnt_pw;

					ELSE
					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
					next_state<=curr_state;
					END IF;
	WHEN init_1=> -- function set
						enable_lcd<='1';
						data_i<=x"38";
						next_state<=init_2;
	WHEN init_2=> IF(to_integer(unsigned(cnt_pw))>= 37000/clk_val ) THEN -- wait 37 us
						next_cnt_pw<=(OTHERS=>'0');
						next_state<=init_3;
						ELSE 
						next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
						next_state<=curr_state;
						END IF;
	WHEN init_3=> -- display_set
						enable_lcd<='1';
						data_i<=x"0c";
						next_state<=init_4;
						
	WHEN init_4=> IF(to_integer(unsigned(cnt_pw))>= 37000/clk_val) THEN -- wait 37 us
						next_cnt_pw<=(OTHERS=>'0');
						next_state<=init_5;
						ELSE 
						next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
						next_state<=curr_state;
						END IF;				
	WHEN init_5=> -- display clear 
					enable_lcd<='1';
						data_i<=x"01";
						next_state<=init_6;
						
	WHEN init_6=> -- wait 1.52 ms
						IF(to_integer(unsigned(cnt_pw))>= 1520000/clk_val) THEN 
						next_cnt_pw<=(OTHERS=>'0');
						next_state<=init_7;
						ELSE 
						next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
						next_state<=curr_state;
						END IF;		
 WHEN init_7=> -- entry mode set 
					enable_lcd<='1';
					data_i<=x"06";  -- entry mode set
						next_state<=init_8;
 WHEN init_8=>  -- wait 1 us
						IF(to_integer(unsigned(cnt_pw))>= 1000000/clk_val) THEN 
						next_cnt_pw<=(OTHERS=>'0');
						next_state<=done_lcd;
						ELSE 
						next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
						next_state<=curr_state;
						END IF;		
WHEN done_lcd=> done<='1';
					data_i<=x"00";

				next_state<=idle;
					
WHEN idle=> 	done<='0';
						enable_lcd<='0';
						rs<='0';
						data_i<=(OTHERS=>'0');
					next_cnt_pw<=(OTHERS=>'0');

			if enable='1' then
								next_state<=writing_max;
								else 
								next_state<=idle;
								end if;
WHEN writing_max=>rs<='1';
					r_w<='0';
					data_i<=x"55"; -- send m

					IF (to_integer(unsigned(cnt_pw))<170/clk_val) THEN
					enable_lcd<='0';	
					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
											next_state<=curr_state;

					ELSIF (to_integer(unsigned(cnt_pw))<180/clk_val) THEN
					enable_lcd<='1';
					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
											next_state<=curr_state;

					ELSIF(to_integer(unsigned(cnt_pw))<1000/clk_val) THEN -- wait for 1 us
					enable_lcd<='0';
					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
											next_state<=curr_state;

					ELSE 
						next_state<=writing_max2;
						next_cnt_pw<=(OTHERS=>'0');
					
				END IF;
WHEN writing_max2=>rs<='1';
					r_w<='0';
					data_i<=x"AA"; -- send m

					IF (to_integer(unsigned(cnt_pw))<170/clk_val) THEN
					enable_lcd<='0';	
																next_state<=curr_state;

					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);

					ELSIF (to_integer(unsigned(cnt_pw))<180/clk_val) THEN
					enable_lcd<='1';
					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
											next_state<=curr_state;

					ELSIF(to_integer(unsigned(cnt_pw))<1000/clk_val) THEN -- wait for 1 us
					enable_lcd<='0';
											next_state<=curr_state;

					next_cnt_pw<=std_logic_vector(unsigned(cnt_pw)+1);
					ELSE 
						next_state<=idle;
						next_cnt_pw<=(OTHERS=>'0');
					
				END IF;


WHEN HANG=> next_state<=curr_state;
				data_i<=x"FF";
				enable_translator<='0';
				done<='0';
				enable_lcd<='0';
				rs<='0';
				r_w<='0';
					next_cnt_pw<=(OTHERS=>'0');
								

WHEN OTHERS=>
								data_i<=x"00";
				next_state<=power_up;
				enable_translator<='0';
				done<='0';
				enable_lcd<='0';
				rs<='0';
				r_w<='0';
						next_cnt_pw<=(OTHERS=>'0');
				
END CASE;

	
	
	
END PROCESS cl;

busy_flag<=dataOUT(7);
dataOUT<=data_i;


end Behavioral;

