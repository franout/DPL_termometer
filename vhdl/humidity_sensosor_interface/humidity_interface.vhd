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
SIGNAL counter_cl: std_logic_vector(   18 DOWNTO 0);
SIGNAL counter: std_logic_vector(   1+integer(ceil(log2(real(freq_sclk/main_clk)))) DOWNTO 0);
SIGNAL counter_wait:  std_logic_vector(   1+integer(ceil(log2(real(25000)))) DOWNTO 0);  -- ms 
SIGNAL prescaler_count:  std_logic_vector(   1+integer(ceil(log2(real((1000000-1)/main_clk)))) DOWNTO 0);  -- ms 

SIGNAL reset_cnt_clk,enable_wait,shf_en,clk_rd,clk_wr,clk_wr_neg,sclk_collision,reset_counter_cl,generate_clk,sdata_i,ack,sclk_i: std_logic;
SIGNAL data: std_logic_vector(15 DOWNTO 0); -- first two bits are the status registers

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


cl:PROCESS(curr_state,counter_cl,ack,enable,counter_wait,sclk,data)
BEGIN
-- default values 
data_out<=(OTHERS=>'0');
sdata_i<='Z';
ld_data<='0';
reset_counter_cl<='0';
generate_clk<='0';
enable_cnt<='0';
enable_wait<='0';
shf_en<='0';

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
								IF( to_integer(unsigned(counter_cl))< (freq_sclk*1)/main_clk ) THEN  
								sdata_i<='0';
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*2)/main_clk) THEN 
								-- wait some time before writing the address ( 0x28 ) 
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*9) /main_clk) THEN 
								-- write address 
													IF (to_integer(unsigned(counter_cl))<freq_sclk*3/main_clk) THEN 
													sdata_i<='0'; -- first address bit msb
															generate_clk<='1';
															next_state<=curr_state;
													
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*4/main_clk) THEN 
														sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*5/main_clk) THEN 
													sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*6/main_clk) THEN 
													sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*7/main_clk) THEN 
														sdata_i<='0';
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
													END IF;
															
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*10) /main_clk) THEN 
								-- write
								sdata_i<='0';
								generate_clk<='1';
								next_state<=curr_State;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*11) /main_clk) THEN 
								-- ack
								generate_clk<='1';
								IF (rising_edge(sclk)) THEN
										IF ( ack='1' ) THEN
										next_state<=hang;
										ELSE 
										next_state<=curr_state;
										END IF;
								END IF;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*12) /main_clk) THEN 
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
							IF ( to_integer(unsigned(counter_wait))  = 25000
							--synthesis translate_off
							/1000
							--synthesis translate_on
							) THEN 
							next_state<=data_fetch;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN data_fetch=>	--  start bit
								IF( to_integer(unsigned(counter_cl))< (freq_sclk*1)/main_clk ) THEN  
								sdata_i<='0';
								next_state<=curr_state;
								generate_clk<='0';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*2)/main_clk) THEN 
								-- wait some time before writing the address ( 0x28 ) 
								next_state<=curr_state;
								generate_clk<='0';
								sdata_i<='Z';

								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*9) /main_clk) THEN 
								-- write address 
													IF (to_integer(unsigned(counter_cl))<freq_sclk*3/main_clk) THEN 
													sdata_i<='0'; -- first address bit msb
															
															generate_clk<='1';
															next_state<=curr_state;
													
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*4/main_clk) THEN 
														sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*5/main_clk) THEN 
													sdata_i<='0';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*6/main_clk) THEN 
													sdata_i<='1';
															generate_clk<='1';
															next_state<=curr_state;
													ELSIF (to_integer(unsigned(counter_cl))<freq_sclk*7/main_clk) THEN 
														sdata_i<='0';
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
													END IF;
															
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*10) /main_clk) THEN 
								-- read
								sdata_i<='1';
								generate_clk<='1';
								next_state<=curr_State;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*11) /main_clk) THEN 
								-- ack
								generate_clk<='1';
								IF (rising_edge(sclk)) THEN
										IF ( ack='1' ) THEN
										next_state<=hang;
										ELSE 
										next_state<=curr_state;
										END IF;
								END IF;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*12) /main_clk) THEN 
								-- wait 1 cc ( sclk)
								sdata_i<='Z';
								next_state<=curr_state;
								generate_clk<='0'	;							
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*13) /main_clk) THEN 
								-- msb status bit  
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
										
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*14) /main_clk) THEN 
								-- lsb  status bit 
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*15) /main_clk) THEN 
								-- humidity 13
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*16) /main_clk) THEN 
								-- humidity 12
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*17) /main_clk) THEN 
								--  humidity 11
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*18) /main_clk) THEN 
								-- humidity 10 
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';								
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*19) /main_clk) THEN 
								-- humidity 9 
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*20) /main_clk) THEN 
								-- humidity 8
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*21) /main_clk) THEN 
								-- master ack 
								sdata_i<='1';
								generate_clk<='1';
								next_state<=curr_State;
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*22) /main_clk) THEN 
								-- humidity 7  
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*23) /main_clk) THEN 
								-- humidity 6 
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*24) /main_clk) THEN 
								-- humidity 5
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*25) /main_clk) THEN 
								-- humidity 4
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*26) /main_clk) THEN 
								--  humidity 3
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*27) /main_clk) THEN 
								-- humidity 2
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';						
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*28) /main_clk) THEN 
								-- humidity 1 
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*29) /main_clk) THEN 
								-- humidity 0
								next_state<=curr_state;
								generate_clk<='1';
								shf_en<='1';
								ELSIF (to_integer(unsigned(counter_cl))< (freq_sclk*30) /main_clk) THEN 
								-- master n ack  ( stop communication otherwise slave will send the temp ) 
								sdata_i<='0';
								generate_clk<='1';
								next_state<=curr_State;
								ELSE 
								-- stop bit 
								sdata_i<='Z';
								next_state<=update_duty_cycle_pwm;
								generate_clk<='0';					
								END IF ;			
