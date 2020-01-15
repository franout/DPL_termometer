restart -f -nowave
view signals wave
--add wave clk_tb,reset_tb, ind_outd_sw_tb,data_receive_from_rece_tb
--add wave tmp_sensor_tb,ledtest_tb,lcd_rs_tb,lcd_rw_tb,lcd_enable_tb ,lcd_data_tb ,temstart_tb,system_ready_tb
add wave -position insertpoint  sim:/top_thermomether_tb/clk_tb
add wave -position insertpoint  sim:/top_thermomether_tb/reset_tb
add wave -position insertpoint  sim:/top_thermomether_tb/ind_outd_sw_tb
add wave -position insertpoint  sim:/top_thermomether_tb/data_receive_from_rece_tb
add wave -position insertpoint  sim:/top_thermomether_tb/tmp_sensor_tb
add wave -position insertpoint  sim:/top_thermomether_tb/ledtest_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/lcd_rs_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/lcd_rw_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/lcd_enable_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/lcd_data_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/temstart_tb
--add wave -position insertpoint  sim:/top_thermomether_tb/system_ready_tb
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/interface_lcd/done
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/interface_lcd/enable_init
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/interface_lcd/state
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/interface_tmp_rf_sensor/led
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/interface_tmp_rf_sensor/tem/state
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/cu/curr_state
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/cu/next_state
add wave -position insertpoint  sim:/top_thermomether_tb/top_thermometer_comp/cu/start_meas

run 100000000 ns