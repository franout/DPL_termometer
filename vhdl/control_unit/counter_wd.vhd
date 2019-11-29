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



entity counter_wd is
generic ( N : integer := 8;
			MAX_VAL: integer :=200);
    Port ( clk : in  STD_LOGIC;
				enable: in std_logic;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC);
end counter_wd;

architecture Behavioral of counter_wd is

SIGNAL cnt: std_logic_vector(N-1 DOWNTO 0);
begin


PROCESS(clk,reset)
BEGIN
IF(reset='1') THEN

cnt<=(OTHERS=>'0');
tc<='0';
ELSE 
IF(clk='1' and clk'event) THEN
IF (enable='1') THEN 
	IF( to_integer(unsigned(cnt))>=MAX_VAL-1) THEN
	tc<='1';
	cnt<=(OTHERS=>'0');	
	ELSE 
	cnt<=std_logic_vector(unsigned(cnt)+1);
	tc<='0';
	END IF;
	
	
ELSE 

cnt<=(OTHERS=>'0');
END IF;
	
END IF;


END IF;
END PROCESS;


end Behavioral;

