library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

ENTITY  LCD is
	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	    dataIN:         IN STD_LOGIC_VECTOR(8 downto 0);
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		
		enable_lcd: OUT std_logic;
		dataOUT:        OUT STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             buffer STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC  );
END ENTITY  LCD;




architecture beh of LCD is 

---------------------state----------------------
type statetype is (power_up,idle,clear,setmode,switchmode,setfunction,
				first_line,second_line,
				writing_max_1,writing_max_2,writing_max_3,writing_max_4,writing_max_5,
				writing_max_6,writing_max_7, writing_max_8,writing_max_9,writing_max_10,writing_max_11,writing_max_12,
				writing_min_1,writing_min_2,writing_min_3,writing_min_4,writing_min_5,
				writing_min_6,writing_min_7,writing_min_8,writing_min_9,writing_min_10,writing_min_11,writing_min_12,
				writing_now_1,writing_now_2,writing_now_3,writing_now_4,writing_now_5,
				writing_now_6,writing_now_7,writing_now_8,writing_now_9,writing_now_10,writing_now_11,writing_now_12,
				print_ind_1,print_ind_2,print_ind_3,print_ind_4,print_ind_5,print_ind_6,
				print_outd_1,print_outd_2,print_outd_3,print_outd_4,print_outd_5,print_outd_6,print_outd_7,
				print_ind_outd_select,wait_4sec,first_line_second_print,
				done_print ,reset_screen,delay2ms,delay10ms,displayoff);

---------------------
signal state : statetype;
signal clk_2ms,generate_enable_lcd: std_logic:='0';
signal enable_translator: std_logic:='0';
signal cnt_e : std_logic_Vector(15 downto 0); 
signal data_in_inter: std_logic_Vector( 7 DOWNTO 0);
signal cnt20ms: natural range 0 to 13 :=0;
signal cnt4sec: natural range 0 to 2000-1;
signal flag: natural range 0 to 5 :=0;

COMPONENT translator is
GENERIC ( n: integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1  downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-2 downto 0));
end COMPONENT translator;



component clock_enable is
port( clk: in std_logic;
	  clk_2ms: out std_logic);
end component;

begin

clk_com:component clock_enable								--enable delay
	port map ( clk=>clk, clk_2ms=>clk_2ms);
	
	
	
