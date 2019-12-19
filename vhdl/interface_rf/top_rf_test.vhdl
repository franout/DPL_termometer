library ieee;
use ieee.std_logic_1164.all;

entity top_rf_test is 
	port(data_in :in std_logic_vector(8 downto 0);   ---come from switchs
		 clk  :in std_logic;
		 reset :in std_logic; 
		 detect_done: in std_logic;
		 data_recei :in std_logic;  
		 data_trans :out std_logic; 		 ---receive from receiver
		 data_out :out std_logic_vector(8 downto 0));---display on LED
end entity top_rf_test;

architecture arc of top_rf_test is 

	signal clk_1ms: std_logic;
	signal data_transf: std_logic;

	component clock_enable is
	port( clk: in std_logic;
		clk_1ms: out std_logic);
	end component;

	component decode is

		port(reset		 : in  std_logic;
			clk 		 : in  std_logic;
			Din  		 : in  std_logic;
			Dout 		 : out  std_logic_vector(8 downto 0));
	end component;

	component encode is

		port(reset		 : in  std_logic;
			detect_done : in std_logic;
			clk 		 : in  std_logic;
			Din  		 : in  std_logic_vector(8 downto 0);
			Dout 		 : out  std_logic);
	end component;


begin
	clk_com:component clock_enable
		port map ( clk=>clk, clk_1ms=>clk_1ms);
		
	decode_com: component decode
		port map(reset=>reset,clk=>clk_1ms,Din=>data_recei,Dout=>data_out);
		
	encode_com: component encode
		port map(reset=>reset,detect_done=>detect_done,clk=>clk_1ms,Din=>data_in,Dout=>data_trans);
		
end architecture arc;