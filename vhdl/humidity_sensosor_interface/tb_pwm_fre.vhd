----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2020 10:52:41
-- Design Name: 
-- Module Name: tb_pwm_fre - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity tb_pwm_fre is
end tb_pwm_fre;

architecture arch of tb_pwm_fre is



COMPONENT  pwm_generator IS 
GENERIC (N:integer:=8;
	      pwm_freq        : INTEGER := 1000    --PWM switching frequency in Hz
			);
PORT ( clk,reset,enable,ld_val_duty: IN std_logic;
		data_in: IN std_logic_vector(N-1 DOWNTO 0);  -- raw data that must be processed
		pwm_out: OUT std_logic
		);
END COMPONENT  pwm_generator;

SIGNAL clk,reset,enable,ld_val_duty,pwm_out: std_logic;
SIGNAL data_in : std_logic_vector(13 DOWNTO 0);

constant clk_period : time := 10 ns;


begin
uut: pwm_generator GENERIC MAP (N=>14,pwm_freq=>1000) PORT MAP(clk=>clk,reset=>reset,enable=>enable,ld_val_duty=>ld_val_duty,pwm_out=>pwm_out,data_in=>data_in);


clk_process:PROCESS 
BEGIN
	clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
END PROCESS clk_process;


stimulus:PROCESS
BEGIN

enable<='0';
reset<='0';
WAIT UNTIL clk='1' AND clk'event;
reset<='1';
WAIT UNTIL clk='1' AND clk'event;
reset<='0';
WAIT UNTIL clk='1' AND clk'event;
enable<='1';

FOR i in 0 to 100000 LOOP
WAIT UNTIL clk='1' AND clk'event;
END LOOP;

-- change duty to 90
ld_val_duty<='1';
data_in<="00"&x"093";
WAIT UNTIL clk='1' AND clk'event;
ld_val_duty<='0';
-- check new duty cycle
FOR i in 0 to 1000 LOOP
WAIT UNTIL clk='1' AND clk'event;
END LOOP;

WAIT;
END PROCESS stimulus;


end arch;
