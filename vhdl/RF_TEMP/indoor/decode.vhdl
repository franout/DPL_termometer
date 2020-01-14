library ieee;

use ieee.std_logic_1164.all;



entity decode is

	port(reset		 : in  std_logic;

		 clk 		 : in  std_logic;

		 Din  		 : in  std_logic;
		 
		 finish		 : out std_logic;

		 Dout 		 : out  std_logic_vector(8 downto 0));

end entity;



architecture arc of decode is

	signal  init_seq  : std_logic_vector(7 downto 0); --1110=>10101001

	signal  start_flag: std_logic;

	signal 	data_in   : std_logic;   

	signal  phase     : natural range 0 to 2 :=0;

	signal  cnt       : natural range 0 to 9 :=9;
	
--	signal finish	  : std_logic;

--detect the start sequence,

--decode the data



begin

	process(clk)

	

	begin

		if(reset='1')then

			cnt<=0;

			init_seq<=(others=>'1');
			
			finish<='0';
			
		--	Dout<=(others=>'1');

		else

			if(falling_edge(clk)) then 

				if(init_seq/="10101001")then

					init_seq(7 downto 1) <= init_seq(6 downto 0);

					init_seq(0)<=Din;

					cnt<=9;

					phase<=0;

				else

					if(cnt > 0)then
						finish<='0';

						case phase is

						when 0 => if (Din='0') then

									data_in<='0';

								else 

									data_in<='1';

								end if;

								phase<=1;

						when 1 => if (data_in='0' and Din='1') then

									Dout(cnt-1)<='0';

								elsif(data_in='1' and Din='0') then

									Dout(cnt-1)<='1';

								else

									Dout(cnt-1)<='1';

								end if;

								phase<=0;
								cnt<=cnt-1;

						when others => Dout(cnt-1)<='1';

								   phase<=0;

						end case;

						

					else
						finish<='1';
						init_seq<=(others=>'0');

					end if;

				end if;

			end if;

		end if;

	end process;

end architecture arc;
