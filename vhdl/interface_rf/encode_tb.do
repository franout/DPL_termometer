restart -f -nowave
view signals wave
add wave reset_tb detect_done_tb clk_tb
add wave Din_tb 
--run 1055 ns
