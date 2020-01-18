----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:46 12/11/2019 
-- Design Name: 
-- Module Name:    top_humidity_sensors_interface - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real."log2";
use IEEE.math_real."ceil";

entity top_humidity_sensors_interface is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           pwm_out : out  STD_LOGIC;
           sclk : inout  STD_LOGIC;
           sdata : inout  STD_LOGIC);
end top_humidity_sensors_interface;

architecture Behavioral of top_humidity_sensors_interface is

component counter_wd is
generic ( N : integer := 8;
			MAX_VAL: integer :=200);
    Port ( clk : in  STD_LOGIC;
				enable: in std_logic;
           reset : in  STD_LOGIC;
           tc : out  STD_LOGIC);
end component counter_wd;


component humidity_interface IS
PORT ( clk,reset,enable: IN std_logic;
		data_out: out std_logic_vector(13 DOWNTO 0);
			ld_data,enable_cnt: out std_logic;
			sclk,sdata: inout std_logic);
end component humidity_interface;

COMPONENT  pwm_generator IS 
GENERIC (N:integer:=8);
PORT ( clk,reset,enable,ld_val_duty: IN std_logic;
		data_in: IN std_logic_vector(N-1 DOWNTO 0);  -- humidity percentage
		pwm_out: OUT std_logic
		);
END COMPONENT  pwm_generator;

SIGNAL data_out_to_pwm: std_logic_vector(13 DOWNTO 0);
SIGNAL enable_read,ld_val,enable_from_i2c,enable_count: std_logic;

begin

enable_count<=enable and enable_from_i2c;
-- every 100 ms  read a new humidity value 
counter: counter_wd GENERIC MAP (N=> 1+integer(ceil(log2(real(10000)))),MAX_VAL=>10000) 
													PORT MAP(clk=>clk,reset=>reset,
																enable=>enable_count,tc=>enable_read);
i2c_interface: humidity_interface PORT MAP (clk=>clk,reset=>reset,
                                                                enable=>enable,
																enable_cnt=> enable_from_i2c,
																	ld_data=>ld_val, data_out=> data_out_to_pwm,sclk=>sclk, sdata=>sdata);
pwm: pwm_generator GENERIC MAP(14) PORT MAP (enable=>enable,clk=>clk,reset=>reset,ld_val_duty=>ld_val,data_in=>data_out_to_pwm,pwm_out=>pwm_out);


end Behavioral;

