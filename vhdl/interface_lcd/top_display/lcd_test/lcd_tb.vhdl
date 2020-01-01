
library ieee;
use ieee.std_logic_1164.all;

entity lcd_tb is

end lcd_tb;

architecture beh of lcd_tb is
component LCD_try is
port(clk: in std_logic;
	 rst: in std_logic;
--	 data_in: in std_logic_vector(7 downto 0);
	 LCD_E,LCD_RW,LCD_RS:out std_logic;
	 LCD_DB: out std_logic_vector(7 downto 0));
end component LCD_try;

signal clk_tb: std_logic :='0';
signal rst_tb: std_logic;
signal LCD_E_tb :std_logic;
signal LCD_RS_tb: std_logic;
signal LCD_RW_tb: std_logic;
signal LCD_DB_tb: std_logic_vector(7 downto 0);

begin
LCD_try_comp: component LCD_try port map (clk => clk_tb, rst => rst_tb, LCD_E => LCD_E_tb, LCD_RW => LCD_RW_tb, LCD_RS => LCD_RS_tb, LCD_DB => LCD_DB_tb);


clk_pro: process
begin
wait for 10 ns;
	clk_tb <= not ( clk_tb );

end	process clk_pro;

rst_tb<= '0',
		 '1'	after 200 ns;
end beh;