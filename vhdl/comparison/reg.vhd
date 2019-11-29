----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:32 11/21/2019 
-- Design Name: 
-- Module Name:    register - Behavioral 
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



entity reg is
GENERIC ( N : integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk, enable : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0));
end entity reg;


architecture  Behavioral of reg is

SIGNAL data: std_logic_vector(N-1 DOWNTO 0);
begin


PROCESS(clk,reset)
BEGIN
IF( reset='1') THEN
data<=(OTHERS=>'0');
ELSIF(clk='1' AND clk'EVENT) THEN

	IF (enable='1') THEN 
	data<=data_in;
	ELSE 
	data<=data;
	END IF;
END IF;


END PROCESS;
data_out<=data;

end Behavioral;

