library ieee;
use ieee.std_logic_1164.all;

entity temperature_tb is 

end entity;

architecture arc of temperature_tb is
	component temperature is
		port (	clk: in std_logic;
		nrst:in std_logic;
		in_out_door:in std_logic;
		dq	:inout std_logic;
		led1: out std_logic;
		data:out std_logic_vector(8 downto 0));
	end component;
	
	signal clk_tb:std_logic:='0';
	signal nrst_tb: std_logic:='1';
	signal in_out_door_tb:std_logic;
	signal dq_tb:std_logic:='Z';
	signal led1_tb:std_logic:='0';
	signal data_tb:std_logic_vector(8 downto 0);
	
begin
	temperature_comp:component temperature
		port map (clk=>clk_tb,nrst=>nrst_tb,in_out_door=>in_out_door_tb,dq=>dq_tb,led1=>led1_tb,data=>data_tb);
		
	 clk_tb <= not clk_tb after 5 ns;
	 
	 nrst_tb <= '1',
		     '0' after 10 ns,
			 '1' after 20 ns,
			 '0' after 200010 ns,
			 '1' after 200020 ns;
	in_out_door_tb <= '0',
					  '1' after 190000 ns;
			
	dq_tb <= '0' after 5180 ns,
			 'Z' after 6000 ns,
			 '0' after 77114 ns,
			 'Z' after 77900 ns,
			 '0' after 204800 ns,
			 'Z' after 205600 ns,
			 '0' after 277114 ns,
			 'Z' after 277900 ns;
			 
			
		
end arc;
	
	