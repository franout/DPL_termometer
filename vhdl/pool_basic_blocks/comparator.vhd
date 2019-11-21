----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:51 11/21/2019 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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


entity comparator is
GENERIC ( N: integer :=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           enable : in  STD_LOGIC; -- enable comparison i.e. it is the start_computation signal 
           res : out  STD_LOGIC); -- result of the comparison 1-> a>= b , 0 -> a<b 
end comparator;

architecture Behavioral of comparator is

begin


PROCESS(a,b,enable)
BEGIN
IF(enable='1')THEN
	IF(unsigned(a)>=unsigned(b))THEN
	res<='1';
	ELSE	
	-- < and other beh.
	res<='0';
	END;
END IF;
END PROCESS;


end Behavioral;

