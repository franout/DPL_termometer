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
   constant clk_period : time :=10  ns;
	constant clk_counter : integer := 15000; 
 
BEGIN
	
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
 
	outputs<= done_lcd & rs &r_w &enable &data_out;

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
		wait until clk='1' AND clk'event;
		init_set_up<='1';
		start_lcd<='0';
		ind_outd_select<='0';
		data_in<=(OTHERS=>'0');
		--outputs<=done_lcd & rs &r_w &enable &data_out; 
		-- same output for three state
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;	

		ASSERT outputs="000100110000" REPORT " failure first set up stet " SEVERITY FAILURE;

		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;	

		ASSERT outputs="000100110000" REPORT " failure first set up stet 2" SEVERITY FAILURE;
		
		for i in 0 to clk_counter loop
		WAIT until clk='1' and clk'event;
		end loop;	

		ASSERT outputs="000100110000" REPORT " failure first set up stet 3" SEVERITY FAILURE;
		
		
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		for i in 0 to clk_counter-2 loop
		WAIT until clk='1' and clk'event;
		end loop;	

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
		init_set_up<='0';
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000000111100" REPORT " idle wrong " SEVERITY FAILURE;
		
		init_set_up<='0';
		WAIT until clk='1' and clk'event;
		ASSERT outputs="000000111100" REPORT " idle wrong" SEVERITY FAILURE;
		
		-- start to display 
		---------------------
		-- indoor 
		---------------------
		ind_outd_select<='1';
		start_lcd<='1';
		data_in<=(OTHERS=>'0');
		WAIT until clk='1' and clk'event;

		WAIT until clk='1' and clk'event;
		WAIT until clk='1' and clk'event;
		-- max
		--outputs<=done_lcd & rs &r_w &enable &data_out;
		ASSERT outputs="0101"&x"4D" REPORT " failure print m  " SEVERITY FAILURE; --- M
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"41" REPORT " failure print a  " SEVERITY FAILURE; --- a
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"58" REPORT " failure print x  " SEVERITY FAILURE; --- x
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign max" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
  		assert outputs="0101"&x"30" REPORT "wrong x1 max" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2 max" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"&x"30" REPORT "wrong x3 max" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot max" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec max" severity failure;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"43" REPORT " failure print ° " SEVERITY FAILURE; --- c
		


		data_in<="001100110"; -- +051.0

		WAIT until clk='1' and clk'event;
		ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;
		wait until clk='1' and clk'event;
		
		-- min
		ASSERT outputs="0101"&x"4D" REPORT " failure print m " SEVERITY FAILURE; --- m
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"49" REPORT " failure failure print i " SEVERITY FAILURE; --- i
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4e" REPORT " failure print n " SEVERITY FAILURE; --- n
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign mix" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1 min" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"35" REPORT "wrong x2  min" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"& x"31" REPORT "wrong x3 min" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot  min" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec min" severity failure;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"43" REPORT " failure print ° " SEVERITY FAILURE; --- °
		WAIT until clk='1' and clk'event;
				ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;

		wait until clk='1' and clk'event;
		-- curr 
			ASSERT outputs="0101"&x"4e" REPORT " failure print n " SEVERITY FAILURE; --- N
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure print o " SEVERITY FAILURE; --- O
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"57" REPORT " failure print w " SEVERITY FAILURE; --- W
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign now" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1 now" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"35" REPORT "wrong x2 now" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"&x"31" REPORT "wrong x3 now" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot now" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec  now" severity failure;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"43"  REPORT " failure to print ° " SEVERITY FAILURE; --- °
		WAIT until clk='1' and clk'event;
				ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;
				WAIT until clk='1' and clk'event;

		
		-- check indoor print
		ASSERT outputs="0101"&x"49" REPORT " failure to print i " SEVERITY FAILURE; --- I
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4e" REPORT " failure to print n " SEVERITY FAILURE; --- n
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"44" REPORT " failure to print d " SEVERITY FAILURE; --- d
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure to print o " SEVERITY FAILURE; --- o
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure to print 0 " SEVERITY FAILURE; --- o


		-- outdoor 
		ind_outd_select<='0';
		data_in<=(OTHERS=>'0'); 
		start_lcd<='1';
		WAIT until clk='1' and clk'event;
		ASSERT outputs="1101"&x"52" REPORT " failure to print r " SEVERITY FAILURE; --- r



		WAIT until clk='1' and clk'event;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"4D" REPORT " failure print m  outdorr" SEVERITY FAILURE; --- M
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"41" REPORT " failure print a  outdorr" SEVERITY FAILURE; --- a
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"58" REPORT " failure print x outdorr " SEVERITY FAILURE; --- x
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print outdorr : " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2b" REPORT "wrong sign max out" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
		assert outputs="0101"&x"30" REPORT "wrong x1 max out" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2 max out" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"&x"30" REPORT "wrong x3 max out" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot max out" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"30" REPORT "wrong dec max out" severity failure;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"43" REPORT " failure print ° " SEVERITY FAILURE; --- °
		WAIT until clk='1' and clk'event;
				ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;
		data_in<="100110011"; -- -103.5

		wait until clk='1' and clk'event;

		
		-- min
		ASSERT outputs="0101"&x"4D" REPORT " failure print m outdorr" SEVERITY FAILURE; --- m
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"49" REPORT " failure failure print i outdorr" SEVERITY FAILURE; --- i
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4e" REPORT " failure print n outdorr" SEVERITY FAILURE; --- n
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print :outdorr " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2d" REPORT "wrong sign min out" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
		assert outputs="0101"&x"31" REPORT "wrong x1 min out" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2 min out" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"& x"33" REPORT "wrong x3 min out" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot min out" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"35" REPORT "wrong dec min out" severity failure;
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"43" REPORT " failure print ° " SEVERITY FAILURE; --- °
		WAIT until clk='1' and clk'event;
				ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;

		wait until clk='1' and clk'event;

		-- curr 
			ASSERT outputs="0101"&x"4e" REPORT " failure print n outdorr" SEVERITY FAILURE; --- N
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure print ooutdorr " SEVERITY FAILURE; --- O
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"57" REPORT " failure print w outdorr" SEVERITY FAILURE; --- W
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"3a" REPORT " failure print : outdorr " SEVERITY FAILURE; --- :
		WAIT until clk='1' and clk'event;

		-- sign
		assert outputs="0101"&x"2d" REPORT "wrong sign now outd" severity failure;
		WAIT until clk='1' and clk'event;
		-- x1
		assert outputs="0101"&x"31" REPORT "wrong x1 now outd" severity failure;
		WAIT until clk='1' and clk'event;
		--x2
		assert outputs="0101"&x"30" REPORT "wrong x2 now outd" severity failure;
		WAIT until clk='1' and clk'event;
		
		--x3
		assert outputs="0101"&x"33" REPORT "wrong x3 now outd" severity failure;
		WAIT until clk='1' and clk'event;
		
		-- dot
		assert outputs="0101"&x"2E" REPORT "wrong dot now outd" severity failure;
		WAIT until clk='1' and clk'event;
		
		--decimal
		assert outputs="0101"&x"35" REPORT "wrong dec now outd" severity failure;
		WAIT until clk='1' and clk'event;

		ASSERT outputs="0101"&x"43" REPORT " failure print ° " SEVERITY FAILURE; --- °
		WAIT until clk='1' and clk'event;
				ASSERT done_LCD='1' REPORT "lcd not done" SEVERITY FAILURE;

		wait until clk='1' and clk'event;

-- check outdorr print
		ASSERT outputs="0101"&x"4f" REPORT " failure to print o " SEVERITY FAILURE; --- o
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"55" REPORT " failure to print u " SEVERITY FAILURE; --- u
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"54" REPORT " failure to print t " SEVERITY FAILURE; --- t
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"44" REPORT " failure to print d " SEVERITY FAILURE; --- d
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure to print 0 " SEVERITY FAILURE; --- o
		WAIT until clk='1' and clk'event;
		ASSERT outputs="0101"&x"4f" REPORT " failure to print o " SEVERITY FAILURE; --- o
		WAIT until clk='1' and clk'event;
		ASSERT outputs="1101"&x"52" REPORT " failure to print r " SEVERITY FAILURE; --- r
				
		wait;
   end process;

END;
