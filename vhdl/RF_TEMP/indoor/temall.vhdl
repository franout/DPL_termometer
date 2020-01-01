library ieee;
use ieee.std_logic_1164.all;

entity temall is
port	(clk : in std_logic;
		 nrst:in std_logic;
		 in_out: in std_logic;
		 led: out std_logic_vector(8 downto 0);
		 dq:  inout std_logic;            --ja[1]
		 data_recei :in std_logic;        --ja[2]
--		 data_outdoor :in std_logic_vector(8 downto 0);
		 finish:	out std_logic
--		 dataout: out std_logic_vector(6 downto 0)
		 );	
end  temall;

architecture beh of temall is

signal finishin:		std_logic;
signal data_indoor:		std_logic_vector(8 downto 0);
signal finishout:	std_logic;
signal clk_1ms:		std_logic;
signal data_outdoor:		std_logic_vector(8 downto 0);
component temperature is
port (	clk: in std_logic;
		nrst:in std_logic;
		dq	:inout std_logic;
--		led: out std_logic;
		finish:	out std_logic;
		data:out std_logic_vector(8 downto 0));
		
end component temperature;

component clock_enable_1ms is
	port( clk: in std_logic;
		clk_1ms: out std_logic);
	end component;

	component decode is

		port(reset		 : in  std_logic;
			clk 		 : in  std_logic;
			Din  		 : in  std_logic;
			finish		 : out std_logic;
			Dout 		 : out  std_logic_vector(8 downto 0));
	end component;
	
	
begin
	clk_com:component clock_enable_1ms
		port map ( clk=>clk, clk_1ms=>clk_1ms);
		
	decode_com: component decode
		port map(reset=>nrst,clk=>clk_1ms,Din=>data_recei,finish=>finishout, Dout=>data_outdoor);
	
tem: component temperature
	port map(clk=>clk, nrst=>nrst, dq=>dq, finish=>finishin, data=>data_indoor);	
	
led<= data_indoor when in_out='1'	else
	  data_outdoor;
	  
finish<= finishin when in_out='1' else
		 finishout;
end beh;