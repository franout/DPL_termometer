library ieee;
use ieee.std_logic_1164.all;

entity top_thermomether_tb is 

end entity;

architecture arc of top_thermomether_tb is
	component top_thermometer is
    Port ( reset : in  STD_LOGIC;					--SW[15]
           clk : in  STD_LOGIC;
		   ind_outd_sw: in STD_LOGIC;				--SW[0]
--------------------TEMPERATURE-------------------------
           tmp_sensor : inout  STD_LOGIC;			--dq indoor JC[1]
		   data_receive_from_rece: in std_logic;			--JC[2]
		   ledtest: out std_logic_vector(8 downto 0);
---------------------LCD----------------------------------
           lcd_rs : out  STD_LOGIC;				--JB[7]
           lcd_rw : out  STD_LOGIC;				--JB[8]
           lcd_enable : out  STD_LOGIC;				--JB[9]
           lcd_data : out  STD_LOGIC_VECTOR (7 downto 0);			--JA[0] --JA[10]
		   temstart: out std_logic;
--		   led: out std_logic_vector( 8 downto 0);
		   system_ready: out std_logic -- signal to an led on the board    LED15
				);
	end component;
	
	signal clk_tb:std_logic:='0';
	signal reset_tb: std_logic:='1';
	signal ind_outd_sw_tb: std_logic:='1';
	signal data_receive_from_rece_tb: std_logic;
	signal tmp_sensor_tb:std_logic:='Z';
	
	signal ledtest_tb:  std_logic_vector(8 downto 0);
    signal       lcd_rs_tb :   STD_LOGIC;				--JB[7]
    signal      lcd_rw_tb : STD_LOGIC;				--JB[8]
    signal      lcd_enable_tb :  STD_LOGIC;				--JB[9]
    signal      lcd_data_tb :   STD_LOGIC_VECTOR (7 downto 0);			--JA[0] --JA[10]
	signal	   temstart_tb:  std_logic;
	signal	   system_ready_tb:  std_logic;
		   
	
begin
	top_thermometer_comp:component top_thermometer
		port map (clk=>clk_tb,reset=>reset_tb, ind_outd_sw=>ind_outd_sw_tb, tmp_sensor=>tmp_sensor_tb, data_receive_from_rece=>data_receive_from_rece_tb,
					ledtest=>ledtest_tb, lcd_rs=>lcd_rs_tb, lcd_rw=>lcd_rw_tb, lcd_enable=>lcd_enable_tb, lcd_data=>lcd_data_tb, temstart=>temstart_tb, system_ready=>system_ready_tb);
		
	 clk_tb <= not clk_tb after 5 ns;
	 data_receive_from_rece_tb<='1',
								'0' after 555555555 ns;
								
	 reset_tb <= '1',
		     '0' after 100 ns;
    ind_outd_sw_tb<='0',
					'1' after 752691100 ns;
	
			
	tmp_sensor_tb <= '0' after 541000 ns,
			 'Z' after 780000 ns,
			 '0' after 752691200 ns,
			 'Z' after 752930000 ns;
			 
			
		
end arc;
	
	