process( clk_2ms,reset)
begin
	if(reset='1') then	---8-bit initialization can be added here
		state<=power_up;
		cnt20ms<=0;
		flag<=0;
        cnt4sec<=0;
	else
		if(rising_edge(clk_2ms)) then
		  r_w<='0';
		  rs<='0';
		  done<='0';
		  dataOUT<=(OTHERS=>'Z');
		  enable_translator<='0';
		  	generate_enable_lcd<='1'; 
			case(state)is                
			when power_up 	=> dataOUT<="ZZZZZZZZ";
			                if(cnt20ms =10 and enable_init='1') then
			                         cnt20ms<=0;
			                         state<=setfunction;
			                         flag<=0;
			                    else
			                         cnt20ms<=cnt20ms+1;
			                    end if;  
			when setfunction =>rs<='0';						--mode set 16*2 0011 1000 5*7 dot
							dataOUT(7 downto 5)<="001";
							dataOUT(4)<='1';    --Data length is 8
							dataOUT(3)<='1';       --two line
							dataOUT(2)<='0';        --front5x10
							dataOUT(1 downto 0)<="00";
							if(flag=0) then
							     state<=delay10ms;	
							     flag<=1;
							elsif( flag =1) then
							     state<=delay2ms;
							     flag<=2;
							elsif (flag =2) then
							      state<=setfunction;
							      flag<=3;
							elsif (flag = 3) then
							     state<=displayoff;
							     flag<=0;
							else
							     state<=idle;
							end if;
			when delay10ms =>   if(cnt20ms =5) then
			                         cnt20ms<=0;
			                         state<=setfunction;
			                    else
			                         cnt20ms<=cnt20ms+1;
									 dataOUT<="ZZZZZZZZ";
			                    end if; 
															
			when delay2ms    => state<=setfunction;
								dataOUT<="ZZZZZZZZ";	
			when displayoff => rs<='0';
			                   dataOUT<="00001000";
			                   state<=clear;
			when clear  =>  rs<='0';
							dataOUT<="00000001";
							state<=setmode;                     
			when setmode =>rs<='0';							-- cursor and shift 0000 0110 no shift
							dataOUT(7 downto 2)<="000001";
							dataOUT(1)<='1';        --cursor I
							dataOUT(0)<='0';        -- no shift 
							state<=switchmode;
			when switchmode =>rs<='0';						--switch and cursor 0000 1100
							dataOUT(7 downto 3)<="00001";
							dataOUT(2)<='1';        --open display
							dataOUT(1)<='0';        --open cursor
							dataOUT(0)<='0';       --blank cursor
							state<=idle;
							done<='1';
            when idle=>    
                        IF(enable='1') THEN
                        state<=first_line;
                        END IF;

			when first_line=>rs<='0';
							dataOUT(7 downto 0)<="10000000";					--80H address
							state<=writing_max_1;
							
			when writing_max_1 =>RS<='1';
								R_W<='0';
								dataOUT<=x"4D";       -- Sending M
								state<=writing_max_2;
		     
			when writing_max_2=>RS<='1';
								R_W<='0';
								dataOUT<=x"41";                           -- Sending A
								state<=writing_max_3;
			when writing_max_3=>RS<='1';
								R_W<='0';
								dataOUT<=x"58";                           -- Sending x
								state<=writing_max_4;
			when writing_max_4=>RS<='1';
								R_W<='0';
								dataOUT<=x"3A";                           -- Sending :
								state<=writing_max_5;
								enable_translator<='1';
			when writing_max_5=>RS<='1';      -- sign 
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_6;
			when writing_max_6=>RS<='1';    --- x1
								R_W<='0'; 
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_7;
			when writing_max_7=>RS<='1';     --- x2
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_8;
			when writing_max_8=>RS<='1';     -- x3
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_9;
			when writing_max_9=>RS<='1';     --- dot 
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_10;
		  when writing_max_10=>rs<='1'; --- decimal
		                          R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_max_11;
			when writing_max_11=>RS<='1';     
								R_W<='0';
								dataOUT<=x"20";                           -- Sending a space
								state<=writing_max_12;
			when writing_max_12=>RS<='1';     
								R_W<='0';
								dataOUT<=x"43";                           -- Sending C
								state<=second_line;	
			when second_line=>rs<='0';
			                 done<='1';
							dataOUT(7 downto 0)<="11000000";					--C0H second line address
							state<=writing_min_1;
							
			when writing_min_1=>RS<='1';
								R_W<='0';
								dataOUT<=x"4D";       -- Sending M
								state<=writing_min_2;
			when writing_min_2=>RS<='1';
								R_W<='0';
			                     dataOUT<=x"49";                           -- Sending I
			                     state<=writing_min_3;
			when writing_min_3=>RS<='1';
								R_W<='0';
								dataOUT<=x"4E";                           -- Sending N
								 state<=writing_min_4;
			when writing_min_4=>RS<='1';
								R_W<='0';
								dataOUT<=x"3A";                           -- Sending :								
								 state<=writing_min_5;
								 enable_translator<='1';
			when writing_min_5=>RS<='1';
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
							 state<=writing_min_6;
			when writing_min_6=>RS<='1';
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_min_7;
			when writing_min_7=>RS<='1';
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								 state<=writing_min_8;
			when writing_min_8=>RS<='1';
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_min_9;
			when writing_min_9=>RS<='1';
								R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_min_10;
			when writing_min_10=> rs<='1';
			                     R_W<='0';
								enable_translator<='1';
								dataOUT<=data_in_inter;
								state<=writing_min_11;
			when writing_min_11=>RS<='1';     
								R_W<='0';
								dataOUT<=x"20";                           -- Sending a space
								state<=writing_min_12;
			when writing_min_12=>RS<='1';
								R_W<='0';
                				dataOUT<=x"43";                           -- Sending C
								state<=wait_4sec;
            when wait_4sec=>-- wait for 3 sec before switching
							generate_enable_lcd<='0'; 
						      IF(cnt4sec=2000-1)THEN
							state<=reset_screen;
							cnt4sec<=0;
							ELSE
							state<=wait_4sec;
							cnt4sec<=cnt4sec+1;
							END IF;
			   				
							
            when reset_screen=>rs<='0';
							dataOUT(7 downto 0)<="00000001";
							state<=  first_line_second_print;
							
		  when first_line_second_print=>
		                      rs<='0';
                            done<='1';
							dataOUT(7 downto 0)<="10000000";					--80H address
							state<=  writing_now_1;           
            when writing_now_1=>RS<='1';
								R_W<='0';
								state<=writing_now_2;
                                dataOUT<=x"4E";      -- Sending N
            when writing_now_2=>RS<='1';
								R_W<='0';
								state<=writing_now_3;
                                dataOUT<=x"4F";                           -- Sending O

            when writing_now_3=>RS<='1';
								R_W<='0';
								state<=writing_now_4;
                                  dataOUT<=x"57";                           -- Sending W

            when writing_now_4=>RS<='1';
								R_W<='0';
								state<=writing_now_5;
                                dataOUT<=x"3A";                           -- Sending :
								enable_translator<='1';		
            when writing_now_5=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_6;
            when writing_now_6=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_7;
            when writing_now_7=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_8;
            when writing_now_8=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_9;
            when writing_now_9=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_10;
			when writing_now_10=>RS<='1';
								R_W<='0';
								enable_translator<='1';		
	           					dataOUT<=data_in_inter;
								state<=writing_now_11;
            when writing_now_11=>RS<='1';     
								R_W<='0';
								dataOUT<=x"20";                           -- Sending a space
								state<=writing_now_12;
            when writing_now_12=> RS<='1';
								R_W<='0';
                				dataOUT<=x"43";                           -- Sending C
								state<=print_ind_outd_select;    
            
            
           when print_ind_outd_select=> 
                                -- select second line 
                                dataOUT(7 downto 0)<="11000000";					--C0H second line address
                                rs<='0';
                                
                                IF (ind_outd_select='1') THEN -- indoor
                                state<=print_ind_1;
                                ELSE -- outdoor
                                state<=print_outd_1;
                                END IF;
            when print_ind_1=>	RS<='1';
								R_W<='0';
								dataOUT<=x"49";  -- Sending I
								state<=print_ind_2;
            when print_ind_2=>RS<='1';
										R_W<='0';
										dataOUT<=x"4E";                           -- Sending N
										state<=print_ind_3;
            when print_ind_3=>										RS<='1';
										R_W<='0';
										dataOUT<=x"44";                           -- Sending D
										state<=print_ind_4;
            when print_ind_4=>										RS<='1';
    									R_W<='0';
    									dataOUT<=x"4F";                           -- sending O
                                        state<=print_ind_5;
            when print_ind_5=>										RS<='1';
										R_W<='0';
										dataOUT<=x"4F";                           -- sending O
                                        state<=print_ind_6;

            when print_ind_6=>			RS<='1';
										R_W<='0';
										dataOUT<=x"52";                           -- sending R
                                        state<=done_print;
            when print_outd_1=>RS<='1';
								R_W<='0';
								dataOUT<=x"4F";  -- Sending O
								state<=print_outd_2;
            when print_outd_2=>RS<='1';
								R_W<='0';
								dataOUT<=x"55";  -- Sending U
								state<=print_outd_3;
            when print_outd_3=>RS<='1';
								R_W<='0';
								dataOUT<=x"54";  -- Sending T
								state<=print_outd_4;
            when print_outd_4=>RS<='1';
								R_W<='0';
								dataOUT<=x"44";  -- Sending D
								state<=print_outd_5;
            when print_outd_5=>RS<='1';
								R_W<='0';
								dataOUT<=x"4F";  -- Sending O
								state<=print_outd_6;
            when print_outd_6=>RS<='1';
								R_W<='0';
								dataOUT<=x"4F";  -- Sending O
								state<=print_outd_7;
            when print_outd_7=>RS<='1';
								R_W<='0';
								dataOUT<=x"52";  -- Sending R
								state<=done_print;

            when done_print=> done<='1';
                               state<=idle;
              
			when others	  => state<=power_up;
							
			end case;
		end if;
	end if;
end process;


enable_lcd<=not(clk_2ms) when generate_enable_lcd='1' else '0';

-- instantiate translator with same clock of 2 ms
translate_int: translator GENERIC MAP(N=>9) PORT MAP(start=>enable_translator, 
								clk=>clk_2ms,reset=>reset,data_in=>dataIN,
								data_out=> data_in_inter);

end beh;
							
	