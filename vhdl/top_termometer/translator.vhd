----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:29 11/26/2019 
-- Design Name: 
-- Module Name:    translator - Behavioral 
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
USE ieee.numeric_std.ALL;


entity translator is
GENERIC ( n: integer:= 9);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1  downto 0);
		   dataout1: out std_logic_vector (N-2  downto 0);			-- minus - / plus +
		   dataout2: out std_logic_vector (N-2  downto 0);			-- most significant bit
		   dataout3: out std_logic_vector (N-2  downto 0);			-- second significant bit
		   dataout4: out std_logic_vector (N-2  downto 0);			-- least significant bit
		   dataout5: out std_logic_vector (N-2  downto 0);			-- dot
		   dataout6: out std_logic_vector (N-2  downto 0));			-- decimal
end translator;

architecture Behavioral of translator is



--signal dot: std_logic_vector(7 downto 0):=x"2E";
--signal x1,x2,x3,decimal_value,sign_value: std_logic_vector(7 DOWNTO 0);

signal datatem: natural range 0 to 128:=0;
signal datax1, datax2, datax3: natural range 0 to 10:=0;
begin


translation:process (data_in)
begin
IF(data_in(N-1)='1')THEN
-- ascii of minus
dataout1<=x"2D";					-- -
datatem<=(to_integer(unsigned(not(data_in(N-2 DOWNTO 1)))))+1;				--N=9		7-1 7bits

ELSE 
-- ascii of plus
dataout1<=x"2B";					-- +
datatem<=to_integer(unsigned(data_in(N-2 DOWNTO 1)));

END IF;

-- x1x2x3

datax1<=datatem / 100;
datax2<=(datatem mod 100) / 10;
datax3<=(datatem mod 100) mod 10;
dataout4(7 downto 4)<= "0011";
dataout4(3 downto 0)<=std_logic_vector(to_unsigned (datax3,4)); -- less significan value


dataout3(7 downto 4)<= "0011";
dataout3(3 downto 0)<=std_logic_vector(to_unsigned (datax2,4)); -- most significan value -1


dataout2(7 downto 4)<= "0011";
dataout2(3 downto 0)<=std_logic_vector(to_unsigned (datax1,4));-- most significan value

dataout5<="00101110";

-- decimal part
IF(data_in(0)='1')THEN
-- .5
dataout6<="00110101";--x"35";				--5
ELSE 
--  .0
dataout6<="00110000";--x"30";				--0
END IF;

end process translation;





end Behavioral;
