library ieee;
use ieee.std_logic_1164.all;

entity LCD_try is
port(clk: in std_logic;
	 rst: in std_logic;
--	 data_in: in std_logic_vector(7 downto 0);
	 LCD_E,LCD_RW,LCD_RS:out std_logic;
	 LCD_DB: out std_logic_vector(7 downto 0));
end entity;

architecture arc of LCD_try is 

---------------------state----------------------
type statetype is (idle,clear,setmode,switchmode,setfunction,setddram1,setddram2,data12,data11,data21,data22,delay2ms,delay10ms,displayoff);

---------------------
signal state : statetype;
signal state_data: std_logic_vector(9 downto 0);
signal address: std_logic_vector(5 downto 0);
signal clk_2ms: std_logic;
signal dtemp:	std_logic_vector(17 downto 0);
signal cnt20ms: natural range 0 to 13 :=0;
signal flag: natural range 0 to 5 :=0;
------------------character set here------------------
--function ddram (
--  n : std_logic_vector(5 downto 0))
--  return dis: std_logic_vector(7 downto 0) is
-- begin
--  case n is
--    when '0' => bin := '0';
--    when '1' => bin := '1';
--    when 'x' => bin := '0';
--    when others => assert (false) report "no binary character read" severity failure;
--  end case;
 --   return dis;
 --end bin;
 ----------------------clk set here---------------------
component clock_enable is
port( clk: in std_logic;
	  clk_2ms: out std_logic);
end component;

begin

clk_com:component clock_enable								--enable delay
	port map ( clk=>clk, clk_2ms=>clk_2ms);
process(clk)
begin
	if(rst='0') then
		dtemp<=(others=>'0');
	else
		dtemp(0)<=clk_2ms;
		dtemp(1)<=dtemp(0);
		dtemp(2)<=dtemp(1);
		dtemp(3)<=dtemp(2);
		dtemp(4)<=dtemp(3);
		dtemp(5)<=dtemp(4);
		dtemp(6)<=dtemp(5);
		dtemp(7)<=dtemp(6);
		dtemp(8)<=dtemp(7);
		dtemp(9)<=dtemp(8);
		dtemp(10)<=dtemp(9);
		dtemp(11)<=dtemp(10);
		dtemp(12)<=dtemp(11);
		dtemp(13)<=dtemp(12);
		dtemp(14)<=dtemp(13);
		dtemp(15)<=dtemp(14);
		dtemp(16)<=dtemp(15);
		dtemp(17)<=dtemp(16);
		
		
	end if;
end process;
	
process( clk_2ms)
begin
	LCD_RW<='0';
	if(rst='0') then	---8-bit initialization can be added here
		state<=idle;
		LCD_DB<="00000000";
		LCD_RS<='0';
		cnt20ms<=0;
		flag<=0;
--		LCD_RW<='0';
--		LCD_E<='0';
	else
		if(rising_edge(clk_2ms)) then
			case(state)is                
			when idle 	=> LCD_DB<="ZZZZZZZZ";
			                if(cnt20ms =10) then
			                         cnt20ms<=0;
			                         state<=setfunction;
			                         flag<=0;
			                    else
			                         cnt20ms<=cnt20ms+1;
			                    end if;  
			when setfunction =>LCD_RS<='0';						--mode set 16*2 0011 1000 5*7 dot
							LCD_DB(7 downto 5)<="001";
							LCD_DB(4)<='1';    --Data length is 8
							LCD_DB(3)<='1';       --two line
							LCD_DB(2)<='0';        --front5x10
							LCD_DB(1 downto 0)<="00";
							--flag<=flag+1;
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
									 LCD_DB<="ZZZZZZZZ";
			                    end if; 
															
			when delay2ms    => state<=setfunction;
								LCD_DB<="ZZZZZZZZ";	
			when displayoff => LCD_RS<='0';
			                   LCD_DB<="00001000";
			                   state<=clear;
			when clear  =>  LCD_RS<='0';
							LCD_DB<="00000001";
							state<=setmode;                     
			when setmode =>LCD_RS<='0';							-- cursor and shift 0000 0110 no shift
							LCD_DB(7 downto 2)<="000001";
							LCD_DB(1)<='1';        --cursor I
							LCD_DB(0)<='0';        --no shift 
							state<=switchmode;
			when switchmode =>LCD_RS<='0';						--switch and cursor 0000 1100
							LCD_DB(7 downto 3)<="00001";
							LCD_DB(2)<='1';        --open display
							LCD_DB(1)<='0';        --open cursor
							LCD_DB(0)<='0';       --blank cursor
							state<=setddram1;


--			when shift =>LCD_RS<='0';
--							LCD_DB(7 downto 4)<="0001";
--							LCD_DB(3)<=        --shift cursor
--							LCD_DB(2)<=        --left_shift
--							LCD_DB(1 downto 0)<="00";
--							state<=setddram1
			when setddram1=>LCD_RS<='0';
							LCD_DB(7 downto 0)<="10000000";					--80H address
							state<=data11;
			when data11	  =>LCD_RS<='1';
							LCD_DB(7 downto 0)<="11000001";					--first line, first data
							state<=data12;
			when data12	  =>LCD_RS<='1';
							LCD_DB(7 downto 0)<="00100001";					--first line, second data
							state<=setddram2;		
							
			when setddram2=>LCD_RS<='0';
							LCD_DB(7 downto 0)<="11000000";					--C0H second line address
							state<=data21;
			when data21	  =>LCD_RS<='1';
							LCD_DB(7 downto 0)<="01100001";					--second line, first data
							state<=data22;
			when data22	  =>LCD_RS<='1';
							LCD_DB(7 downto 0)<="11000010";					--second line, second data
							state<=setddram1;	
			when others	  => state<=idle;
							
--			when writeram1=>if(address<=15) then
--								LCD_RS<='1';
--								LCD_DB<=data_in;
--								state <=writeram1;
--							else
--								LCD_RS<='0';
--								state<=setddram2;
--							end if;
--			when writeram1=>if(address<=31) then
--								LCD_RS<='1';
--								LCD_DB<=data_in;
--								address<=address+1;
--								state <=writeram2;
--							else
--								LCD_RS<='0';
--								state<=shift;
--								address<=0;	
--							end if;
			end case;
		end if;
	end if;
end process;
LCD_E<=dtemp(6);
end arc;
							
	