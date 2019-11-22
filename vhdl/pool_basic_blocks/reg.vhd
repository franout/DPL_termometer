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
           clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0));
end entity reg;


architecture  Behavioral of reg is

SIGNAL data:  std_logic_vector(N-1 DOWNTO 0);

begin


PROCESS(clk,reset)
BEGIN
IF( reset='1') THEN
data_out<=(OTHERS=>'0');
data<=(OTHERS=>'0');
ELSE 
IF(clk='1' AND clk'EVENT) THEN
data_out<=data_in;
data<=data_in;
ELSE
data_out<=data;
END IF;
END IF;


END PROCESS;


end Behavioral;

