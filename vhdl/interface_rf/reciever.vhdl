library ieee;
use ieee.std_logic_1164.all;

entity receiver is 
	generic(width: integer :=8);
	port(data :in std_logic;
		 clk  :in std_logic;
--		 rst  in: std_logic;
		 Outs :out std_logic_vector(width-1 downto 0));
end entity receiver;

architecture arc_receiver of receiver is
--	signal data_temp:std_logic_vector(width-1 downto 0);
begin
--	data_temp<=data;
	process(clk)
		
	begin
		if(rising_edge(clk)) then
			for i in 0 to width-1 loop
				Outs(i)<=data;
			end loop;
		end if;
	end process;
end architecture arc_receiver;