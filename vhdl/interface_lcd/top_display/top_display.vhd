----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:26 11/26/2019 
-- Design Name: 
-- Module Name:    top_display - Behavioral 
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


entity top_display is
GENERIC(n: INTEGER := 9);
PORT(clk,reset,start_lcd,init_set_up,ind_outd_select: in std_logic;
		data_in: in std_logic_vector(N-1 DOWNTO 0);
		done_lcd: out std_logic;
		-- for lcd
		data_out: OUT std_logic_vector(N-2 downto 0);
		rs,r_w,enable: out std_logic
	);

end top_display;

architecture Behavioral of top_display is

COMPONENT LCD IS 

	PORT(	
		clk:            IN STD_LOGIC;
		reset:          IN STD_LOGIC;
	        dataIN:         IN STD_LOGIC_VECTOR(7 downto 0);
		clk_enable:     IN STD_LOGIC;
		enable_init:    IN STD_LOGIC;
		enable:         IN STD_LOGIC;                             -- called display in control unit
		ind_outd_select:IN STD_LOGIC;
		                     
		dataOUT:        OUT STD_LOGIC_VECTOR(7 downto 0);
		done:	        OUT STD_LOGIC;
		RS:             OUT STD_LOGIC;			       -- 0 instruction register (write) /  1 (write, read)
		R_W:            OUT STD_LOGIC     );                      -- 0 write  /   1 read

	     

END COMPONENT LCD;


component counter_clk_enable IS

Port(
		areset		:IN STD_LOGIC;
		clk		:IN STD_LOGIC;                                 
		clk_enable	:OUT STD_LOGIC);                               
		
end  component counter_clk_enable;

component  translator is
GENERIC ( n: integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1  downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-2 downto 0));
end component translator;

signal data_in_inter: std_logic_vector(N-2 DOWNTO 0);
signal clk_enable: std_logic;
begin

-- displaly comes from CU , enables goes to lcd
enable<=start_lcd;

interface: lcd PORT MAP(reset=>reset,clk=>clk,clk_enable=>clk_enable,
				enable=>start_lcd,dataIN=>data_in_inter,done=> done_lcd,
					enable_init=>init_set_up,ind_outd_select=>ind_outd_select ,dataOUT=>data_out,RS=> rs, R_W=>r_w);
translate_int: translator GENERIC MAP(N=>9) PORT MAP(start=>start_lcd, clk=>clk,reset=>reset,data_in=>data_in,data_out=> data_in_inter);
clk_enable_unit: counter_clk_enable PORT MAP (areset=>reset,clk=>clk,clk_enable=>clk_enable);


end Behavioral;

