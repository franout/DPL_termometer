----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:15 11/21/2019 
-- Design Name: 
-- Module Name:    mux4_1 - Behavioral 
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



entity mux4_1 is
GENERIC(N:integer:=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           c : in  STD_LOGIC_VECTOR (N-1 downto 0);
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end mux4_1;

architecture Behavioral of mux4_1 is

begin

PROCESS(a,b,c,d,s)
BEGIN

CASE s IS
WHEN "01"=> y<=a;
WHEN "10"=> y<=b;
WHEN "11"=> y<=c;
WHEN OTHERS=> y<=d;
END CASE;

END PROCESS;


end Behavioral;

