--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:11 12/15/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/humidity_sensosor_interface/tb_i2c.vhd
-- Project Name:  humidity_sensosor_interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: humidity_interface
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tb_i2c IS
END tb_i2c;
 
ARCHITECTURE behavior OF tb_i2c IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT humidity_interface
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         data_out : OUT  std_logic_vector(13 downto 0);
         ld_data : OUT  std_logic;
         enable_cnt : OUT  std_logic;
         sclk : INOUT  std_logic;
         sdata : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

	--BiDirs
   signal sclk : std_logic;
   signal sdata : std_logic;

 	--Outputs
   signal data_out : std_logic_vector(13 downto 0);
   signal ld_data : std_logic;
   signal enable_cnt : std_logic;
	
	signal outputs : std_logic_Vector( 17 DOWNTO 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: humidity_interface PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          data_out => data_out,
          ld_data => ld_data,
          enable_cnt => enable_cnt,
          sclk => sclk,
          sdata => sdata
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin		
		reset<='1';
		sdata<='Z';
      wait for 10 ns;	
		sclk<='H';
		reset<='0';
		wait until clk='1' and clk'event;
		ASSERT outputs="UZ00"&"00000000000000" REPORT "wrogn reset" SEVERITY FAILURE;
		WAIT FOR 5 ms;

		enable<='1' ;
		wait until clk='1' and clk'event;
		ASSERT outputs="UZ00"&"00000000000000" REPORT "wrogn enable" SEVERITY FAILURE;
	--30060.045 us
	-- 2.5 us
      wait;
   end process;
	
	outputs<= sclk & sdata &  ld_data & enable_cnt & data_out ;
	
END;
