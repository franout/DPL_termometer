library ieee;
use ieee.std_logic_1164.all;

entity clock_enable_2ms is
port( clk: in std_logic;
	  clk_2ms: out std_logic);
end clock_enable_2ms;

architecture beh of clock_enable_2ms is
signal cnt: natural range 0 to 50000 :=0;
signal clk_e: std_logic:='0';
begin
clk1us: process(clk)
begin
	IF(RISING_EDGE(CLK))THEN
		if(cnt= 49999) then
			clk_e<= not clk_e;
			cnt<=0;
		else
--			clk_1us<='0';
			cnt<=cnt+1;
		END IF;
	END IF;
clk_2ms<=clk_e;
end process;
end beh;