library ieee;

use ieee.std_logic_1164.all;



entity encode is

	port(reset		 : in  std_logic;

		 detect_done : in std_logic;

		 

		 clk 		 : in  std_logic;

		 Din  		 : in  std_logic_vector(8 downto 0);

		 Dout 		 : out  std_logic);

end entity;





architecture arc of encode is

	

	

	signal data_seq : std_logic_vector(12 downto 0);

	signal cnt: natural range 0 to 13 :=13;

	signal phase : natural range 0 to 1 :=0;

	

	

begin

	



encode_pro:process(clk)

	begin

		if(reset='0')then

			cnt<=13;

			data_seq(12 downto 9)<="1110";

			data_seq(8 downto 0)<=(others=>'0');

		else

			if(rising_edge(clk)) then

				if(detect_done='1')then

					

					data_seq(8 downto 0)<=Din;

					cnt<=13;

					phase<=0;

				

				else						

					if(cnt>0) then

						if(data_seq(cnt-1)='0') then   ---01=>0

							case phase is

							when 0 => Dout<='0';

									phase<=1;

							when 1 => Dout<='1';

									phase<=0;
									cnt<=cnt-1;

							when others => Dout<='0';

										phase<=0;
										

							end case;

						else

							case phase is              ---10=>1

							when 0 => Dout<='1';

									phase<=1;

							when 1 => Dout<='0';

									phase<=0;
									cnt<=cnt-1;

							when others => Dout<='0';

										phase<=0;
										

							end case;

						end if;


					else

						cnt<=13;

					end if;

				end if;

			end if;

		end if;

	end process;

	

end architecture arc;


	

