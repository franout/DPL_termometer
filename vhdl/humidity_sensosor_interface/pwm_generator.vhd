library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pwm_generator is
	generic(
		
		N: integer := 8;
		max_value: integer := 1000  -- set max_value and duty_value relation depending on the wanted duty cycle
	);
	port(
		clk: in std_logic;
		duty_value: in std_logic_vector((N-1) downto 0);
		pwm_out: out std_logic
	);
end pwm_generator;

architecture arch_pwm of pwm_generator is
	signal count: std_logic_vector((N-1) downto 0);
	
  begin

	process(clk) -- Counting
	  begin
		if(rising_edge(clk)) then
			if (count < (max_value-1)) then
				count <= count + 1;
			else
				count <= (others => '0');
			end if;
		end if;
	end process;

	process(clk) -- PWM generation
  	  begin
		if(rising_edge(clk)) then
			if (duty_value > count) then
				pwm_out <= '1';
			else
				pwm_out <= '0';
			end if;
		end if;
	end process;
end arch_pwm;