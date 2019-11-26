--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:40:30 11/26/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/tb_translator.vhd
-- Project Name:  top_display
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: translator
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
 

 
ENTITY tb_translator IS
END tb_translator;
 
ARCHITECTURE behavior OF tb_translator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
  
COMPONENT  translator is
GENERIC ( n: integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1  downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-2 downto 0));
end COMPONENT translator;


   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal data_in : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: translator GENERIC MAP (9) PORT MAP (
          reset => reset,
          clk => clk,
          start => start,
          data_in => data_in,
          data_out => data_out
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
      wait until clk='1' AND clk'event;
		start<='1';
		data_in<="001100110"; -- +051.0
   wait until clk='1' AND clk'event;
		-- sign
		assert data_out=x"2b" REPORT "wrong sign" severity failure;
		wait until clk='1' AND clk'event;
		-- x1
		assert data_out=x"30" REPORT "wrong x1" severity failure;
		wait until clk='1' AND clk'event;
		--x2
		assert data_out=x"35" REPORT "wrong x2" severity failure;
		wait until clk='1' AND clk'event;
		
		--x3
		assert data_out=x"31" REPORT "wrong x3" severity failure;
		wait until clk='1' AND clk'event;
		
		-- dot
		assert data_out=x"2E" REPORT "wrong dot" severity failure;
		wait until clk='1' AND clk'event;
		
		--decimal
		assert data_out=x"30" REPORT "wrong dec" severity failure;
		wait until clk='1' AND clk'event;
		
		start<='0';
		data_in<="100110011"; -- -103.5
		wait until clk='1' AND clk'event;
		start<='1';
		wait until clk='1' AND clk'event;
		-- sign
		assert data_out=x"2d" REPORT "wrong sign" severity failure;
		wait until clk='1' AND clk'event;
		-- x1
		assert data_out=x"31" REPORT "wrong x1 " severity failure;
		wait until clk='1' AND clk'event;
		--x2
		assert data_out=x"30" REPORT "wrong x2" severity failure;
		wait until clk='1' AND clk'event;
		
		--x3
		assert data_out=x"32" REPORT "wrong x3" severity failure;
		wait until clk='1' AND clk'event;
		
		-- dot
		assert data_out=x"2E" REPORT "wrong dot" severity failure;
		wait until clk='1' AND clk'event;
		
		--decimal
		assert data_out=x"35" REPORT "wrong decimal" severity failure;
		wait until clk='1' AND clk'event;
		
		start<='0';
      wait;
   end process;

END;
