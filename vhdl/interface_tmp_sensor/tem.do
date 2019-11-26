----------------------------------------------
-- boolean_unit_tb.do                       --
-- do file for running testbench  for       --
-- boolean_unit_tb.vhdl                     --
----------------------------------------------

restart -f -nowave
view signals wave
add wave clk_tb nrst_tb in_out_door_tb dq_tb led1_tb data_tb
 add wave -position insertpoint sim:/temperature_tb/temperature_comp/write_flag
add wave temperature_comp/cnt_add
run 400055 ns
