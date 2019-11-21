library ieee;
use ieee.std_logic_1164.all;

entity temperature is
port (	clk: in std_logic;
		nrst:in std_logic;
		dq	:inout std_logic;
		led1,led2,led3: out std_logic;
		data:out std_logic_vector(8 downto 0));
end temperature;

architecture beh of temperature is
component clock_enable is
port( clk: in std_logic;
	  clk_1us: out std_logic);
end component;

begin
-------------------------------------------signal--------------------------------------
type statetype is (RESET1,RESET2,PRE1,PRE2, CMD_CC, CONV_44, READ_BE, GET_TEMP, READ_BIT,WRITE_LOW, WRITE_HIGH);
signal clk_1us: 						std_logic;
signal cnt: 							natural range 0 to 770 :=0;
signal datatemp: 						std_logic;
signal write_low_cnt, write_high_cnt:	natural range 0 to 2:=0;
signal read_low_cnt, read_high_cnt:		natural range 0 to 9:=0;
signal cnt_wr:							natural range 0 to 8:=0;
--signal cnt:								natural range 0 to 90:=0;
signal writetemp:						std_logic_vector(7 downto 0);
signal write_flag,cnt_rd:				natural range 0 to 3:=0;
signal get_temp_cnt:					natural range 0 to 13:=0;
signal dataout:							std_logic_vector(8 downto 0);

-------------------------------------------component----------------------------------
component clock_enable
port map ( clk=>clk, clk_1us=>clk_1us);

------------------------------------------state machine --------------------------------
process( clk_1us)
begin
	if(nrst='0') then
		state<=RESET1;
		write_high_cnt<=0;
		write_low_cnt<=0;
		rst_cnt<=0;
		read_high_cnt<=0;
		read_low_cnt<=0;
		cnt_wr<=0;
		writetemp<="00000000";
		write_flag<=0;
		get_temp_cnt<=0;
		cnt_rd<=0;
		datatemp<='0';
		dataout<="000000000";
--		cnt<=0;
	else
		case state is
		when RESET1 	=>	cnt<=cnt+1;
							if (cnt< 500) then					-- controller => ds18s20
								dq<='0';							--low reset signal
								state<=RESET2;
							END IF;
						
		WHEN RESET2 	=>	if (cnt>=500 and cnt<520) then		--wait 20 us
								dq<='Z';
								cnt<=cnt+1;
								state<=PRE1;
							end if;
							
		WHEN PRE1		=>	if ( dq='0') then						-- ds => controller
								led1<='1';							--shows the presence of ds18s20
								state<=PRE2;						--when detect the presence pluse, enter PRE2 state 
								cnt<=cnt+1;
							else
								led1<='0';
								state<=RESET1;
								cnt<=0;
							end if;
							
		when PRE2		=>	cnt<=cnt+1;						-- *********the difference of 1 ds and more than 1 ds?**********
							if (cnt>760) then					-- initial finish
								state<=CMD_CC;						-- skip ROM
								cnt<=0;
							end if;
							
		when CMD_CC 	=>	writetemp<="11001100";
							state<=CMD_WR;
		when CMD_WR		=>	case cnt_wr is
							when 0 to 7	=>  if(writetemp(cnt_wr)='0') then
												state<=WRITE_LOW;
											else
												state<=WRITE_HIGH;
											end if;
											cnt_wr<=cnt_wr+1;
							when 8		=>  cnt_wr<=0;
											if(write_flag=0) then				--THE FIRST TIME FOR CC
												state<= CONV_44;
												write_flag<=1;
											elsif(write_flag=1)then				--44
												state<= RESET1;
												write_flag<=2;
											elsif(write_flag=2) then			--THE SECOND TIME FOR CC
												state<=CMD_BE;
												write_flag<=3;
											elsif(write_flag=3) then			--BE
												state<=GET_TEMP;				-- get temperature
												write_flag<=0;
											end if;
												
							when others =>  cnt_wr<=0;
							end case;
		
		WHEN WRITE_LOW  =>	case write_low_cnt is
							when 0		=>  dq<='0';
											if (cnt=80) then
												write_low_cnt<=1;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 1		=>	dq<='Z';
											if (cnt=10) then
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
											if (cnt=5) then
												write_high_cnt<=1;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 1		=>  dq<='Z';
											if (cnt=60) then
												write_high_cnt<=2;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 2		=>  state<=CMD_WR;
											write_high_cnt<=0;
							when others =>  write_high_cnt<=0;
							end case;
							
		when CONV_44	=> 	writetemp<="01000100";
							state<=CMD_WR;
		when CMD_BE		=>  writetemp<="10111110";
							state<=CMD_WR;
		when GET_TEMP	=>  case get_temp_cnt is												--read temperature from dq
							when 0			=>	state<=READ_BIT;
												get_temp_cnt<=get_temp_cnt+1;
							when 1 to 9		=>	dataout(get_temp_cnt-1)<=datatemp;				--0 to 8: 9 bits
												state<=READ_BIT;
												get_temp_cnt<=get_temp_cnt+1;
							when 10			=>  dataout(8)<=dataout(8);
												get_temp_cnt<=0;
												state<= RESET1;
							WHEN OTHERS		=>  get_temp_cnt<=0;
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
											if(cnt=5) then 		--13us read out data from dq;
												cnt_rd<=3;
												cnt<=0;
											else
												cnt<=cnt+1;
											end if;
							when 3 		=>  dq<='Z';
											if(cnt=60) then			--delay 60 us
												cnt<=0;
												cnt_rd<=0;
												state<=GET_TEMP;
											else
												cnt<=cnt+1;
											end if;
							when others	=> 	cnt_rd<=0;
							end case;
		when others     => 	state<=RESET1;
		END CASE;
	END IF;
data<= (not dataout)
end process;

end beh;