WHEN update_duty_cycle_pwm=> -- for 1 cc
										IF(data(15)='0' AND data(14)='0') THEN
										-- new value and no command mode
										ld_data<='1';
										data_OUT<=data(13 downto 0); -- raw data for the pwm generator
										next_state<= idle;
										ELSE 
										next_state<=idle;
										END IF;
WHEN hang=> next_state<=curr_state;
								data_out<=(OTHERS=>'0');
								sdata_i<='0';
								ld_data<='0';
								reset_counter_cl<='0';
								generate_clk<='0';
								enable_cnt<='0';
WHEN OTHERS=> next_state<=power_up;
					data_out<=(OTHERS=>'0');
						sdata_i<='Z';
						ld_data<='0';
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

-- shift register for the data
reg_sh:PROCESS(sclk,reset)
BEGIN
IF(reset='1') THEN
data<=(OTHERS=>'0');
ELSIF ( rising_edge(sclk))THEN

IF (shf_en='1') THEN
data(15 DOWNTO 1)<=data(14 downto 0);
data(0)<=sdata;
END IF;
END IF;
END PROCESS reg_sh;



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
				clk_wr<='0';
				-- open drain 
				sclk_i<='Z';
				END IF;
ELSE
clk_wr<='0';
reset_cnt_clk<='1';
END IF;
END PROCESS sclk_gen;

-- check sclk collision 
sclk_collision <= not (clk_rd  or  clk_wr_neg);

clk_rd<=sclk
--synthesis translate_off
or '1'
--synthesis translate_on

;

-- only for simualtion ( or '1' )  i.e. no clock streching 


-- open drain 
clk_wr_neg<= not ( clk_wr );

-- tristate output
sclk<=sclk_i WHEN sclk_collision='0' ELSE 'Z';
		
ack<=sdata;

sdata<=sdata_i;

end Behavioral;

