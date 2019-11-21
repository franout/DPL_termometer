----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:43 11/21/2019 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;



entity counter_comparison is

    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC;
			cnt_val: out std_logic);
end counter_comparison;

architecture Behavioral of counter_comparison is

SIGNAL cnt: std_logic;
begin


PROCESS(clk,reset)
BEGIN
IF(reset='1') THEN

cnt<='0';
tc<='0';
ELSE 
IF(clk='1' and clk'event) THEN
	IF( cnt='1') THEN
	tc<='1';
	cnt<='0';	
	ELSE 
	cnt<='1';
	tc<='0';
	END IF;


END IF;

END IF;
END PROCESS;

cnt_val<=cnt;
end Behavioral;

