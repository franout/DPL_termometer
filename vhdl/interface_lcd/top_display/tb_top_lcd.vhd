--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:02:41 11/28/2019
-- Design Name:   
-- Module Name:   D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/tb_top_lcd.vhd
-- Project Name:  top_display
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_display
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


 
ENTITY tb_top_lcd IS
END tb_top_lcd;
 
ARCHITECTURE behavior OF tb_top_lcd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_display
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_lcd : IN  std_logic;
         init_set_up : IN  std_logic;
         ind_outd_select : IN  std_logic;
         data_in : IN  std_logic_vector(8 downto 0);
         done_lcd : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0);
         rs : OUT  std_logic;
         r_w : OUT  std_logic;
         enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start_lcd : std_logic := '0';
   signal init_set_up : std_logic := '0';
   signal ind_outd_select : std_logic := '0';
   signal data_in : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal done_lcd : std_logic;
   signal data_out : std_logic_vector(7 downto 0);
   signal rs : std_logic;
   signal r_w : std_logic;
   signal enable : std_logic;
	signal outputs: std_logic_vector( 11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant clk_counter : integer := 166666; 
 
BEGIN
	
	outputs<=done_lcd & rs &r_w &enable &data_out;
	-- Instantiate the Unit Under Test (UUT)
   uut: top_display PORT MAP (
          clk => clk,
          reset => reset,
          start_lcd => start_lcd,
          init_set_up => init_set_up,
          ind_outd_select => ind_outd_select,
          data_in => data_in,
          done_lcd => done_lcd,
          data_out => data_out,
          rs => rs,
          r_w => r_w,
          enable => enable
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
		wait until clk='1' AND clk'event;
      -- stimulus
		----------------------------------
		---------- initialization --------
		----------------------------------
		reset<='0';
		init_set_up<='1';
		start_lcd<='0';
		ind_outd_select<='0';
		data_in<=(OTHERS=>'0');
		--outputs<=done_lcd & rs &r_w &enable &data_out; 
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000100110000" REPORT " failure first set up stet " SEVERITY FAILURE;
		
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000100111100" REPORT " failure second set up stet " SEVERITY FAILURE;
		
		
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000100001000" REPORT " failure third set up stet " SEVERITY FAILURE;
		
		
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		WAIT until clk='1' and clk'event; 
		-- clear data on display
		ASSERT outputs="000100000001" REPORT " failure fourth set up stet " SEVERITY FAILURE;
		
      
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000100000110" REPORT " failure fifth set up stet " SEVERITY FAILURE;
		
		
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		WAIT until clk='1' and clk'event;
		ASSERT outputs="100100001111" REPORT " failure sixth set up stet " SEVERITY FAILURE;
		
		
		
		
		-- idle state
		start_lcd<='0';
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000000111100" REPORT " failure first set up stet " SEVERITY FAILURE;
		
		init_set_up<='0';
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000000111100" REPORT " failure first set up stet " SEVERITY FAILURE;
		
		-- start to display 
		---------------------
		-- indoor 
		---------------------
		ind_outd_select<='1';
		start_lcd<='1';
		data_in<="001100110"; -- +051.0
		
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- max
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		ASSERT outputs="0101"&x"4D" REPORT " failure print m  " SEVERITY FAILURE; --- M
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure print a  " SEVERITY FAILURE; --- a
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print x  " SEVERITY FAILURE; --- x
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"35" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"&x"31" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- min
		ASSERT outputs="0101"&x"4D" REPORT " failure print m " SEVERITY FAILURE; --- m
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure failure print i " SEVERITY FAILURE; --- i
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print m " SEVERITY FAILURE; --- n
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"& x"30" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- curr 
			ASSERT outputs="0101"&x"4D" REPORT " failure print n " SEVERITY FAILURE; --- N
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure print o " SEVERITY FAILURE; --- O
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print w " SEVERITY FAILURE; --- W
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"35" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"&x"31" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure to print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		


		WAIT until clk='1' and clk'event;
		WAIT until clk='1' and clk'event;

		-- outdoor 
		ind_outd_select<='0';
		data_in<="100110011"; -- -103.5
		start_lcd<='1';
		ASSERT outputs="0101"&x"4D" REPORT " failure print m  " SEVERITY FAILURE; --- M
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure print a  " SEVERITY FAILURE; --- a
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print x  " SEVERITY FAILURE; --- x
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"&x"30" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- min
		ASSERT outputs="0101"&x"4D" REPORT " failure print m " SEVERITY FAILURE; --- m
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure failure print i " SEVERITY FAILURE; --- i
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print m " SEVERITY FAILURE; --- n
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2d" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"31" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"& x"33" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"35" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- curr 
			ASSERT outputs="0101"&x"4D" REPORT " failure print n " SEVERITY FAILURE; --- N
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"41" REPORT " failure print o " SEVERITY FAILURE; --- O
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"58" REPORT " failure print w " SEVERITY FAILURE; --- W
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		-- sign
		assert outputs="0101"&x"2d" REPORT "wrong sign" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		-- x1
		assert outputs="0101"&x"31" REPORT "wrong x1" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--x3
		assert outputs="0101"&x"33" REPORT "wrong x3" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;
		
		--decimal
		assert outputs="0101"&x"35" REPORT "wrong dec" severity failure;
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

		ASSERT outputs="010111000000" REPORT " failure to print ° " SEVERITY FAILURE; --- °
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;

				
		wait;
   end process;

END;
