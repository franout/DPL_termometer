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
PORT ( clk,reset,enable: IN std_logic;
		data_out: out std_logic_vector(13 DOWNTO 0);
			ld_data,enable_cnt: out std_logic;
			sclk,sdata: inout std_logic);
end humidity_interface;

architecture Behavioral of humidity_interface is

TYPE state_t IS (power_up , idle, 
                 measure_request_1,measure_request_2,measure_request_3,measure_request_4,
                 measure_request_5,measure_request_6,measure_request_7,measure_request_8,
                 measure_request_9,measure_request_10,measure_request_11,measure_request_12,measure_request_13,
                 data_fetch_1 ,data_fetch_2 ,data_fetch_3 ,data_fetch_4 ,data_fetch_5 ,data_fetch_6 ,data_fetch_7 ,
                 data_fetch_8 ,data_fetch_9 ,data_fetch_10 ,data_fetch_11 ,data_fetch_12 ,data_fetch_13 ,data_fetch_14 ,
                 data_fetch_15 ,data_fetch_16 ,data_fetch_17 ,data_fetch_18 ,data_fetch_19 ,data_fetch_20 ,data_fetch_21 ,
                 data_fetch_22 ,data_fetch_23 ,data_fetch_24 ,data_fetch_25 ,data_fetch_26 ,data_fetch_27 ,data_fetch_28 ,
                 data_fetch_29 ,data_fetch_30 ,data_fetch_31 ,data_fetch_32 ,
                  wait_measure,update_duty_cycle_pwm,hang,gen); 
CONSTANT freq_sclk: integer := 500; --- 200 kHz

SIGNAL  curr_state,next_state: state_t;
SIGNAL counter_cl: std_logic_vector(    1+integer(ceil(log2(real(1000)))) DOWNTO 0);
SIGNAL counter: std_logic_vector(   8 DOWNTO 0);
SIGNAL counter_wait:  std_logic_vector(   1+integer(ceil(log2(real(12000000)))) DOWNTO 0);   

SIGNAL check_ack,read_sclk,reset_cnt_clk,sclk_rd,tc_wait,tc_cl,enable_wait,shf_en,clk_rd,clk_wr,clk_wr_neg,sclk_collision,reset_counter_cl,generate_clk,sdata_i,ack: std_logic;
SIGNAL sclk_i:STD_LOGIC :='0';
SIGNAL data: std_logic_vector(15 DOWNTO 0); -- first two bits are the status registers
begin


sclk_i_gen:PROCESS(clk)
BEGIN
IF (reset='1')THEN 
counter<=(OTHERS=>'0');
sclk_i<='0';
ELSIF(rising_edge(clk))THEN

		IF(to_integer(unsigned(counter))= freq_sclk/2-1) then
        sclk_i<=not(sclk_i);
        counter<=(OTHERS=>'0');
        ELSE
        counter<=std_logic_vector(unsigned(counter)+1);
		END IF;
	IF (check_ack='1' and sclk_i='1'  ) then
	ack<=sdata;
	end if;
END IF;
END PROCESS sclk_i_gen;


state_reg:PROCESS(reset,sclk_i)
BEGIN
IF(reset='1' ) THEN
data<=(OTHERS=>'0');
counter_wait<=(OTHERS=>'0');
curr_state<=power_up;
counter_cl<=(OTHERS=>'0');
ELSIF (rising_edge(sclk_i))THEN


 
  
IF( reset_counter_cl='1' ) THEN 
counter_cl<=(OTHERS=>'0');
ELSE
IF( to_integer(unsigned(counter_cl))=1000-1 )   THEN 
tc_cl<='1';
counter_cl<=(OTHERS=>'0');

ELSE
tc_cl<='0';
counter_cl<=std_logic_vector(unsigned(counter_cl)+1);
END IF;
END IF;
		
	curr_state<=next_state;	

	IF(enable_wait='1') THEN  -- 60 s 
		  IF(to_integer(unsigned(counter_wait))= 12000000-1) THEN
		  	counter_wait<=(OTHERS=>'0');
            tc_wait<='1';
		  ELSE 
		  tc_wait<='0';
		  counter_wait<=std_logic_vector(unsigned(counter_wait)+1);
		  END IF;
	ELSE
	
	counter_wait<=(OTHERS=>'0');
	END IF;
	
