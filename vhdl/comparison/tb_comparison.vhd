--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:06:57 11/20/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/comparison/tb_comparison.vhd
-- Project Name:  comparison
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparison
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


 
ENTITY tb_comparison IS
END tb_comparison;
 
ARCHITECTURE behavior OF tb_comparison IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT  comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC;
           select_data : in  STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT comparison;
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal in_out_sel : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal start_comparison : std_logic := '0';
   signal select_data : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal done_comparison : std_logic;
	signal outputs: std_logic_vector(8 DOWNTO 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparison GENERIC MAP(N=>8) PORT MAP (
          clk => clk,
          reset => reset,
          in_out_sel => in_out_sel,
          data_in => data_in,
          data_out => data_out,
          start_comparison => start_comparison,
          done_comparison => done_comparison,
          select_data => select_data
        ) ;

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
		reset<='1';
      wait for 50 ns;	
		reset<='0';
		wait until clk='1' AND clk'EVENT;
      wait for clk_period;

      -- stimulus
		-- data in 
	-- indoor
			in_out_sel<='1';
			start_comparison <='0';
			select_data<="00";
			data_in<=x"02";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000000" REPORT "computation started" SEVERITY FAILURE;
				
		start_comparison<='1';
		wait until clk='1' AND clk'EVENT;
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started" SEVERITY FAILURE;
	
-- checking inital data ( curr data should be x02)	
			start_comparison<='0';
		select_data<="01";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000010" REPORT "wrong max in inital data" SEVERITY FAILURE;
	select_data<="10";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000000" REPORT "wrong min in inital data" SEVERITY FAILURE;
			select_data<="11";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000010" REPORT "wrong curr in inital data" SEVERITY FAILURE;



		-- new max
					data_in<=x"03";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
						wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started new max" SEVERITY FAILURE;
		-- new min 
			data_in<=x"81";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
												wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started new min" SEVERITY FAILURE;
		-- curr data
		data_in<=x"01";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
												wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started new curr" SEVERITY FAILURE;
		--check data
		start_comparison<='0';
			select_data<="01";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000011" REPORT "wrong max indoor" SEVERITY FAILURE;
	select_data<="10";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="010000001" REPORT "wrong min indoor " SEVERITY FAILURE;
			select_data<="11";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000001" REPORT "wrong currindoor" SEVERITY FAILURE;
		
	--outdoor
		in_out_sel<='0';

	start_comparison <='0';
			select_data<="00";
			data_in<=x"02";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000000" REPORT "computation started outdoor" SEVERITY FAILURE;
				
		start_comparison<='1';
		wait until clk='1' AND clk'EVENT;
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started outdoor" SEVERITY FAILURE;
	
-- checking inital data ( curr data should be x02)	
			start_comparison<='0';
		select_data<="01";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000010" REPORT "wrong max in inital data outdoor" SEVERITY FAILURE;
	select_data<="10";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000000" REPORT "wrong min in inital dataoutdoor" SEVERITY FAILURE;
			select_data<="11";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000010" REPORT "wrong curr in inital data outdoor" SEVERITY FAILURE;
		
		-- new max
					data_in<=x"03";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started outdoor" SEVERITY FAILURE;
		-- new min 
			data_in<=x"81";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started outdoor" SEVERITY FAILURE;
		-- curr data
		data_in<=x"01";
					select_data<="00";
					start_comparison<='1';
						wait until clk='1' AND clk'EVENT;
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="100000000" REPORT "computation not started outdoor" SEVERITY FAILURE;
		--check data
		start_comparison<='0';
			select_data<="01";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000011" REPORT "wrong max outdoor" SEVERITY FAILURE;
	select_data<="10";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="010000001" REPORT "wrong min outdoor" SEVERITY FAILURE;
			select_data<="11";
		wait until clk='1' AND clk'EVENT;
		ASSERT outputs="000000001" REPORT "wrong curr outdoor" SEVERITY FAILURE;
		

		
	 
	 
		
		
      wait;
   end process;

outputs<= done_comparison & data_out;

END;
