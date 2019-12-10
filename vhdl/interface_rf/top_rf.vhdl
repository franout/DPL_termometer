library ieee;
use ieee.std_logic_1164.all;

entity top_rf is 
	port(data_in :in std_logic_vector(8 downto 0);   ---come from switchs
		 clk  :in std_logic;
		 data_trans :out std_logic;                  ---give transmitter
		 data_recei :in std_logic;                   ---receive from receiver
		 data_out :out std_logic_vector(8 downto 0));---display on LED
end entity top_rf;

architecture arc of top_rf is 

	signal clk_1ms: std_logic;


	component clock_enable is
	port( clk: in std_logic;
		clk_1ms: out std_logic);
	end component;

	component transmitter is 
	generic(width: integer :=8);
	port(data :in std_logic_vector(width-1 downto 0);
		 clk  :in std_logic;
		 Outs :out std_logic);
	end component;

	component receiver is 
	generic(width: integer :=8);
	port(data :in std_logic;
		 clk  :in std_logic;
		 Outs :out std_logic_vector(width-1 downto 0));
	end component;


begin
	clk_com:component clock_enable
		port map ( clk=>clk, clk_1ms=>clk_1ms);
		
	transmitter_com: component transmitter
		generic map(width=>9)
		port map(data=>data_in,clk=>clk_1ms,Outs=>data_trans);
		
	receiver_com:component receiver
		generic map(width=>9)
		port map(data=>data_recei,clk=>clk_1ms,Outs=>data_out);
		
end architecture arc;
		
		