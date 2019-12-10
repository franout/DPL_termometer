library ieee;
use ieee.std_logic_1164.all;

entity clock_enable is
port( clk: in std_logic;
	  clk_1ms: out std_logic);
end clock_enable;

architecture beh of clock_enable is
signal cnt: natural range 0 to 999999 :=0;
begin
clk1ms: process(clk)
begin
	if(rising_edge(clk)) then 
		if(cnt= 999999) then
			clk_1ms<='1';
			cnt<=0;
		else
			clk_1ms<='0';
			cnt<=cnt+1;
		end if;
	end if;
end process;
end beh;
