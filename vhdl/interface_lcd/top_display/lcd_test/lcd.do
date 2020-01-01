restart -f -nowave
view signals wave
add wave clk_tb rst_tb LCD_E_tb LCD_RS_tb LCD_RW_tb LCD_DB_tb
add wave -position insertpoint sim:/lcd_tb/LCD_try_comp/state
add wave -position insertpoint sim:/lcd_tb/LCD_try_comp/clk_2ms
run 10000000ns

