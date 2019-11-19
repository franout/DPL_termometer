--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:14:49 11/19/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/control_unit/tb_main_control_unit.vhd
-- Project Name:  control_unit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_main_control_unit IS
END tb_main_control_unit;
 
ARCHITECTURE behavior OF tb_main_control_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         in_out_sel : IN  std_logic;
         init_set_up : OUT  std_logic;
         in_out : OUT  std_logic;
         start_computation : OUT  std_logic;
         done_computation : IN  std_logic;
         select_data : OUT  std_logic_vector(1 downto 0);
         display : OUT  std_logic;
         done_lcd : IN  std_logic;
         start_meas : OUT  std_logic;
         done_meas : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal in_out_sel : std_logic := '0';
   signal done_computation : std_logic := '0';
   signal done_lcd : std_logic := '0';
   signal done_meas : std_logic := '0';

 	--Outputs
   signal init_set_up : std_logic;
   signal in_out : std_logic;
   signal start_computation : std_logic;
   signal select_data : std_logic_vector(1 downto 0);
   signal display : std_logic;
   signal start_meas : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          reset => reset,
          clk => clk,
          in_out_sel => in_out_sel,
          init_set_up => init_set_up,
          in_out => in_out,
          start_computation => start_computation,
          done_computation => done_computation,
          select_data => select_data,
          display => display,
          done_lcd => done_lcd,
          start_meas => start_meas,
          done_meas => done_meas
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
