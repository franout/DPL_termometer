----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:46 12/14/2019 
-- Design Name: 
-- Module Name:    humidity_interface - Behavioral 
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




entity humidity_interface is
GENERIC ( main_clk: integer:= 10); -- 100 mHz

PORT ( clk,reset,enable: IN std_logic;
		data_out: out std_logic_vector(13 DOWNTO 0);
			ld_data,enable_cnt: out std_logic;
			sclk,sdata: inout std_logic);
end humidity_interface;

architecture Behavioral of humidity_interface is

TYPE state_t IS (power_up, idle, data_fetch , measure_request, wait_measure,update_duty_cycle_pwm,hang); 
CONSTANT freq_sclk: integer := 5000; --- 200 kHz

SIGNAL  curr_state,next_state: state_t;
SIGNAL counter_cl: std_logic_vector(   35 DOWNTO 0);
SIGNAL counter: std_logic_vector(   1+integer(ceil(log2(real(freq_sclk/main_clk)))) DOWNTO 0);
SIGNAL counter_wait:  std_logic_vector(   1+integer(ceil(log2(real(25000)))) DOWNTO 0);  -- ms 
SIGNAL prescaler_count:  std_logic_vector(   1+integer(ceil(log2(real((1000000-1)/main_clk)))) DOWNTO 0);  -- ms 

SIGNAL reset_cnt_clk,enable_wait,clk_rd,clk_wr,clk_wr_neg,sclk_collision,reset_counter_cl,generate_clk,sdata_i,check_ack,ack,sclk_i: std_logic;
SIGNAL data: std_logic_vector(13 DOWNTO 0);
SIGNAL status_bit: std_logic_vector( 1 DOWNTO 0);


begin





state_reg:PROCESS(reset,clk)
BEGIN
IF(reset='1' ) THEN
curr_state<=power_up;
counter<=(OTHERS=>'0');
counter_cl<=(OTHERS=>'0');
ELSIF (rising_edge(clk))THEN

IF( reset_counter_cl='1' ) THEN 
counter_cl<=(OTHERS=>'0');
ELSE
counter_cl<=std_logic_vector(unsigned(counter_cl)+1);
END IF;
		IF ( generate_clk='0' OR reset_cnt_clk='1' ) THEN 
		counter<=(OTHERS=>'0');
		ELSE 
		counter<=std_logic_vector(unsigned(counter)+1);
		END IF;
curr_state<=next_state;

END IF;

END PROCESS state_reg;


cl:PROCESS(curr_state,counter_cl,ack,enable,counter_wait)
BEGIN
-- default values 
data_out<=(OTHERS=>'0');
sdata_i<='Z';
ld_data<='0';
clk_wr<='1';
reset_counter_cl<='0';
generate_clk<='0';
enable_cnt<='0';

CASE curr_state IS 
WHEN power_up=> IF ( to_integer(unsigned(counter_cl))=5000000/main_clk) THEN  -- 5 ms
							next_state<=idle;
						ELSE 
						next_state<=curr_state;
						END IF;

WHEN idle=> 	reset_counter_cl<='1';
					enable_cnt<='1';
					IF(enable='1') THEN
					next_state<=measure_request;
					ELSE 
					next_state<=curr_state;					
					END IF;
WHEN measure_request=> 
								--  start bit
								IF( to_integer(unsigned(counter_cl))< (freq_sclk*2)/main_clk ) THEN  
								sdata_i<='0';
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*3)/main_clk) THEN 
								-- wait some time before writing the address ( 0x28 ) 
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*10) /main_clk) THEN 
								-- write address 
													IF (to_integer(unsigned(counter_cl))<freq_sclk*4/main_clk) THEN 
													sdata_i<='0'; -- first address bit msb
															clk_wr<='0';
															generate_clk<='1';
															next_state<=curr_state;
													
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*5/main_clk) THEN 
														sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*6/main_clk) THEN 
													sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*7/main_clk) THEN 
													sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*8/main_clk) THEN 
														sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*9/main_clk) THEN 
														sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*10/main_clk) THEN 
															sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													END IF;
															
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*11) /main_clk) THEN 
								-- write
								sdata_i<='0';
								generate_clk<='1';
								next_state<=curr_State;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*12) /main_clk) THEN 
								-- ack
								check_ack<='1';
										IF ( ack='1' ) THEN
										next_state<=hang;
										ELSE 
										next_state<=curr_state;
										END IF;
								
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*13) /main_clk) THEN 
								-- wait 1 cc ( sclk)
								next_state<=curr_state;
								generate_clk<='0'	;							
								
								ELSE 
								-- stop bit 
								sdata_i<='Z';
								next_state<=wait_measure;
								generate_clk<='0';					
								END IF ;
