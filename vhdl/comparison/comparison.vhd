----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:25 11/20/2019 
-- Design Name: 
-- Module Name:    comparison - Behavioral 
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



entity comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				init_set_up,in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC;
           done_comparison : out  STD_LOGIC;
           select_data : in  STD_LOGIC_VECTOR (1 downto 0));
end comparison;

architecture Behavioral of comparison is

begin






end Behavioral;

