--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:44:58 11/26/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/tb_lcd.vhd
-- Project Name:  top_display
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LCD
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
 
 
ENTITY tb_lcd IS
END tb_lcd;
 
ARCHITECTURE behavior OF tb_lcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         dataIN : IN  std_logic_vector(7 downto 0);
         clk_enable : IN  std_logic;
         enable_init : IN  std_logic;
         enable : IN  std_logic;
         ind_outd_select : IN  std_logic;
         dataOUT : OUT  std_logic_vector(7 downto 0);
         done : OUT  std_logic;
         RS : OUT  std_logic;
         R_W : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal dataIN : std_logic_vector(7 downto 0) := (others => '0');
   signal clk_enable : std_logic := '0';
   signal enable_init : std_logic := '0';
   signal enable : std_logic := '0';
   signal ind_outd_select : std_logic := '0';

 	--Outputs
   signal dataOUT : std_logic_vector(7 downto 0);
   signal done : std_logic;
   signal RS : std_logic;
   signal R_W : std_logic;
	
	signal output: std_logic_vector( 10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant clk_enable_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD PORT MAP (
          clk => clk,
          reset => reset,
          dataIN => dataIN,
          clk_enable => clk_enable,
          enable_init => enable_init,
          enable => enable,
          ind_outd_select => ind_outd_select,
          dataOUT => dataOUT,
          done => done,
          RS => RS,
          R_W => R_W
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   clk_enable_process :process
   begin
		clk_enable <= '0';
		wait for clk_enable_period/2;
		clk_enable <= '1';
		wait for clk_enable_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<='1';
      wait for 50 ns;	
		wait until clk='1' AND clk'event;
		-- stimulus
		reset<='0';
		
    dataIN <="001100110"; -- +051.0
		ind_outd_select<='1'; -- indoor 
		

	 signal clk_enable : std_logic := '0';
   signal enable_init : std_logic := '0';
   signal enable : std_logic := '0';
	
		wait until clk='1' AND clk'event;
		assert output="" REPORT "" SEVERITY FAILURE;

		
		
				data_in<="100110011"; -- -103.5
		ind_outd_select<='0'; -- outdoor 

		
		
		
      wait;
   end process;
	
	output<=dataOUT & RS & R_W &done;

END;