WHEN wait_measure=> -- wait for 25 sec 
							enable_wait<='1';
							reset_counter_cl<='1';
							IF ( to_integer(unsigned(counter_wait))  = 25000) THEN 
							next_state<=data_fetch;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN data_fetch=>	--  start bit
								IF( to_integer(unsigned(counter_cl))< (freq_sclk*2)/main_clk ) THEN  
								sdata_i<='0';
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*3)/main_clk) THEN 
								-- wait some time before writing the address ( 0x28 ) 
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*10) /main_clk) THEN 
								-- write address 
													IF (to_integer(unsigned(counter_cl))<freq_sclk*4/main_clk) THEN 
													sdata_i<='0'; -- first address bit msb
															clk_wr<='0';
															generate_clk<='1';
															next_state<=curr_state;
													
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*5/main_clk) THEN 
														sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*6/main_clk) THEN 
													sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*7/main_clk) THEN 
													sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*8/main_clk) THEN 
														sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*9/main_clk) THEN 
														sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*10/main_clk) THEN 
															sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													END IF;
															
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*11) /main_clk) THEN 
								-- read
								sdata_i<='1';
								generate_clk<='1';
								next_state<=curr_State;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*12) /main_clk) THEN 
								-- ack
								check_ack<='1';
										IF ( ack='1' ) THEN
										next_state<=hang;
										ELSE 
										next_state<=curr_state;
										END IF;
								
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*13) /main_clk) THEN 
								-- wait 1 cc ( sclk)
								next_state<=curr_state;
								generate_clk<='0'	;							
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*14) /main_clk) THEN 
								-- msb status bit  
								
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*15) /main_clk) THEN 
								-- lsb  status bit 
								
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*16) /main_clk) THEN 
								-- humidity 13
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*17) /main_clk) THEN 
								-- humidity 12
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*18) /main_clk) THEN 
								--  humidity 11
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*19) /main_clk) THEN 
								-- humidity 10 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*20) /main_clk) THEN 
								-- humidity 9 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*21) /main_clk) THEN 
								-- humidity 8
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*22) /main_clk) THEN 
								-- master ack 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*23) /main_clk) THEN 
								-- humidity 7   
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*24) /main_clk) THEN 
								-- humidity 6 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*25) /main_clk) THEN 
								-- humidity 5
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*26) /main_clk) THEN 
								-- humidity 4
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*27) /main_clk) THEN 
								--  humidity 3
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*28) /main_clk) THEN 
								-- humidity 2 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*29) /main_clk) THEN 
								-- humidity 1 
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*30) /main_clk) THEN 
								-- humidity 0
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*31) /main_clk) THEN 
								-- master n ack  ( stop communication otherwise slave will send the temp ) 
								
								ELSE 
								-- stop bit 
								sdata_i<='Z';
								next_state<=wait_measure;
								generate_clk<='0';					
								END IF ;			
WHEN update_duty_cycle_pwm=> -- for 1 cc
										ld_data_enable<='1';
										data_OUT<=data; -- raw data for the pwm generator
										next_state<= idle;
WHEN hang=> next_state<=curr_state;
								data_out<=(OTHERS=>'0');
								sdata_i<='0';
								ld_data<='0';
								clk_wr<='1';
								reset_counter_cl<='0';
								generate_clk<='0';
								enable_cnt<='0';
WHEN OTHERS=> next_state<=power_up;
					data_out<=(OTHERS=>'0');
						sdata_i<='Z';
						ld_data<='0';
						clk_wr<='1';
						reset_counter_cl<='0';
						generate_clk<='0';
						enable_cnt<='0';	
END CASE; 

END PROCESS cl;



-- register for counting up to 25 s
reg:PROCESS(clk,reset)
BEGIN
IF (reset='1') THEN
counter_wait<=(OTHERS=>'0');
prescaler_count<=(OTHERS=>'0');
ELSIF(rising_edge(clk))THEN

	IF(enable_wait='1') THEN 
		IF ( to_integer(unsigned(prescaler_count))<(1000000-1)/main_clk ) THEN 
					prescaler_count<=std_logic_vector(unsigned(prescaler_count)+1);
		ELSE 
			counter_wait<=std_logic_vector(unsigned(counter_wait)+1);
			prescaler_count<=(OTHERS=>'0');
		END IF;
	ELSE
	prescaler_count<=(OTHERS=>'0');
	counter_wait<=(OTHERS=>'0');
	END IF;

END IF;
END PROCESS reg;




-- collision not checked on the sdata since there will be only one slave
sclk_gen:PROCESS(sclk_collision,clk_wr,counter,generate_clk)
BEGIN
IF(generate_clk='1') THEN
reset_cnt_clk<='0';
-- check for clock streching
				IF ( sclk_collision = '0' ) THEN  -- no collision 
					clk_wr<='1';
							IF(to_integer(unsigned(counter))<=(freq_sclk/2)/main_clk  ) THEN 
							sclk_i<='0';
							ELSIF ( to_integer(unsigned(counter))<=freq_sclk/main_clk ) THEN
							sclk_i<='1';
							
							ELSE 
							-- other cycle
							sclk_i<='0';
							reset_cnt_clk<='1';
									
							END IF;

				ELSE
				-- open drain 
				sclk_i<='Z';
				END IF;

END IF;
END PROCESS sclk_gen;

-- check sclk collision 
sclk_collision <= not (  clk_rd  or  clk_wr_neg);

clk_rd<=sclk;

-- only for simualtion
--pragma translate_off
clk_rd<='1';
--pragma translate_on


-- open drain 
clk_wr_neg<= not ( clk_wr );


sclk<=sclk_i WHEN sclk_collision='0' ELSE 'Z';
		
ack<=sdata WHEN check_ack='1' ELSE '1';

sdata<=sdata_i;

end Behavioral;

