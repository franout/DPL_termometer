----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:25 11/20/2019 
-- Design Name: 
-- Module Name:    comparison - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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



entity comparison is
GENERIC (N:integer:= 8);
    Port ( clk,reset: in STD_LOGIC;
				in_out_sel: in std_logic;
				data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           start_comparison : in  STD_LOGIC; -- aka enable 
           done_comparison : out  STD_LOGIC;
           select_data : in  STD_LOGIC_VECTOR (1 downto 0));
end comparison;

architecture structural of comparison is


component counter_comparison is
    Port ( clk : in  STD_LOGIC;
           reset,enable : in  STD_LOGIC;
           tc : out  STD_LOGIC;
			cnt_val: out STD_LOGIC);
end component counter_comparison;

COMPONENT  reg is
GENERIC ( N : integer:= 8);
    Port ( reset : in  STD_LOGIC;
           clk ,enable: in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT reg;

component mux4_1 is
GENERIC(N:integer:=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           c : in  STD_LOGIC_VECTOR (N-1 downto 0);
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component mux4_1;

component mux is
GENERIC ( N: integer:=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0); -- s at 0 
           b : in  STD_LOGIC_VECTOR (N-1 downto 0); -- s at 1
           s : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component mux;

component comparator is
GENERIC ( N: integer :=8);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           enable : in  STD_LOGIC; -- enable comparison i.e. it is the start_computation signal 
           res : out  STD_LOGIC); -- result of the comparison 1-> a>= b , 0 -> a<b 
end  component comparator;



SIGNAL curr_tmp: std_logic_vector( N-1 DOWNTO 0);
SIGNAL comparison_result_neg,comparison_result,in_out_sel_neg,enable_reg,enable_reg_out: std_logic;
SIGNAL cnt_val,comparison_result_max,comparison_result_min,cnt_val_n: std_logic;
SIGNAL data_in_max_ind,data_in_max_outd,data_in_min_outd,
			data_in_min_ind,max_ind,min_ind,max_outd,min_outd,b_io,min_i,max_i: std_logic_vector(N-1 DOWNTO 0);

begin


state_count: counter_comparison  PORT MAP(enable=>start_comparison ,clk=>clk,reset=>reset,tc=> done_comparison,cnt_val=>cnt_val);


in_out_sel_neg<=not(in_out_sel);
enable_reg<=in_out_sel and start_comparison;
enable_reg_out<= (in_out_sel_neg and start_comparison );
curr_tmp_reg: reg GENERIC MAP (N=>N) PORT MAP (enable=>start_comparison,clk=>clk,reset=>reset,data_in=>data_in,data_out=>curr_tmp);


-- indoor registers for maximum and minimun tmp

max_tmp_reg_ind:reg GENERIC MAP (N=>N) PORT MAP (enable=>enable_reg  ,clk=>clk,reset=>reset,data_in=>data_in_max_ind,data_out=>max_ind);
min_tmp_reg_ind: reg GENERIC MAP (N=>N) PORT MAP (enable => enable_reg , clk=>clk,reset=>reset,data_in=>data_in_min_ind,data_out=>min_ind);



-- outdoor registers for for maximum and minimun tmp


max_tmp_reg_out:reg GENERIC MAP (N=>N) PORT MAP (enable=>enable_reg_out ,clk=>clk,reset=>reset,data_in=>data_in_max_outd,data_out=>max_outd);
min_tmp_reg_out:reg GENERIC MAP (N=>N) PORT MAP (enable=>enable_reg_out ,clk=>clk,reset=>reset,data_in=>data_in_min_outd,data_out=>min_outd);


-- comparison block 
comp: comparator GENERIC MAP(N=>N) PORT MAP(a=>curr_tmp,enable=>start_comparison,b=>b_io,res=>comparison_result);

comparison_result_neg<=not(comparison_result);
-- muxes 
-- for comparator 
mux_1: mux GENERIC MAP(N=>N) PORT MAP( b=>min_i , a=>max_i , s=>cnt_val , y=>b_io);  
mux_2: mux GENERIC MAP(N=>N) PORT MAP(a=>max_outd, b=>max_ind, s=>in_out_sel, y=>max_i);
mux_3: mux GENERIC MAP(N=>N) PORT MAP(a=>min_outd, b=>min_ind, s=>in_out_sel, y=>min_i);

-- for registers
-- minumum
mux_4: mux GENERIC MAP(N=>N) PORT MAP(a=>min_outd, b=>curr_tmp, s=>comparison_result_min, y=>data_in_min_outd);
mux_7: mux GENERIC MAP(N=>N) PORT MAP(a=>min_ind, b=>curr_tmp, s=>comparison_result_min, y=>data_in_min_ind);
-- maximum
mux_6: mux GENERIC MAP(N=>N) PORT MAP(a=>max_ind, b=>curr_tmp, s=>comparison_result_max, y=>data_in_max_ind);
mux_5: mux GENERIC MAP(N=>N) PORT MAP(a=>max_outd, b=>curr_tmp, s=>comparison_result_max, y=>data_in_max_outd);

-- for data out 
													
mux_out: mux4_1 GENERIC MAP(N=>N) PORT MAP(c=>curr_tmp, a=>max_i,b=> min_i,d=>(OTHERS=>'0'), s=>select_data, y=>data_out);



-- for masking mux during max/min phases
cnt_val_n<=not(cnt_val);


comparison_result_max<=comparison_result and (cnt_val_n);
comparison_result_min<= comparison_result_neg and cnt_val;

end structural;