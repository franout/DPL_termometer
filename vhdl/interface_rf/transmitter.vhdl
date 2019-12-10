library ieee;
use ieee.std_logic_1164.all;

entity transmitter is 
	generic(width: integer :=8);
	port(data :in std_logic_vector(width-1 downto 0);
		 clk  :in std_logic;
--		 rst  in: std_logic;
		 Outs :out std_logic);
end entity transmitter;

architecture arc_transmitter of transmitter is
--	signal data_temp:std_logic_vector(width-1 downto 0);
begin
--	data_temp<=data;
	process( clk)
		
	begin
		if(rising_edge(clk)) then
			for i in 0 to width-1 loop
				Outs<=data(i);
			end loop;
		end if;

	end process;
end architecture arc_transmitter;
		 