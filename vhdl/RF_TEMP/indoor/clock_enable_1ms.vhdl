library ieee;
use ieee.std_logic_1164.all;

entity clock_enable_1ms is
port( clk: in std_logic;
	  clk_1ms: out std_logic);
end clock_enable_1ms;

architecture beh of clock_enable_1ms is
signal cnt: natural range 0 to 99999 :=0;
begin
clk1us: process(clk)
begin
	IF(RISING_EDGE(CLK))THEN
		if(cnt= 99999) then
			clk_1ms<='1';
			cnt<=0;
		else
			clk_1ms<='0';
			cnt<=cnt+1;
		END IF;
	END IF;
end process;
end beh;