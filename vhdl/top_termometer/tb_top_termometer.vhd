--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:41 11/28/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/top_termometer/tb_top_termometer.vhd
-- Project Name:  top_termometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_termometer
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


ENTITY tb_top_termometer IS
END tb_top_termometer;
 
ARCHITECTURE behavior OF tb_top_termometer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_termometer
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         ind_outd_sw : IN  std_logic;
         tmp_sensor : INOUT  std_logic;
         lcd_enable : OUT  std_logic;
         lcd_rw : OUT  std_logic;
         lcd_rs : OUT  std_logic;
         lcd_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal ind_outd_sw : std_logic := '0';

	--BiDirs
   signal tmp_sensor : std_logic;

 	--Outputs
   signal lcd_enable : std_logic;
   signal lcd_rw : std_logic;
   signal lcd_rs : std_logic;
   signal lcd_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_termometer PORT MAP (
          reset => reset,
          clk => clk,
          ind_outd_sw => ind_outd_sw,
          tmp_sensor => tmp_sensor,
          in_out_s => in_out_s,
          lcd_enable => lcd_enable,
          lcd_rw => lcd_rw,
          lcd_rs => lcd_rs,
          lcd_data => lcd_data
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
      wait for 50 ns;	
		reset<='0';
		wait until clk='1' and clk'event;
		-- check on the initialization of the lcd


      -- stimulus 
		-- indoor
		ind_outd_sw<='1'; -- transition start of the chain 
		wait until clk='1' and clk'event;
		
		-- observe and create signal on sensor line
		
		
		-- obserbe signals on the lcd
		
		
		-- outdoor
		ind_outd_sw<='1'; -- transition start of the chain 
		wait until clk='1' and clk'event;
		
		-- observe and create signal on sensor line
		
		
		-- obserbe signals on the lcd
		
		-- watchdog expires
		ind_outd_sw<='1'; -- transition start of the chain 
		wait until clk='1' and clk'event;
		
		-- observe and create signal on sensor line
		
		
		-- obserbe signals on the lcd
		
		
      wait;
   end process;

END;
