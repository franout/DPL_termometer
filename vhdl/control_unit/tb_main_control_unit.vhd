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
 
 
ENTITY tb_main_control_unit IS
END tb_main_control_unit;
 
ARCHITECTURE behavior OF tb_main_control_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
	 GENERIC ( WATCH_DOG_COUNT: integer:= 100);
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         in_out_sel : IN  std_logic;
         init_set_up : OUT  std_logic;
         in_out : OUT  std_logic;
         start_comparison : OUT  std_logic;
         done_comparison : IN  std_logic;
         select_data : OUT  std_logic_vector(1 downto 0);
         display : OUT  std_logic;
         done_lcd : IN  std_logic;
         start_meas : OUT  std_logic;
         done_meas : IN  std_logic;
			reset_i:OUT std_logic;
			ready: OUT std_logic;
			locked_clock: IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal in_out_sel : std_logic := '0';
   signal done_comparison : std_logic := '0';
   signal done_lcd : std_logic := '0';
   signal done_meas : std_logic := '0';
	signal 			locked_clock: std_logic:='0';

 	--Outputs
   signal init_set_up : std_logic;
   signal in_out : std_logic;
   signal start_comparison : std_logic;
   signal select_data : std_logic_vector(1 downto 0);
   signal display : std_logic;
   signal start_meas : std_logic;
	signal cmd : std_logic_vector(7 DOWNTO 0) ;
	signal reset_i: std_logic;
	signal ready: std_logic;
	
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
          start_comparison => start_comparison,
          done_comparison => done_comparison,
          select_data => select_data,
          display => display,
          done_lcd => done_lcd,
          start_meas => start_meas,
          done_meas => done_meas, 
			 reset_i=> reset_i,
			 ready=> ready,
			 			locked_clock=> locked_clock
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
      -- hold reset state for 50 ns.
      reset<='1';
		FOR I IN 0 TO 5 LOOP
		wait until clk='1' AND clk'EVENT;
		END LOOP;
		

		ASSERT cmd="00000000"  REPORT "reset values of cu are wrong" SEVERITY FAILURE;
           --  stimulus for uut 
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
			locked_clock<='1';
				wait until clk='1' AND clk'EVENT;
locked_clock<='0';

		ASSERT cmd="00000000" REPORT "failed to lock the clock" SEVERITY FAILURE;
		reset<='0';
		in_out_sel <= '1';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
		wait for clk_period;
		ASSERT cmd="10000000" REPORT "there is a change in the cmd during the set up phase" SEVERITY FAILURE; -- no changes becouse it waits for the interfaces set up
		
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
		for i in  0 to 5 LOOP
	wait for clk_period;
	END LOOP ; -- wait for 5 c.c.
		ASSERT cmd="10000000" REPORT "cu doesn't wait for the interfaces" SEVERITY FAILURE;
		
		
		-- set up of peripherals correctly done 
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='1';
    done_meas <='0';
	wait for clk_period; -- idle state
		ASSERT cmd="10000000" REPORT "not in idle state" SEVERITY FAILURE;
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
	wait for clk_period; -- idle state
		ASSERT cmd="00000000" REPORT "cu doens't remain in idle state" SEVERITY FAILURE;
				ASSERT ready='1' REPORT "system not ready " SEVERITY FAILURE;

		-- transaction on the switch  start measurement
		reset<='0';
		in_out_sel <= '1';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
	FOR i IN 0 TO 5  LOOP
	wait for clk_period; 
	END LOOP;
		ASSERT cmd="01000010" REPORT "no started measurements" SEVERITY FAILURE;
	


-- measure is done	

	reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='1';
	
	wait for clk_period; 
	-- in out is still set to one 
		ASSERT cmd="01000010" REPORT "not started comparison " SEVERITY FAILURE;
		-- make comparison and waiting for it


	reset<='0';
		in_out_sel <= '0';
   done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
	
	
	wait for clk_period; 
	-- no changes during the comparison
		ASSERT cmd="01100000" REPORT "changed value on in out " SEVERITY FAILURE;
		
	reset<='0';
		in_out_sel <= '1';
    done_comparison<='1';
    done_lcd <='0';
    done_meas <='0';
	 	wait for clk_period; 

	 	ASSERT cmd="01100000" REPORT "not completed comparison" SEVERITY FAILURE;

	-- display max

	reset<='0';
		in_out_sel <= '1';
    done_comparison<='0';
    done_lcd <='1';
    done_meas <='0';
	
	wait for clk_period; 
		ASSERT cmd="01001100" REPORT "not showing max tmp" SEVERITY FAILURE;
		


-- display min


	reset<='0';
		in_out_sel <= '1';
    done_comparison<='0';
    done_lcd <='1';
    done_meas <='0';
	
	wait for clk_period; 
		ASSERT cmd="01010100" REPORT "not showing min tmp" SEVERITY FAILURE;
		
		
		-- dispaly curr 
	reset<='0';
		in_out_sel <= '1';
    done_comparison<='0';
    done_lcd <='1';
    done_meas <='0';
	
	wait for clk_period; 
		ASSERT cmd="01011100" REPORT "not showing curr tmp" SEVERITY FAILURE;
		
		
		done_lcd<='0';
		
		--idle state 
	wait for clk_period;
			ASSERT cmd="01000000" REPORT "not in idle state" SEVERITY FAILURE;

 --- transition from high to low detect
 reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
	
	wait for clk_period*2; 
	
		ASSERT cmd="00000010" REPORT "transition h to l not detected" SEVERITY FAILURE;
	


-- reset again 
    reset<='1';
		FOR I IN 0 TO 5 LOOP
		wait until clk='1' AND clk'EVENT;
		END LOOP;
		ASSERT cmd="00000000"  REPORT "reset values of cu are wrong" SEVERITY FAILURE;
	locked_clock<='1';
	locked_clock<='1';
				wait until clk='1' AND clk'EVENT;

-- watchdog exppired into the setup state
	reset<='0';
	FOR I IN 0 TO 100 LOOP
		wait until clk='1' AND clk'EVENT;
		END LOOP;
				wait until clk='1' AND clk'EVENT;

		ASSERT cmd="00000001"  REPORT "reset values of cu are wrong watchdog not active" SEVERITY FAILURE;
		
-- watchdog expire into the idle state
		-- set up of peripherals correctly done 
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='1';
    done_lcd <='1';
    done_meas <='1';
	wait for clk_period; -- idle state
		ASSERT cmd="10000000" REPORT "not in idle state" SEVERITY FAILURE;
		reset<='0';
		in_out_sel <= '0';
    done_comparison<='0';
    done_lcd <='0';
    done_meas <='0';
	wait for clk_period; -- idle state
		ASSERT cmd="00000000" REPORT "cu doens't remain in idle state" SEVERITY FAILURE;
		
		-- watchdog expires
			FOR I IN 0 TO 100 LOOP
		wait until clk='1' AND clk'EVENT;
		END LOOP;
		-- tc is activated and cu understands
				wait until clk='1' AND clk'EVENT;

		ASSERT cmd="00000010" REPORT "no started measurements after wd expired" SEVERITY FAILURE;

      wait;
   end process;


cmd<=init_set_up & in_out & start_comparison & select_data &  display &   start_meas & reset_i;

END;
