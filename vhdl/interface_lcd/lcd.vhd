LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LCD IS 

	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	   dataIN:         IN STD_LOGIC_VECTOR(7 downto 0);
		clk_enable:     IN STD_LOGIC;
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		
		enable_translator: OUT STD_LOGIC;
		dataOUT:        OUT STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             OUT STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC     );                      -- 0 write  /   1 rea

END LCD;

ARCHITECTURE arch_LCD OF LCD IS

	TYPE state_machine IS (INIT_1, INIT_2, INIT_3, INIT_4, INIT_5, INIT_6, IDLE, WRITING_MAX, WRITING_MIN, WRITING_NOW, IND_OUTD);
	signal state: state_machine :=INIT_1;
	signal init_count: integer := 0;
	signal writing_counter: integer := 0;
	signal clear_data_display: STD_LOGIC_VECTOR(7 downto 0) := "00000001";


BEGIN
	process (reset, clk,dataIn, clk_enable,enable_init,enable,ind_outd_select,state,init_count,writing_counter)
		begin
			if (reset ='1') then

				state <= INIT_1;

			elsif RISING_EDGE(clk) then 
				case state is

					when INIT_1 => 
							if ((clk_enable='1') and (enable_init='1')) then 

								if init_count<3 then
									dataOUT<="00110000";
									RS<='0';
									R_W<='0';
									done<='0';
									init_count<=init_count+1;
								
								else state<=INIT_2; end if;
								
							end if;


					when INIT_2 =>	

						if (  (enable_init='1')) then 
							
							dataOUT<="00111100";
							RS<='0';
							R_W<='0';
							done<='0';
							state<=INIT_3;
							
						end if;

					when INIT_3 =>	

						if ( (enable_init='1')) then 
							
							dataOUT<="00001000";
							RS<='0';
							R_W<='0';
							done<='0';
							state<=INIT_4;
							
						end if;

					when INIT_4 =>	

						if ( (enable_init='1')) then 
							
							dataOUT <= clear_data_display;
							RS<='0';
							R_W<='0';
							done<='0';
							state<=INIT_5;
							
						end if;
			
					when INIT_5 =>	

						if ( (enable_init='1')) then 
							
							dataOUT<="00000110";
							RS<='0';
							R_W<='0';
							done<='0';
							state<=INIT_6;
							
						end if;

					when INIT_6 =>	

						if (enable_init='1') then 
							
							dataOUT<="00001111";
							RS<='0';
							R_W<='0';
							done<='1';
							state<=IDLE;
							
						end if;

					when IDLE => 

							
								done<='0';
 								RS<='0';
								R_W<='0';
								dataOUT<="00111100"; --Function Set (Length, lines, font). Comment if not working
								
								if enable='1' then
									state<=WRITING_MAX;
								end if;

					when WRITING_MAX =>
								done<='0';
								case writing_counter is

									when 0 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4D"; 
										writing_counter<= writing_counter+1;      -- Sending M
									when 1 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"41";                           -- Sending A
										writing_counter<= writing_counter+1;

									when 2 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"58";                           -- Sending x
										writing_counter<= writing_counter+1;

									when 3 =>
										enable_translator<='1';									
										RS<='1';
										R_W<='0';
										dataOUT<=x"3A";                           -- Sending :
										writing_counter<= writing_counter+1;

									when 10 =>
										enable_translator<='0';
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"43";                           -- Sending C
										writing_counter<= writing_counter+1;
									when 11 =>									
										RS<='0';
										R_W<='0';
										dataOUT<="11000000";
										done<='1';
										state<=WRITING_MIN;
										writing_counter<= 0;
									when OTHERS =>		
										RS<='1';
										R_W<='0';
										dataOUT<=dataIN;                           
										writing_counter<= writing_counter+1;


								end case;
								 


					when WRITING_MIN =>


							done<='0';
								case writing_counter is

									when 0 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4D"; 
										writing_counter<= writing_counter+1;      -- Sending M
									when 1 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"49";                           -- Sending I
										writing_counter<= writing_counter+1;

									when 2 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4E";                           -- Sending N
										writing_counter<= writing_counter+1;

									when 3 =>	
										enable_translator<='1';
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"3A";                           -- Sending :
										writing_counter<= writing_counter+1;

									when 10 =>		
										enable_translator<='0';
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"43";                           
										writing_counter<= writing_counter+1;
									when 11 =>									
										RS<='0';
										R_W<='0';
										dataOUT<=clear_data_display;
										state<=WRITING_NOW;
										done<='1';
										writing_counter<= 0;

									when OTHERS =>
										RS<='1';
										R_W<='0';
										dataOUT<=dataIN; 
										writing_counter<= writing_counter+1;


								end case;
								 

			
					when WRITING_NOW=>
							done<='0';
								case writing_counter is

									when 0 =>
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4E"; 
										writing_counter<= writing_counter+1;      -- Sending N
									when 1 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- Sending O
										writing_counter<= writing_counter+1;

									when 2 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"57";                           -- Sending W
										writing_counter<= writing_counter+1;

									when 3 =>	
										enable_translator<='1';
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"3A";                           -- Sending :
										writing_counter<= writing_counter+1;

									when 10 =>
										enable_translator<='0';
									
										RS<='1';
										R_W<='0';
										dataOUT<=x"43";                           
										writing_counter<= writing_counter+1;
									when 11 =>									
										RS<='0';
										R_W<='0';
										dataOUT<="11000000";
										state<=IND_OUTD;
										done<='1';
										writing_counter<= 0;

									when OTHERS =>	
										enable_translator<='1';
									
										RS<='1';
										R_W<='0';
										dataOUT<=dataIN;                           
										writing_counter<= writing_counter+1;


								end case;
								 


				when IND_OUTD=>
								done<='0';
							    if(ind_outd_select='1')     then                          -- indoor
								case writing_counter is

									when 0 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"49"; 
										writing_counter<= writing_counter+1;      -- Sending I
									when 1 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4E";                           -- Sending N
										writing_counter<= writing_counter+1;

									when 2 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"44";                           -- Sending D
										writing_counter<= writing_counter+1;

									when 3 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- sending O
										writing_counter<= writing_counter+1;

									when 4 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- sending O
										writing_counter<= writing_counter+1;
									when 5 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"52";                           -- sending R
										state<=IDLE;
										done<='1';

										writing_counter<= 0;

									when OTHERS =>									
										RS<='0';
										R_W<='0';
                         		done<='1';
										writing_counter<= 0;
										state<=IDLE;

								end case;

							    elsif (ind_outd_select='0') then 

								case writing_counter is

									when 0 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F"; 
										writing_counter<= writing_counter+1;      -- Sending O
									when 1 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"55";                           -- Sending U
										writing_counter<= writing_counter+1;

									when 2 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"54";                           -- Sending T
										writing_counter<= writing_counter+1;

									when 3 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"44";                           -- sending D
										writing_counter<= writing_counter+1;

									when 4 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- sending O
										writing_counter<= writing_counter+1;

									when 5 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- sending O
										writing_counter<= writing_counter+1;

									when 6 =>									
										RS<='1';
										R_W<='0';
										dataOUT<=x"52";                           -- sending R
										state<=IDLE;
										                         							done<='1';
										writing_counter<= 0;

									when OTHERS =>									
										RS<='0';
										R_W<='0';
                         							done<='1';
										writing_counter<= 0;
										state<=IDLE;

								end case;


									
							    end if; 
					WHEN OTHERS=> state<=INIT_1;
				end case;
			end if;

	end process;	

END arch_LCD;	     
