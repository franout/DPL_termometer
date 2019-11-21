----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:27 11/21/2019 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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



entity mux is
GENERIC ( N: integer:=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0); -- s at 0 
           b : in  STD_LOGIC_VECTOR (N-1 downto 0); -- s at 1
           s : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end mux;

architecture Behavioral of mux is

begin

y<=b when s='1' else a;

end Behavioral;

