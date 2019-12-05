library ieee;
use ieee.std_logic_1164.all;

entity Read_rom is
port (	clk: in std_logic;
		nrst:in std_logic;
		dq	:inout std_logic;
		led1: out std_logic;
		data:out std_logic_vector(63 downto 0));
end Read_rom;

architecture beh of Read_rom is
component clock_enable is
port( clk: in std_logic;
	  clk_1us: out std_logic);
end component;

type statetype is (RESET1,RESET2,PRE1,PRE2,Read_rom,write_add,wait_conv,CMD_WR,GET_ADDR,READ_BIT,WRITE_LOW,WRITE_HIGH);
signal clk_1us: 						std_logic;
signal cnt: 							natural range 0 to 870 :=0;
signal datatemp: 						std_logic;
signal detect_done:						std_logic;
signal search_time:                     std_logic;
signal write_low_cnt, write_high_cnt:	natural range 0 to 2:=0;
signal read_low_cnt, read_high_cnt:		natural range 0 to 9:=0;
signal cnt_wr:      					natural range 0 to 8:=0;
signal cnt_add:      					natural range 0 to 8:=0;
signal address64:                       std_logic_vector(65 downto 0);
signal writetemp:						std_logic_vector(7 downto 0);
signal write_flag,cnt_rd:				natural range 0 to 3:=0;
signal GET_ADDR_cnt:					natural range 0 to 65:=0;
signal dataout:							std_logic_vector(63 downto 0);
signal state:                           statetype;

begin

--clk_1us<=clk;
clk_com:component clock_enable
	port map ( clk=>clk, clk_1us=>clk_1us);

process( clk_1us)
begin
	if(nrst='0') then
		state<=RESET1;
		write_high_cnt<=0;
		write_low_cnt<=0;
		search_time<='0';
		read_high_cnt<=0;
		read_low_cnt<=0;
		cnt_wr<=0;
		cnt_add<=0;
		writetemp<="00000000";
		write_flag<=0;
		GET_ADDR_cnt<=0;
		cnt_rd<=0;
		datatemp<='0';
		dataout<=(others=>'0');
		detect_done<='0';
	else
	if(rising_edge(clk_1us)) then
		case state is
		when RESET1 	=>	cnt<=cnt+1;
							dq<='0';
							if (cnt> 499) then					-- controller => ds18s20
								dq<='0';							--low reset signal
								state<=RESET2;					--
							END IF;
						
		WHEN RESET2 	=>	if (cnt<515) then	                                            	--wait 15 us
								dq<='Z';
								cnt<=cnt+1;
								state<=PRE1;
							end if;
							
		WHEN PRE1		=>	if (cnt<560) then						-- ds18s20 => controller
								if(dq='0') then
									led1<='1';							--shows the presence of ds18s20 to controller
									state<=PRE2;
								else
									dq<='Z';
								end if;
								cnt<=cnt+1;
							else
								led1<='0';
								state<=RESET1;                      --没收到就再reset一下?
								cnt<=0;
							end if;
							
		when PRE2		=>	cnt<=cnt+1;			-- finish the reset
							led1<='0';
							if(detect_done='0')then
								if (cnt>759) then					-- initial finish 
									state<=Read_rom;						-- find the appropriate ds18s20
									cnt<=0;
								end if;
							else
								state<=PRE2;
								dq<='Z';
							end if;
		when Read_rom  =>  writetemp<="00110011"; --read_rom:33h
							state<=CMD_WR;
							cnt_add<=0;
		when CMD_WR		=>	case cnt_wr is
							when 0 to 7	=>  if(writetemp(cnt_wr)='0') then
												state<=WRITE_LOW;
											else
												state<=WRITE_HIGH;
											end if;
											cnt_wr<=cnt_wr+1;
							when 8 		=>  cnt_wr<=0;
											state<=GET_ADDR;
							when others =>  cnt_wr<=0;
							end case;
		
		WHEN WRITE_LOW  =>	case write_low_cnt is
							when 0		=>  dq<='0';
											if (cnt=79) then
												write_low_cnt<=1;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 1		=>	dq<='Z';
											if (cnt=9) then
												write_low_cnt<=2;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 2		=>  state<= CMD_WR;
											write_low_cnt<=0;
							when others =>  write_low_cnt<=0;
							end case;
							
		when WRITE_HIGH	=>  case write_high_cnt is
							when 0		=>	dq<='0';
											if (cnt=4) then
												write_high_cnt<=1;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 1		=>  dq<='Z';
											if (cnt=59) then
												write_high_cnt<=2;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 2		=>  state<=CMD_WR;
											write_high_cnt<=0;
							when others =>  write_high_cnt<=0;
							end case;
							
		when GET_ADDR	=>  case GET_ADDR_cnt is												--read temperature from dq
							when 0			=>	state<=READ_BIT;
												GET_ADDR_cnt<=GET_ADDR_cnt+1;
							when 1 to 64		=>	dataout(GET_ADDR_cnt-1)<=datatemp;				--0 to 63: 64 bits
												state<=READ_BIT;
												GET_ADDR_cnt<=GET_ADDR_cnt+1;
							when 65			=>  dataout(63)<=dataout(63);
												GET_ADDR_cnt<=0;
												state<= RESET1;
												detect_done<='1';
							WHEN OTHERS		=>  GET_ADDR_cnt<=0;
							end case;
		
		when READ_BIT	=>  case cnt_rd is
							when 0		=>	dq<='0';
											if (cnt=4) then
												cnt_rd<=1;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 1		=>  dq<='Z';
											if (cnt=4) then
												cnt_rd<=2;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 2		=>	dq<='Z';
											datatemp<=dq;
											if(cnt=2) then 		--13us read out data from dq;
												cnt_rd<=3;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 3 		=>  dq<='Z';
											if(cnt=71) then			--delay 72 us
												cnt<=0;
												cnt_rd<=0;
												state<=GET_ADDR;
											else
												cnt<=cnt+1;
											end if;
							when others	=> 	cnt_rd<=0;
							end case;
		when others     => 	state<=RESET1;
		END CASE;
	end if ;
	END IF;
data<=  dataout;

end process;

end beh;