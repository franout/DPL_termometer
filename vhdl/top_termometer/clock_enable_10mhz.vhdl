library ieee;
use ieee.std_logic_1164.all;

entity clock_enable_10mhz is
port( clk: in std_logic;
	  clk_10mhz: out std_logic);
end clock_enable_10mhz;

architecture beh of clock_enable_10mhz is
signal cnt: natural range 0 to 10 :=0;
signal clk_e: std_logic:='0';
begin
clk10mhz: process(clk)
begin
	IF(RISING_EDGE(CLK))THEN
		if(cnt= 9) then
			clk_e<= not clk_e;
			cnt<=0;
		else
--			clk_1us<='0';
			cnt<=cnt+1;
		END IF;
	END IF;
clk_10mhz<=clk_e;
end process;
end beh;