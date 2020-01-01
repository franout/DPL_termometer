library ieee;
use ieee.std_logic_1164.all;

entity temout is
port (	 clk : in std_logic;
		 nrst:in std_logic;
		 led: out std_logic_vector(8 downto 0);
		 dq:  inout std_logic;            --ja[1]
--		 data_recei :in std_logic;        --ja[2]
		 data_trans :out std_logic
--		 dataout: out std_logic_vector(6 downto 0)
		 );	
		 
end temout;

architecture beh of temout is


signal clk_1ms: std_logic;
signal data: std_logic_vector(8 downto 0);
signal finish: std_logic;
component clock_enable_1ms is
	port( clk: in std_logic;
		clk_1ms: out std_logic);
	end component;
	
component temperature is
port (	clk: in std_logic;
		nrst:in std_logic;
		dq	:inout std_logic;
--		led: out std_logic;
		finish:	out std_logic;
		data:out std_logic_vector(8 downto 0));
end component temperature; 

component encode is

		port(reset		 : in  std_logic;
			detect_done : in std_logic;
			clk 		 : in  std_logic;
			Din  		 : in  std_logic_vector(8 downto 0);
			Dout 		 : out  std_logic);
	end component;

begin
clk_com:component clock_enable_1ms
		port map ( clk=>clk, clk_1ms=>clk_1ms);
		
tem: component temperature
	port map(clk=>clk, nrst=>nrst, dq=>dq, finish=>finish, data=>data);

encode_com: component encode
	port map(reset=>nrst,detect_done=>finish,clk=>clk_1ms,Din=>data,Dout=>data_trans);

led<=data;

end beh;