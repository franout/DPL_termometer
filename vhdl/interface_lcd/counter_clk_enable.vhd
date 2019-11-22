LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.math_real.all;


Entity counter_clk_enable IS

Port(
		areset		:IN STD_LOGIC;
		clk		:IN STD_LOGIC;                                 
		clk_enable	:OUT STD_LOGIC);                               
		
end counter_clk_enable;

Architecture Arch_counter_clk_enable of counter_clk_enable IS 

		Constant N:integer:=166667;
		signal count: integer range 0  to N;
	begin
		process(clk, areset) is
			begin 
				IF (areset ='1') THEN
					count<=0;
					clk_enable<='0';

				ELSIF RISING_EDGE(clk)THEN 

					IF (count = (N-1)) THEN
						clk_enable <= '1';
					ELSE 
						clk_enable <='0';
					END IF;
					count<=(count+1)MOD N;
				END IF;
		END PROCESS;

end Arch_counter_clk_enable;

