library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;


entity comparison_com is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
--				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_outmax : out  STD_LOGIC_VECTOR (N-1 downto 0);
		   data_outmin : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC);
end comparison_com;

architecture structural of comparison_com is
signal data_max: integer range -150 to 150:=0;
signal data_min: integer range -150 to 150:=0;
signal state: natural range 0 to 3:=0;
signal data_tem: integer range -150 to 150:=0;

begin
process (clk, reset)
begin
	if( reset='1') then
		data_max<=0;
		data_min<=50;
		state<=0;
	elsif( rising_edge (clk)) then
		data_tem<= to_integer(signed(data_in));
		case state is
		when 0	 => if(start_comparison='1') then
						state<=1;
					else
					   state<=0;
					end if;
		when 1   =>	if(data_max<data_tem) then
						data_max<=data_tem;
					else
						data_max<=data_max;
					end if;
					if(data_min>data_tem) then
						data_min<=data_tem;
					else
						data_min<=data_min;
					end if;
					
					state<=2;
		when 2	 => done_comparison<='1';
					state<=0;
					data_outmax<=std_logic_vector(to_signed(data_max,N));
                    data_outmin<=std_logic_vector(to_signed(data_min,N));
		when others => state<=0;
		end case;
	end if;
end process;


end structural;
