----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:11 12/18/2019 
-- Design Name: 
-- Module Name:    try_v3 - Behavioral 
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


entity try_v3 is
port (main_clk,RESET,enable: in std_logic;
		enable_lcd: OUT std_logic;
		dataOUT:        inout STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             OUT STD_LOGIC;			    
		R_W:            OUT STD_LOGIC 
		);
end try_v3;

architecture Behavioral of try_v3 is



COMPONENT  lcd_v3_as is
GENERIC (clk_val:integer := 10); -- 100 mhz
	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	   dataIN:         IN STD_LOGIC_VECTOR(7 downto 0);
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		
		enable_translator: OUT STD_LOGIC;
		enable_lcd: OUT std_logic;
		dataOUT:        inout STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             OUT STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC     );                      -- 0 write  /   1 read

	     

end COMPONENT lcd_v3_as;

component clock_generator
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

SIGNAL dataIN:std_logic_vector(7 downto 0):=(OTHERS=>'0'); 
SIGNAL ind_outd_select: std_logic :='0';
SIGNAL enable_translator,clk:std_logic;
SIGNAL enable_init_i:std_logic:='1';
signal enable_i: std_logic:='1';
begin
enable_init_i<='1';
dataIn<=(OTHERS=>'0');
ind_outd_select<='0';
enable_translator<='0';
test : lcd_v3_as GENERIC MAP (100) PORT MAP (clk=>clk,reset=>reset,dataIN=>dataIN,enable=>enable,                
		ind_outd_select=>ind_outd_select, 
enable_init=>enable_init_i,		
		enable_translator=>enable_translator,
		enable_lcd=>enable_lcd,
		dataOUT=>dataOUT,
		done=>done,rs=>rs,r_w=>r_w  );

ppl: clock_generator
  port map
   (-- Clock in ports
    CLK_IN1 => main_clk,
    -- Clock out ports
    CLK_OUT1 => clk,
    -- Status and control signals
    RESET  => RESET
    );
end Behavioral;



