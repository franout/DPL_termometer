library ieee;

use ieee.std_logic_1164.all;



entity encode_tb is



end entity;



architecture tb_arc of encode_tb is

	component encode is

		port(reset		 : in  std_logic;

		 detect_done : in std_logic;

		

		 clk 		 : in  std_logic;

		 Din  		 : in  std_logic_vector(8 downto 0);

		 Dout 		 : out  std_logic);

	end component;

	

	signal reset_tb: std_logic;
	
	signal detect_done_tb : std_logic;

	signal clk_tb  : std_logic:='0';

	signal Din_tb  : std_logic_vector(8 downto 0);

	signal Dout_tb : std_logic;



begin

	encode_com: component encode

		port map(reset=>reset_tb,detect_done=>detect_done_tb,clk=>clk_tb,Din=>Din_tb,Dout=>Dout_tb);

		

	clk_tb<= not clk_tb after 5 ns;

	

	reset_tb <= '1',

				'0' after 100 ns,

				'1' after 200 ns;

				

	Din_tb   <= "000000000",
				"001000100" after 300 ns,
				"101110110" after 800 ns;
				
	detect_done_tb <= '0',
					  '1' after 300 ns,
					  '0' after 320 ns,
					  '1' after 800 ns,
					  '0' after 820 ns;
					
end tb_arc;
					  