-- shift register for the data

IF (shf_en='1') THEN
data(15 DOWNTO 1)<=data(14 downto 0);
data(0)<=sdata;
END IF;
	
END IF;

END PROCESS state_reg;

cl:PROCESS(curr_state,tc_cl,ack,enable,data,tc_wait)
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
check_ack<='0';

CASE curr_state IS 
WHEN power_up=> IF ( tc_cl='1' ) THEN  -- 5 ms
							next_state<=idle;
						ELSE 
						next_state<=curr_state;
						END IF;

WHEN idle=> 	reset_counter_cl<='1';
					enable_cnt<='1';
					IF(enable='1') THEN
					next_state<=measure_request_1;
					ELSE 
					next_state<=curr_state;					
					END IF;

WHEN measure_request_1=> --  start bit

			       		generate_clk<='1';
                        next_state<=measure_request_3;
                        
 WHEN measure_request_3=> 
    						-- write address 
							sdata_i<='0'; -- first address bit msb
							generate_clk<='1';
                            next_state<=measure_request_4;
                        
WHEN measure_request_4=> sdata_i<='1';
                                generate_clk<='1';
                                 next_state<=measure_request_5;
                        
  WHEN measure_request_5=>        sdata_i<='0';
                                generate_clk<='1';
							
                                 next_state<=measure_request_6;
                        
WHEN measure_request_6=> sdata_i<='1';
                                generate_clk<='1';
								
                                
                                 next_state<=measure_request_7;
                                
                             
WHEN measure_request_7=>  sdata_i<='0';
                                generate_clk<='1';
								
                                 next_state<=measure_request_8;
                               
WHEN measure_request_8=>   sdata_i<='0';
								
                                generate_clk<='1';
                          
                                 next_state<=measure_request_9;
                          
WHEN measure_request_9=> sdata_i<='0';
                                generate_clk<='1';
								
                                 next_state<=measure_request_10;
                                
WHEN measure_request_10=>  -- write
                    sdata_i<='0';
                    generate_clk<='1';
								
                   
                                 next_state<=measure_request_11;
                   
WHEN measure_request_11=> -- ack
                            generate_clk<='1';
								
								check_ack<='1';
								
							    IF ( ack='1' ) THEN
								 next_state<=measure_request_11;
								ELSE
                                         next_state<=measure_request_12;
                                 END IF;
                                
                        --0';      	
WHEN measure_request_12=> 	-- wait 1 cc ( sclk)
                                 sdata_i<='Z';
							generate_clk<='0'	;
															
							
                                 next_state<=measure_request_13;
                                
WHEN measure_request_13=> 
								-- stop bit 
								sdata_i<='Z';
								
								generate_clk<='0';
								
                                 next_state<=wait_measure;
                            --
          
WHEN wait_measure=> -- wait for 30 sec 
							enable_wait<='1';
							enable_cnt<='0';
							
								generate_clk<='0';
							reset_counter_cl<='1';
							IF ( tc_wait='1') THEN 
							next_state<=data_fetch_1;
							ELSE 
							next_state<=curr_state;
							END IF;
WHEN data_fetch_1=>	--  start bit
                    sdata_i<='0';
					generate_clk<='0';
					
                    
                        next_state<=data_fetch_3;
                    
WHEN data_fetch_3=>	-- write address 
                    sdata_i<='0'; -- first address bit msb								
                    generate_clk<='1';
							
                        next_state<=data_fetch_4;
                    
WHEN data_fetch_4=>sdata_i<='1';
                    generate_clk<='1';
                    
                        next_state<=data_fetch_5;
                    
                       
WHEN data_fetch_5=>
                    sdata_i<='0';
                   generate_clk<='1';
                   
                        next_state<=data_fetch_6;
                        
WHEN data_fetch_6=>	
                        sdata_i<='1';
						generate_clk<='1';
						
                        next_state<=data_fetch_7;
                       
