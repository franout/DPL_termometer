library ieee;
use ieee.std_logic_1164.all;

entity clock_enable is
port( clk: in std_logic;
	  clk_1us: out std_logic);
end clock_enable;

architecture beh of clock_enable is
signal cnt: natural range 0 to 99 :=0;
begin
clk1us: process(clk)
begin
	if(cnt= 99) then
		clk_1us<='1';
		cnt<=0;
	else
		clk_1us<='0';
		cnt<=cnt+1;
end process;
end beh;