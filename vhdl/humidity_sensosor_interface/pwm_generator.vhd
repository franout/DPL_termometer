LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";

ENTITY pwm_generator IS 
GENERIC (N:integer:=8);
PORT ( clk,reset,enable,ld_val_duty: IN std_logic;
		data_in: IN std_logic_vector(N-1 DOWNTO 0);
		pwm_out: OUT std_logic
		);
END entity pwm_generator;


ARCHITECTURE structural OF pwm_generator IS
constant frequency_pwm: integer := 1000; -- Khz 


--required bits
-- integer(ceil(log2(real(frequency_pwm))))
 
 


BEGIN




--counter:
--reg:

-- comparison 
pwm_out<='1' when unsigned(cnt_val)>=unsigned(reg_val) else '0';

END structural;