WHEN data_fetch_7=>		
						sdata_i<='0';
						generate_clk<='1';
						
                        next_state<=data_fetch_8;
                        
WHEN data_fetch_8=>		sdata_i<='0';
						generate_clk<='1';
						
                        next_state<=data_fetch_9;
                        
					

WHEN data_fetch_9=>		sdata_i<='0';
						generate_clk<='1';
                        next_state<=data_fetch_10;
                        

WHEN data_fetch_10=>sdata_i<='0';
					generate_clk<='1';
				
                        next_state<=data_fetch_11;
                      

WHEN data_fetch_11=>-- read
						sdata_i<='1';
						generate_clk<='1';
                        next_state<=data_fetch_12;
                        

WHEN data_fetch_12=>-- ack
						generate_clk<='1';
						check_ack<='1';
						
                                   IF ( ack='1' ) THEN
										next_state<=data_fetch_13;
										ELSE 
                                    next_state<=data_fetch_13;
										END IF;
								
WHEN data_fetch_13=> 		-- wait 1 cc ( sclk)
								sdata_i<='Z';
								generate_clk<='0'	;
                        next_state<=data_fetch_14;

                    

WHEN data_fetch_14=>-- msb status bit
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_15;
                    
                        
WHEN data_fetch_15=>-- lsb  status bit
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_16;
                        
WHEN data_fetch_16=>-- humidity 13
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_17;
                        
WHEN data_fetch_17=>-- humidity 12
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_18;
                        
WHEN data_fetch_18=>--  humidity 11
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_19;
                        
WHEN data_fetch_19=>-- humidity 10
								generate_clk<='1';
								shf_en<='1';								
								
                        next_state<=data_fetch_20;
                        
WHEN data_fetch_20=>-- humidity 9
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_21;
                        
WHEN data_fetch_21=>-- humidity 8
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_22;
                        
WHEN data_fetch_22=>-- master ack 
								sdata_i<='1';
								generate_clk<='1';
								
                        next_state<=data_fetch_23;
                        
  WHEN data_fetch_23=>-- humidity 7  
								
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_24;
                        
WHEN data_fetch_24=>	-- humidity 6 
							
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_25;
                        
WHEN data_fetch_25=>-- humidity 5
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_26;
                        
WHEN data_fetch_26=>-- humidity 4
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_27;
                        
WHEN data_fetch_27=>--  humidity 3
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_28;
                        
WHEN data_fetch_28=>-- humidity 2
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_29;
                        
WHEN data_fetch_29=>-- humidity 1
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_30;
                        
WHEN data_fetch_30=>-- humidity 0
								generate_clk<='1';
								shf_en<='1';
								
                        next_state<=data_fetch_31;
                        
WHEN data_fetch_31=>-- master n ack  ( stop communication otherwise slave will send the temp ) 
								sdata_i<='0';
								generate_clk<='1';
								
                        next_state<=data_fetch_32;
                        
                        
WHEN data_fetch_32=>		-- stop bit 
								sdata_i<='Z';
								generate_clk<='0';
								
                        next_state<=update_duty_cycle_pwm;
                        
                        
WHEN update_duty_cycle_pwm=> -- for 1 cc
                                        -- data 15  at 1 it is in command mode
                                        -- data 14 at 1  no new value
                                        data_OUT<=data(13 downto 0); -- raw data for the pwm generator
										IF(data(15)='0' AND data(14)='0') THEN
										-- new value and no command mode
										ld_data<='1';
										data_OUT<=data(13 downto 0); -- raw data for the pwm generator
										next_state<= update_duty_cycle_pwm;
										ELSE 
										next_state<=update_duty_cycle_pwm;
										END IF;
WHEN hang=> next_state<=curr_state;
							     data_OUT<="11"&x"FFF"; -- debug
							     --data_OUT<=(OTHERS=>'0');
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





-- sclk should be shifthed by one phase
-- tristate output
sclk<='0' WHEN (generate_clk='1' and sclk_i='1') ELSE 'Z';
	--	sclk_collision<='0';
sdata<='0' WHEN sdata_i='0' ELSE 'Z';

end Behavioral;

