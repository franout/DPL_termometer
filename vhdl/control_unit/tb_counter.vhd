--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:17:20 11/21/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/control_unit/tb_counter.vhd
-- Project Name:  control_unit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 

ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_wd
	 
generic ( N : integer := 8;
			MAX_VAL: integer :=255);

    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal tc : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	-- for 60 s it should be enough 26 bit ( 1 Mhz ) 
   uut: counter_wd GENERIC MAP (N=>8, MAX_VAL=>200) PORT MAP (
          clk => clk,
          reset => reset,
          tc => tc
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
			wait for 100 ns;	
		reset<='0';
		wait until clk='1' and clk'event;
      wait for clk_period*10;
		ASSERT tc='0' REPORT "wrong tc" SEVERITY failure;
		
		wait for clk_period*10;
		ASSERT tc='0' REPORT "wrong tc" SEVERITY failure;
		-- check tc after 20 ms
		wait until tc='1';

		
      wait;
   end process;

END;
