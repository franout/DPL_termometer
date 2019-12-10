----------------------------------------------
-- boolean_unit_tb.do                       --
-- do file for running testbench  for       --
-- top_rf_tb.vhdl                     --
----------------------------------------------

restart -f -nowave
view signals wave
add wave clk_tb data_in_tb data_recei_tb data_out_tb
--add wave data_trans_tb
add wave -position insertpoint sim:/top_rf_tb/top_rf_com/transmitter_com/Outs
add wave -position insertpoint sim:/top_rf_tb/top_rf_com/receiver_com/Outs
run 600055 ns
