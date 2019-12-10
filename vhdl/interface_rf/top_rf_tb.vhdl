library ieee;
use ieee.std_logic_1164.all;

entity top_rf_tb is
end entity;
architecture arc of top_rf_tb is
	component top_rf is 
	port(data_in :in std_logic_vector(8 downto 0);   ---come from switchs
		 clk  :in std_logic;
		 data_trans :out std_logic;                  ---give transmitter
		 data_recei :in std_logic;                   ---receive from receiver
		 data_out :out std_logic_vector(8 downto 0));---display on LED
	end  component;
	
	signal clk_tb:std_logic;
	signal data_in_tb:std_logic_vector(8 downto 0);
	signal data_recei_tb:std_logic;
	signal data_trans_tb:std_logic;
	signal data_out_tb:std_logic_vector(8 downto 0);
	
begin
	
	clk_tb <= not clk_tb after 1 ns;
	 
	data_in_tb <= "111111111",
				  "111100010" after 100 ms,
			      "001010000" after 200 ms;
				  
	data_recei_tb<='1',
				   '0' after 15000 ns,
				   '1' after 25000 ns,
				   '0' after 35000 ns,
				   '1' after 45000 ns,
				   '0' after 55000 ns,
				   '1' after 65000 ns;
				   
	top_rf_com: component top_rf
		port map (data_in=>data_in_tb,clk=>clk_tb,data_trans=>data_trans_tb,data_out=>data_out_tb,data_recei=>data_recei_tb);
		
end arc;
