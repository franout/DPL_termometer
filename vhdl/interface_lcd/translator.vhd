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
GENERIC ( n: integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1  downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-2 downto 0));
end translator;

architecture Behavioral of translator is


COMPONENT mux8_1 is
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
end COMPONENT mux8_1;


COMPONENT counter is
GENERIC(n:INTEGER:=8);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC;
			cnt_val: out std_logic_vector(N-1 DOWNTO 0));
end COMPONENT counter;

signal dot: std_logic_vector(7 downto 0):=x"2E";
signal x1,x2,x3,decimal_value,sign_value: std_logic_vector(7 DOWNTO 0);
signal cnt_val: std_logic_vector(2 DOWNTO 0);
signal reset_i: std_logic;
signal dummy: std_logic;
begin

reset_i<='0' WHEN start='1' else '1';

counter_select: counter  GENERIC MAP(N=>3)  PORT MAP(clk=>clk,reset=>reset_i,cnt_val=>cnt_val,tc=>dummy);

mux:  mux8_1 GENERIC MAP (N=>8) PORT MAP(a=>sign_value,b=>x1,c=>x2,d=>x3,e=>dot,f=>decimal_value,
g=>(OTHERS=>'0'),h=>(OTHERS=>'0'),s=>cnt_val,y=>data_out);


translation:process (data_in)
variable remainder,quotient: unsigned(7 DOWNTO 0);
begin
IF(data_in(N-1)='1')THEN
-- ascii of minus
sign_value<=x"2D";
remainder:=unsigned(not(signed(data_in(N-1 DOWNTO 1)))+1);
quotient:= unsigned(not(signed(data_in(N-1 DOWNTO 1)))+1);
ELSE 
-- ascii of plus
sign_value<=x"2B";
remainder:=unsigned(data_in(N-1 DOWNTO 1));
quotient:=unsigned(data_in(N-1 DOWNTO 1));
END IF;

-- x1x2x3
remainder:= remainder mod 10;
quotient:=(quotient/10);
x3<=std_logic_vector(x"30"+remainder); -- less significan value
remainder:= quotient mod 10;
quotient:= ((quotient) / 10);

x2<=std_logic_vector(X"30"+remainder); -- most significan value -1
remainder:= quotient mod 10;
--quotient:= quotient /10; not needed 
x1<=std_logic_vector(X"30"+remainder); -- most significan value



-- decimal part
IF(data_in(0)='1')THEN
-- .5
decimal_value<=x"35";
ELSE 
--  .0
decimal_value<=x"30";
END IF;

end process translation;





end Behavioral;
