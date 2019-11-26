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



entity mux8_1 is
GENERIC(N:integer:=8);
   Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           c : in  STD_LOGIC_VECTOR (N-1 downto 0);
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  e : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  f : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  g : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  h : in  STD_LOGIC_VECTOR (N-1 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end mux8_1;

architecture Behavioral of mux8_1 is

begin

PROCESS(a,b,c,d,e,f,g,h,s)
BEGIN

CASE s IS
WHEN "000" =>y<=a;

WHEN "001" => y<=b;

WHEN "010" =>y<=c;

WHEN "011" =>y<=d;

WHEN "100" =>y<=e;

WHEN "101" =>y<=f;

WHEN OTHERS=> y<=h; -- or g
END CASE;

END PROCESS;


end Behavioral;

