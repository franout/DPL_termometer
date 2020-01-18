library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;


entity comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_outmax : out  STD_LOGIC_VECTOR (N-1 downto 0);
		   data_outmin : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC);
end comparison;

architecture structural of comparison is
signal data_max_in: STD_LOGIC_VECTOR (N-1 downto 0);
signal data_min_in: STD_LOGIC_VECTOR (N-1 downto 0);
signal data_max_out: STD_LOGIC_VECTOR (N-1 downto 0);
signal data_min_out: STD_LOGIC_VECTOR (N-1 downto 0);
--signal state_in: natural range 0 to 3:=0;
--signal state_out: natural range 0 to 3:=0;
signal start_comparison_in: STD_LOGIC;
signal start_comparison_out: STD_LOGIC;
signal done_comparison_in: STD_LOGIC;
signal done_comparison_out: STD_LOGIC;

component comparison_com is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
--				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_outmax : out  STD_LOGIC_VECTOR (N-1 downto 0);
		   data_outmin : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC);
end component comparison_com;

begin


process (clk)
begin
   
	if(rising_edge (clk)) then
	   if(in_out_sel='1') then
	      start_comparison_in<=start_comparison;
	    else
	       start_comparison_out<=start_comparison; 
	    end if;
	
	end if; 
end process;
comparison_indoor:comparison_com GENERIC MAP (9) PORT MAP(clk=>clk,reset=>reset,
			data_in=>data_in ,
			data_outmax=>data_max_in , 
		    data_outmin=>data_min_in,
            start_comparison=>start_comparison_in,
            done_comparison=>done_comparison_in 
		   );
comparison_outdoor:comparison_com GENERIC MAP (9) PORT MAP(clk=>clk,reset=>reset,
			data_in=>data_in ,
			data_outmax=>data_max_out , 
		    data_outmin=>data_min_out,
            start_comparison=>start_comparison_out ,
            done_comparison=>done_comparison_out 
		   );

done_comparison<= done_comparison_in when in_out_sel='1' else
					done_comparison_out;		   
data_outmax<=data_max_in when in_out_sel='1' else
			  data_max_out;
data_outmin<=data_min_in when in_out_sel='1' else
			 data_min_out;

end structural;
