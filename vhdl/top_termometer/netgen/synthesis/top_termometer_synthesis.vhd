--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: top_termometer_synthesis.vhd
-- /___/   /\     Timestamp: Fri Nov 29 18:58:35 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm top_termometer -w -dir netgen/synthesis -ofmt vhdl -sim top_termometer.ngc top_termometer_synthesis.vhd 
-- Device	: xc7a100tl-2L-csg324
-- Input file	: top_termometer.ngc
-- Output file	: D:\uni\2019-2020\CTH\Digital_project_laboratory\project\vhdl\top_termometer\netgen\synthesis\top_termometer_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: top_termometer
-- Xilinx	: D:\programmi\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity top_termometer is
  port (
    reset : in STD_LOGIC := 'X'; 
    main_clk : in STD_LOGIC := 'X'; 
    ind_outd_sw : in STD_LOGIC := 'X'; 
    tmp_sensor : inout STD_LOGIC; 
    lcd_enable : out STD_LOGIC; 
    lcd_rw : out STD_LOGIC; 
    lcd_rs : out STD_LOGIC; 
    system_ready : out STD_LOGIC; 
    lcd_data : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end top_termometer;

architecture Structure of top_termometer is
  signal reset_IBUF_0 : STD_LOGIC; 
  signal ind_outd_sw_IBUF_2 : STD_LOGIC; 
  signal reset_top : STD_LOGIC; 
  signal init_set_up : STD_LOGIC; 
  signal cu_in_out_val_5 : STD_LOGIC; 
  signal start_comparison : STD_LOGIC; 
  signal start_display : STD_LOGIC; 
  signal system_ready_OBUF_8 : STD_LOGIC; 
  signal clk : STD_LOGIC; 
  signal interface_lcd_interface_done_18 : STD_LOGIC; 
  signal interface_lcd_interface_RS_19 : STD_LOGIC; 
  signal lcd_enable_OBUF_20 : STD_LOGIC; 
  signal comparison_block_state_count_tc_30 : STD_LOGIC; 
  signal interface_tmp_sensor_led1_41 : STD_LOGIC; 
  signal clk_gen_clkfbout_buf : STD_LOGIC; 
  signal clk_gen_clkout0 : STD_LOGIC; 
  signal clk_gen_clkfbout : STD_LOGIC; 
  signal clk_gen_clkin1 : STD_LOGIC; 
  signal interface_lcd_enable_tr : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_clk_enable_47 : STD_LOGIC; 
  signal interface_lcd_interface_enable_translator_48 : STD_LOGIC; 
  signal interface_lcd_data_in_inter_0_Q : STD_LOGIC; 
  signal interface_lcd_data_in_inter_3_Q : STD_LOGIC; 
  signal interface_lcd_data_in_inter_4_Q : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_n0012 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_0 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_1 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_2 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_3 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_4 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_5 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_6 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_7 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_8 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_9 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_10 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_11_90 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_12 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_eqn_13 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_3 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_4_110 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd1_125 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_126 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_127 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_128 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd1_In : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_wr3 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_wr2 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_wr1 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_wr : STD_LOGIC; 
  signal interface_tmp_sensor_n0438_inv : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_add3 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_add2 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_add1 : STD_LOGIC; 
  signal interface_tmp_sensor_Mcount_cnt_add : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd2_143 : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd1_In : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd2_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd1_146 : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd2_147 : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd1_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd2_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd1_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd2_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd1_152 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd2_153 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd1_In : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd2_In : STD_LOGIC; 
  signal interface_tmp_sensor_n0590_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0499_inv_157 : STD_LOGIC; 
  signal interface_tmp_sensor_n0647_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0535_inv : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_clk_1us_DFF_94_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0452_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0482_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0531_inv : STD_LOGIC; 
  signal interface_tmp_sensor_n0527_inv : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_inv : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_wr_2_writetemp_7_Mux_49_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_0_datatemp_MUX_1132_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_1_datatemp_MUX_1131_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_2_datatemp_MUX_1130_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_3_datatemp_MUX_1129_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_4_datatemp_MUX_1128_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_5_datatemp_MUX_1127_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_6_datatemp_MUX_1126_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_7_datatemp_MUX_1125_o : STD_LOGIC; 
  signal interface_tmp_sensor_dataout_8_datatemp_MUX_1124_o : STD_LOGIC; 
  signal interface_tmp_sensor_dq_state_3_MUX_1141_o : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_PWR_30_o_Mux_176_o : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_0_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_1_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_2_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_3_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_4_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_5_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_6_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_7_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_8_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_9_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_Mux_136_o : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_0_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_1_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_2_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_3_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_4_Q : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_6_Q : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_state_3_AND_59_o : STD_LOGIC; 
  signal interface_tmp_sensor_state_3_clk_1us_DFF_94_200 : STD_LOGIC; 
  signal interface_tmp_sensor_datatemp_201 : STD_LOGIC; 
  signal interface_tmp_sensor_detect_done_202 : STD_LOGIC; 
  signal interface_tmp_sensor_search_time_203 : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_0_Q : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_1_Q : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_2_Q : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_3_Q : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_4_Q : STD_LOGIC; 
  signal interface_tmp_sensor_writetemp_6_Q : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd1_217 : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd2_218 : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd1_219 : STD_LOGIC; 
  signal interface_tmp_sensor_dq_220 : STD_LOGIC; 
  signal interface_tmp_sensor_n0482_inv2 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT812 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In11 : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_state_3_AND_59_o121 : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11_225 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT11 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT421 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In43_228 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In61 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In621 : STD_LOGIC; 
  signal interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o : STD_LOGIC; 
  signal interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd1_In11 : STD_LOGIC; 
  signal interface_tmp_sensor_cnt_rd_FSM_FFd1_In2 : STD_LOGIC; 
  signal interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511_237 : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd1_In2 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In2_240 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15121 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT291 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16121 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In21 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1521 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In4_248 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1931 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1611 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In2 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12221 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In3 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In3_257 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT3711 : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd2_In111 : STD_LOGIC; 
  signal interface_tmp_sensor_n0527_inv1_260 : STD_LOGIC; 
  signal interface_tmp_sensor_write_flag_FSM_FFd1_In2 : STD_LOGIC; 
  signal interface_tmp_sensor_state_0_inv_inv : STD_LOGIC; 
  signal interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd1_In : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd2_In : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd3_In : STD_LOGIC; 
  signal cu_reset_inv : STD_LOGIC; 
  signal cu_curr_state_2_GND_56_o_Mux_26_o : STD_LOGIC; 
  signal cu_enable_wd : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd3_272 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd2_273 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd1_274 : STD_LOGIC; 
  signal cu_watch_dog_tc_275 : STD_LOGIC; 
  signal cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_Q : STD_LOGIC; 
  signal cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_0_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_1_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_2_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_3_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_4_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_5_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_6_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_7_Q : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_8_Q : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_0_bdd46 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_bdd41 : STD_LOGIC; 
  signal interface_lcd_translate_int_counter_select_Mcount_cnt2 : STD_LOGIC; 
  signal interface_lcd_translate_int_counter_select_Mcount_cnt1 : STD_LOGIC; 
  signal interface_lcd_translate_int_counter_select_Mcount_cnt : STD_LOGIC; 
  signal interface_lcd_translate_int_reset_i : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT136 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_142 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_22_308 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd4_In11 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd1_In1 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_71 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_9 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_8 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_7 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_61 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_71 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_62 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_72 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_63_320 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_73 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_64 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_74 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_65 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_75 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_66 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_76 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_67 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_77 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_5_Q_333 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_4_Q_334 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_3_Q_335 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_2_Q_336 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_1_Q_337 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_0_Q_339 : STD_LOGIC; 
  signal interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_Q_341 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_Q_342 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_0_Q_343 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_lut_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd1_345 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd2_346 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd3_347 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd4_348 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd1_In : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd2_In_350 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd3_In : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd4_In : STD_LOGIC; 
  signal interface_lcd_interface_n0400_inv : STD_LOGIC; 
  signal interface_lcd_interface_n0419_inv : STD_LOGIC; 
  signal interface_lcd_interface_n0441_inv : STD_LOGIC; 
  signal interface_lcd_interface_reset_inv : STD_LOGIC; 
  signal interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o : STD_LOGIC; 
  signal interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_1_Q : STD_LOGIC; 
  signal interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_2_Q : STD_LOGIC; 
  signal interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_3_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_Mux_98_o : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_Mux_96_o : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_Mux_102_o : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_1_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_2_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_3_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_1_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_2_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_3_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_4_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_5_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_6_Q : STD_LOGIC; 
  signal interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_7_Q : STD_LOGIC; 
  signal interface_lcd_interface_dataOUT_7_GND_5_o_mux_14_OUT_2_Q : STD_LOGIC; 
  signal interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_Q : STD_LOGIC; 
  signal interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_Q : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_3_Q_392 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_3_Q_393 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi3_394 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_2_Q_395 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_2_Q_396 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi2_397 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_1_Q_398 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_1_Q_399 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi1_400 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_0_Q_401 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_0_Q_402 : STD_LOGIC; 
  signal comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi_403 : STD_LOGIC; 
  signal comparison_block_comp_a_8_b_8_LessThan_1_o : STD_LOGIC; 
  signal comparison_block_state_count_tc_cnt_MUX_1144_o : STD_LOGIC; 
  signal comparison_block_state_count_cnt_cnt_MUX_1146_o : STD_LOGIC; 
  signal comparison_block_comp_res_452 : STD_LOGIC; 
  signal comparison_block_enable_reg_out : STD_LOGIC; 
  signal comparison_block_enable_reg : STD_LOGIC; 
  signal comparison_block_state_count_cnt_491 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_n0012_13_1_502 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd1_In1_504 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd1_In2_505 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT8 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT81_507 : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_state_3_AND_59_o1_508 : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_state_3_AND_59_o2_509 : STD_LOGIC; 
  signal interface_tmp_sensor_nrst_state_3_AND_59_o3_510 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd3_In5_511 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd1_In1_512 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd1_In3_513 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In3_514 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In5_515 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In6_516 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd2_In7 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT4 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT41_519 : STD_LOGIC; 
  signal interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2_520 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd2_In1_522 : STD_LOGIC; 
  signal interface_tmp_sensor_write_low_cnt_FSM_FFd2_In2_523 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In1_524 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In2_525 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In5_526 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In6_527 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In7_528 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In8_529 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In9_530 : STD_LOGIC; 
  signal interface_tmp_sensor_state_FSM_FFd4_In10_531 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT20 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT201_534 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT202_535 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT161_537 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT162_538 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT281_540 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT282_541 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122_543 : STD_LOGIC; 
  signal interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124_544 : STD_LOGIC; 
  signal interface_tmp_sensor_n0647_inv1_545 : STD_LOGIC; 
  signal interface_tmp_sensor_n0647_inv2_546 : STD_LOGIC; 
  signal interface_tmp_sensor_n0590_inv2_547 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd3_In1 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd3_In11_550 : STD_LOGIC; 
  signal cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_3 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_4_554 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_5_555 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_6_556 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_7_557 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_8_558 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_3_9_559 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_4 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_5_561 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_7 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_11 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_12_564 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_1_13_565 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_0_4 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_0_6 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_0_13 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_1_570 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_2_571 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_4 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_5_573 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_13 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_14_575 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_15_576 : STD_LOGIC; 
  signal interface_lcd_translate_int_data_out_2_16_577 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT1 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT11_579 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_61 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_1_582 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_12 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_13_584 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o31 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32_586 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o33_587 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o21 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o22_590 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o23_591 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o24_592 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_2_594 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_21_595 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_24_596 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_4_597 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_41_598 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_42_599 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_3 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_5_602 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal interface_lcd_interface_state_FSM_FFd4_In1_604 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT251_605 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_31_606 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_32_607 : STD_LOGIC; 
  signal interface_lcd_interface_state_3_33_608 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT13 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT131 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y2 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y21_613 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y9 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y91_615 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y8 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y81_617 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y7 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y71_619 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y6 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y61_621 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y5 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y51_623 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y4 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y41_625 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y3 : STD_LOGIC; 
  signal comparison_block_mux_out_Mmux_y31_627 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_1_rt_643 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_2_rt_644 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_3_rt_645 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_4_rt_646 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_5_rt_647 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_6_rt_648 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_7_rt_649 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_8_rt_650 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_9_rt_651 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_10_rt_652 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_11_rt_653 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy_12_rt_654 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_rt_655 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_rt_656 : STD_LOGIC; 
  signal interface_lcd_clk_enable_unit_Mcount_count_xor_13_rt_657 : STD_LOGIC; 
  signal interface_lcd_interface_Mcount_init_count_xor_1_rt_658 : STD_LOGIC; 
  signal interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_3_rt_659 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N47 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal N102 : STD_LOGIC; 
  signal interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_lut_703 : STD_LOGIC; 
  signal N104 : STD_LOGIC; 
  signal N105 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N107 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N113 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N115 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal N124 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N130 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd3_1_728 : STD_LOGIC; 
  signal cu_curr_state_FSM_FFd2_1_729 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal N146 : STD_LOGIC; 
  signal N147 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N149 : STD_LOGIC; 
  signal N150 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_LOCKED_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_clk_gen_mmcm_adv_inst_DO_0_UNCONNECTED : STD_LOGIC; 
  signal interface_lcd_interface_dataOUT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal data_from_comparison : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal interface_tmp_sensor_dataout : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal interface_lcd_clk_enable_unit_count : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal interface_lcd_clk_enable_unit_Mcount_count_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal interface_lcd_clk_enable_unit_Mcount_count_cy : STD_LOGIC_VECTOR ( 12 downto 0 ); 
  signal interface_tmp_sensor_cnt : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal interface_tmp_sensor_get_temp_cnt : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal interface_tmp_sensor_cnt_wr : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal interface_tmp_sensor_cnt_add : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal cu_edge_detect : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal cu_watch_dog_cnt : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal interface_lcd_translate_int_counter_select_cnt : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal interface_lcd_interface_Mcount_init_count_cy : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal interface_lcd_interface_Mcount_init_count_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal interface_lcd_interface_Result : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal interface_lcd_interface_writing_counter : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal interface_lcd_interface_init_count : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal interface_lcd_interface_state : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal interface_lcd_interface_GND_5_o_GND_5_o_select_28_OUT : STD_LOGIC_VECTOR ( 5 downto 5 ); 
  signal comparison_block_b_io : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_data_in_max_outd : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_data_in_max_ind : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_data_in_min_ind : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_data_in_min_outd : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_min_tmp_reg_out_data : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_max_tmp_reg_out_data : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_min_tmp_reg_ind_data : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_max_tmp_reg_ind_data : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal comparison_block_curr_tmp_reg_data : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal interface_lcd_clk_enable_unit_n0012_0 : STD_LOGIC_VECTOR ( 13 downto 13 ); 
  signal interface_lcd_translate_int_data_out : STD_LOGIC_VECTOR ( 2 downto 2 ); 
begin
  XST_GND : GND
    port map (
      G => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q
    );
  XST_VCC : VCC
    port map (
      P => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q
    );
  interface_lcd_clk_enable_unit_clk_enable : FDC
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_n0012,
      Q => interface_lcd_clk_enable_unit_clk_enable_47
    );
  interface_lcd_clk_enable_unit_count_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_0,
      Q => interface_lcd_clk_enable_unit_count(0)
    );
  interface_lcd_clk_enable_unit_count_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_1,
      Q => interface_lcd_clk_enable_unit_count(1)
    );
  interface_lcd_clk_enable_unit_count_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_2,
      Q => interface_lcd_clk_enable_unit_count(2)
    );
  interface_lcd_clk_enable_unit_count_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_3,
      Q => interface_lcd_clk_enable_unit_count(3)
    );
  interface_lcd_clk_enable_unit_count_4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_4,
      Q => interface_lcd_clk_enable_unit_count(4)
    );
  interface_lcd_clk_enable_unit_count_5 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_5,
      Q => interface_lcd_clk_enable_unit_count(5)
    );
  interface_lcd_clk_enable_unit_count_6 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_6,
      Q => interface_lcd_clk_enable_unit_count(6)
    );
  interface_lcd_clk_enable_unit_count_7 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_7,
      Q => interface_lcd_clk_enable_unit_count(7)
    );
  interface_lcd_clk_enable_unit_count_8 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_8,
      Q => interface_lcd_clk_enable_unit_count(8)
    );
  interface_lcd_clk_enable_unit_count_9 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_9,
      Q => interface_lcd_clk_enable_unit_count(9)
    );
  interface_lcd_clk_enable_unit_count_10 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_10,
      Q => interface_lcd_clk_enable_unit_count(10)
    );
  interface_lcd_clk_enable_unit_count_11 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_11_90,
      Q => interface_lcd_clk_enable_unit_count(11)
    );
  interface_lcd_clk_enable_unit_count_12 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_12,
      Q => interface_lcd_clk_enable_unit_count(12)
    );
  interface_lcd_clk_enable_unit_count_13 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_clk_enable_unit_Mcount_count_eqn_13,
      Q => interface_lcd_clk_enable_unit_count(13)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_0_Q : MUXCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_lut(0),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(0)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_0_Q : XORCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      LI => interface_lcd_clk_enable_unit_Mcount_count_lut(0),
      O => Result(0)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_1_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(0),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_1_rt_643,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(1)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_1_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(0),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_1_rt_643,
      O => Result(1)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_2_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(1),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_2_rt_644,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(2)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_2_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(1),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_2_rt_644,
      O => Result(2)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_3_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(2),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_3_rt_645,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(3)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_3_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(2),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_3_rt_645,
      O => Result(3)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_4_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(3),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_4_rt_646,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(4)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_4_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(3),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_4_rt_646,
      O => Result(4)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_5_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(4),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_5_rt_647,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(5)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_5_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(4),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_5_rt_647,
      O => Result(5)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_6_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(5),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_6_rt_648,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(6)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_6_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(5),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_6_rt_648,
      O => Result(6)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_7_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(6),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_7_rt_649,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(7)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_7_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(6),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_7_rt_649,
      O => Result(7)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_8_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(7),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_8_rt_650,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(8)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_8_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(7),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_8_rt_650,
      O => Result(8)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_9_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(8),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_9_rt_651,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(9)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_9_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(8),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_9_rt_651,
      O => Result(9)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_10_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(9),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_10_rt_652,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(10)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_10_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(9),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_10_rt_652,
      O => Result(10)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_11_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(10),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_11_rt_653,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(11)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_11_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(10),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_11_rt_653,
      O => Result(11)
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_12_Q : MUXCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(11),
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_clk_enable_unit_Mcount_count_cy_12_rt_654,
      O => interface_lcd_clk_enable_unit_Mcount_count_cy(12)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_12_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(11),
      LI => interface_lcd_clk_enable_unit_Mcount_count_cy_12_rt_654,
      O => Result(12)
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_13_Q : XORCY
    port map (
      CI => interface_lcd_clk_enable_unit_Mcount_count_cy(12),
      LI => interface_lcd_clk_enable_unit_Mcount_count_xor_13_rt_657,
      O => Result(13)
    );
  clk_gen_clkout1_buf : BUFG
    port map (
      O => clk,
      I => clk_gen_clkout0
    );
  clk_gen_clkf_buf : BUFG
    port map (
      O => clk_gen_clkfbout_buf,
      I => clk_gen_clkfbout
    );
  clk_gen_mmcm_adv_inst : MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 32.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => FALSE,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 128.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => FALSE,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => FALSE,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => FALSE,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => FALSE,
      CLKOUT4_CASCADE => FALSE,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => FALSE,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => FALSE,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => FALSE,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 5,
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.000000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => FALSE
    )
    port map (
      CLKOUT3 => NLW_clk_gen_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKFBIN => clk_gen_clkfbout_buf,
      PSCLK => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      CLKOUT3B => NLW_clk_gen_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      PWRDWN => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DCLK => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      CLKFBOUT => clk_gen_clkfbout,
      CLKFBSTOPPED => NLW_clk_gen_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKFBOUTB => NLW_clk_gen_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKOUT1 => NLW_clk_gen_mmcm_adv_inst_CLKOUT1_UNCONNECTED,
      DEN => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      CLKOUT5 => NLW_clk_gen_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKINSEL => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      CLKIN2 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DRDY => NLW_clk_gen_mmcm_adv_inst_DRDY_UNCONNECTED,
      RST => reset_IBUF_0,
      PSINCDEC => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DWE => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      PSEN => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      CLKOUT0 => clk_gen_clkout0,
      CLKOUT4 => NLW_clk_gen_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT1B => NLW_clk_gen_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKINSTOPPED => NLW_clk_gen_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0B => NLW_clk_gen_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKIN1 => clk_gen_clkin1,
      CLKOUT2 => NLW_clk_gen_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_clk_gen_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      PSDONE => NLW_clk_gen_mmcm_adv_inst_PSDONE_UNCONNECTED,
      CLKOUT6 => NLW_clk_gen_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      LOCKED => NLW_clk_gen_mmcm_adv_inst_LOCKED_UNCONNECTED,
      DI(15) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(14) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(13) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(12) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(11) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(10) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(9) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(8) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(7) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(6) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(5) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(4) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(3) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(2) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(1) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI(0) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DO(15) => NLW_clk_gen_mmcm_adv_inst_DO_15_UNCONNECTED,
      DO(14) => NLW_clk_gen_mmcm_adv_inst_DO_14_UNCONNECTED,
      DO(13) => NLW_clk_gen_mmcm_adv_inst_DO_13_UNCONNECTED,
      DO(12) => NLW_clk_gen_mmcm_adv_inst_DO_12_UNCONNECTED,
      DO(11) => NLW_clk_gen_mmcm_adv_inst_DO_11_UNCONNECTED,
      DO(10) => NLW_clk_gen_mmcm_adv_inst_DO_10_UNCONNECTED,
      DO(9) => NLW_clk_gen_mmcm_adv_inst_DO_9_UNCONNECTED,
      DO(8) => NLW_clk_gen_mmcm_adv_inst_DO_8_UNCONNECTED,
      DO(7) => NLW_clk_gen_mmcm_adv_inst_DO_7_UNCONNECTED,
      DO(6) => NLW_clk_gen_mmcm_adv_inst_DO_6_UNCONNECTED,
      DO(5) => NLW_clk_gen_mmcm_adv_inst_DO_5_UNCONNECTED,
      DO(4) => NLW_clk_gen_mmcm_adv_inst_DO_4_UNCONNECTED,
      DO(3) => NLW_clk_gen_mmcm_adv_inst_DO_3_UNCONNECTED,
      DO(2) => NLW_clk_gen_mmcm_adv_inst_DO_2_UNCONNECTED,
      DO(1) => NLW_clk_gen_mmcm_adv_inst_DO_1_UNCONNECTED,
      DO(0) => NLW_clk_gen_mmcm_adv_inst_DO_0_UNCONNECTED,
      DADDR(6) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(5) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(4) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(3) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(2) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(1) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DADDR(0) => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q
    );
  clk_gen_clkin1_buf : IBUFG
    generic map(
      CAPACITANCE => "DONT_CARE",
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD => "DEFAULT"
    )
    port map (
      I => main_clk,
      O => clk_gen_clkin1
    );
  interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_4 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(1),
      I1 => interface_tmp_sensor_cnt_wr(0),
      I2 => interface_tmp_sensor_writetemp_2_Q,
      I3 => interface_tmp_sensor_writetemp_3_Q,
      I4 => interface_tmp_sensor_writetemp_1_Q,
      I5 => interface_tmp_sensor_writetemp_0_Q,
      O => interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_4_110
    );
  interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_2_f7 : MUXF7
    port map (
      I0 => interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_4_110,
      I1 => interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_3,
      S => interface_tmp_sensor_cnt_wr(2),
      O => interface_tmp_sensor_cnt_wr_2_writetemp_7_Mux_49_o
    );
  interface_tmp_sensor_state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_FSM_FFd1_In,
      Q => interface_tmp_sensor_state_FSM_FFd1_125
    );
  interface_tmp_sensor_state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_FSM_FFd2_In,
      Q => interface_tmp_sensor_state_FSM_FFd2_126
    );
  interface_tmp_sensor_state_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_FSM_FFd3_In,
      Q => interface_tmp_sensor_state_FSM_FFd3_127
    );
  interface_tmp_sensor_state_FSM_FFd4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_FSM_FFd4_In,
      Q => interface_tmp_sensor_state_FSM_FFd4_128
    );
  interface_tmp_sensor_cnt_wr_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0438_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_wr3,
      Q => interface_tmp_sensor_cnt_wr(3)
    );
  interface_tmp_sensor_cnt_wr_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0438_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_wr2,
      Q => interface_tmp_sensor_cnt_wr(2)
    );
  interface_tmp_sensor_cnt_wr_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0438_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_wr1,
      Q => interface_tmp_sensor_cnt_wr(1)
    );
  interface_tmp_sensor_cnt_wr_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0438_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_wr,
      Q => interface_tmp_sensor_cnt_wr(0)
    );
  interface_tmp_sensor_cnt_add_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv2,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_add3,
      Q => interface_tmp_sensor_cnt_add(3)
    );
  interface_tmp_sensor_cnt_add_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv2,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_add2,
      Q => interface_tmp_sensor_cnt_add(2)
    );
  interface_tmp_sensor_cnt_add_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv2,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_add1,
      Q => interface_tmp_sensor_cnt_add(1)
    );
  interface_tmp_sensor_cnt_add_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv2,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_Mcount_cnt_add,
      Q => interface_tmp_sensor_cnt_add(0)
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_cnt_rd_FSM_FFd2_In,
      Q => interface_tmp_sensor_cnt_rd_FSM_FFd2_143
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_high_cnt_FSM_FFd1_In,
      Q => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_cnt_rd_FSM_FFd1_In,
      Q => interface_tmp_sensor_cnt_rd_FSM_FFd1_217
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In,
      Q => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147
    );
  interface_tmp_sensor_write_flag_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_flag_FSM_FFd1_In,
      Q => interface_tmp_sensor_write_flag_FSM_FFd1_219
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In,
      Q => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In,
      Q => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153
    );
  interface_tmp_sensor_write_flag_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_write_flag_FSM_FFd2_In,
      Q => interface_tmp_sensor_write_flag_FSM_FFd2_218
    );
  interface_tmp_sensor_led1 : FDE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0590_inv,
      D => interface_tmp_sensor_state_3_X_12_o_Mux_136_o,
      Q => interface_tmp_sensor_led1_41
    );
  interface_tmp_sensor_dataout_8 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_8_datatemp_MUX_1124_o,
      Q => interface_tmp_sensor_dataout(8)
    );
  interface_tmp_sensor_dataout_7 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_7_datatemp_MUX_1125_o,
      Q => interface_tmp_sensor_dataout(7)
    );
  interface_tmp_sensor_dataout_6 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_6_datatemp_MUX_1126_o,
      Q => interface_tmp_sensor_dataout(6)
    );
  interface_tmp_sensor_dataout_5 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_5_datatemp_MUX_1127_o,
      Q => interface_tmp_sensor_dataout(5)
    );
  interface_tmp_sensor_dataout_4 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_4_datatemp_MUX_1128_o,
      Q => interface_tmp_sensor_dataout(4)
    );
  interface_tmp_sensor_dataout_3 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_3_datatemp_MUX_1129_o,
      Q => interface_tmp_sensor_dataout(3)
    );
  interface_tmp_sensor_dataout_2 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_2_datatemp_MUX_1130_o,
      Q => interface_tmp_sensor_dataout(2)
    );
  interface_tmp_sensor_dataout_1 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_1_datatemp_MUX_1131_o,
      Q => interface_tmp_sensor_dataout(1)
    );
  interface_tmp_sensor_dataout_0 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0499_inv_157,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_dataout_0_datatemp_MUX_1132_o,
      Q => interface_tmp_sensor_dataout(0)
    );
  interface_tmp_sensor_cnt_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_9_Q,
      Q => interface_tmp_sensor_cnt(9)
    );
  interface_tmp_sensor_cnt_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_8_Q,
      Q => interface_tmp_sensor_cnt(8)
    );
  interface_tmp_sensor_cnt_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_7_Q,
      Q => interface_tmp_sensor_cnt(7)
    );
  interface_tmp_sensor_cnt_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_6_Q,
      Q => interface_tmp_sensor_cnt(6)
    );
  interface_tmp_sensor_cnt_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_5_Q,
      Q => interface_tmp_sensor_cnt(5)
    );
  interface_tmp_sensor_cnt_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_4_Q,
      Q => interface_tmp_sensor_cnt(4)
    );
  interface_tmp_sensor_cnt_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_3_Q,
      Q => interface_tmp_sensor_cnt(3)
    );
  interface_tmp_sensor_cnt_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_2_Q,
      Q => interface_tmp_sensor_cnt(2)
    );
  interface_tmp_sensor_cnt_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_1_Q,
      Q => interface_tmp_sensor_cnt(1)
    );
  interface_tmp_sensor_cnt_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0647_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_0_Q,
      Q => interface_tmp_sensor_cnt(0)
    );
  interface_tmp_sensor_datatemp : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0535_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => N26,
      Q => interface_tmp_sensor_datatemp_201
    );
  interface_tmp_sensor_state_3_clk_1us_DFF_94 : FDE
    port map (
      C => clk,
      CE => interface_tmp_sensor_nrst_state_3_AND_59_o,
      D => interface_tmp_sensor_state_3_PWR_30_o_Mux_176_o,
      Q => interface_tmp_sensor_state_3_clk_1us_DFF_94_200
    );
  interface_tmp_sensor_get_temp_cnt_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0452_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(3),
      Q => interface_tmp_sensor_get_temp_cnt(3)
    );
  interface_tmp_sensor_get_temp_cnt_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0452_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(2),
      Q => interface_tmp_sensor_get_temp_cnt(2)
    );
  interface_tmp_sensor_get_temp_cnt_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0452_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(1),
      Q => interface_tmp_sensor_get_temp_cnt(1)
    );
  interface_tmp_sensor_get_temp_cnt_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0452_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(0),
      Q => interface_tmp_sensor_get_temp_cnt(0)
    );
  interface_tmp_sensor_writetemp_6 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_6_Q,
      Q => interface_tmp_sensor_writetemp_6_Q
    );
  interface_tmp_sensor_writetemp_4 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_4_Q,
      Q => interface_tmp_sensor_writetemp_4_Q
    );
  interface_tmp_sensor_writetemp_3 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_3_Q,
      Q => interface_tmp_sensor_writetemp_3_Q
    );
  interface_tmp_sensor_writetemp_2 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_2_Q,
      Q => interface_tmp_sensor_writetemp_2_Q
    );
  interface_tmp_sensor_writetemp_1 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_1_Q,
      Q => interface_tmp_sensor_writetemp_1_Q
    );
  interface_tmp_sensor_writetemp_0 : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0482_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_0_Q,
      Q => interface_tmp_sensor_writetemp_0_Q
    );
  interface_tmp_sensor_detect_done : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0531_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      Q => interface_tmp_sensor_detect_done_202
    );
  interface_tmp_sensor_search_time : FDCE
    port map (
      C => clk,
      CE => interface_tmp_sensor_n0527_inv,
      CLR => interface_tmp_sensor_nrst_inv,
      D => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      Q => interface_tmp_sensor_search_time_203
    );
  interface_tmp_sensor_dq : FD
    port map (
      C => clk,
      D => interface_tmp_sensor_dq_state_3_MUX_1141_o,
      Q => interface_tmp_sensor_dq_220
    );
  cu_curr_state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_curr_state_FSM_FFd1_In,
      Q => cu_curr_state_FSM_FFd1_274
    );
  cu_curr_state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_curr_state_FSM_FFd2_In,
      Q => cu_curr_state_FSM_FFd2_273
    );
  cu_curr_state_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_curr_state_FSM_FFd3_In,
      Q => cu_curr_state_FSM_FFd3_272
    );
  cu_in_out_val : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => ind_outd_sw_IBUF_2,
      G => cu_curr_state_2_GND_56_o_Mux_26_o,
      Q => cu_in_out_val_5
    );
  cu_edge_detect_1 : FDE
    port map (
      C => clk,
      CE => cu_reset_inv,
      D => cu_edge_detect(0),
      Q => cu_edge_detect(1)
    );
  cu_edge_detect_0 : FDE
    port map (
      C => clk,
      CE => cu_reset_inv,
      D => ind_outd_sw_IBUF_2,
      Q => cu_edge_detect(0)
    );
  cu_watch_dog_cnt_8 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_8_Q,
      Q => cu_watch_dog_cnt(8)
    );
  cu_watch_dog_cnt_7 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_7_Q,
      Q => cu_watch_dog_cnt(7)
    );
  cu_watch_dog_cnt_6 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_6_Q,
      Q => cu_watch_dog_cnt(6)
    );
  cu_watch_dog_cnt_5 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_5_Q,
      Q => cu_watch_dog_cnt(5)
    );
  cu_watch_dog_cnt_4 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_4_Q,
      Q => cu_watch_dog_cnt(4)
    );
  cu_watch_dog_cnt_3 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_3_Q,
      Q => cu_watch_dog_cnt(3)
    );
  cu_watch_dog_cnt_2 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_2_Q,
      Q => cu_watch_dog_cnt(2)
    );
  cu_watch_dog_cnt_1 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_1_Q,
      Q => cu_watch_dog_cnt(1)
    );
  cu_watch_dog_cnt_0 : FDC
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_0_Q,
      Q => cu_watch_dog_cnt(0)
    );
  cu_watch_dog_tc : FDCE
    port map (
      C => clk,
      CE => cu_enable_wd,
      CLR => reset_IBUF_0,
      D => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o,
      Q => cu_watch_dog_tc_275
    );
  interface_lcd_translate_int_counter_select_cnt_2 : FDC
    port map (
      C => clk,
      CLR => interface_lcd_translate_int_reset_i,
      D => interface_lcd_translate_int_counter_select_Mcount_cnt2,
      Q => interface_lcd_translate_int_counter_select_cnt(2)
    );
  interface_lcd_translate_int_counter_select_cnt_1 : FDC
    port map (
      C => clk,
      CLR => interface_lcd_translate_int_reset_i,
      D => interface_lcd_translate_int_counter_select_Mcount_cnt1,
      Q => interface_lcd_translate_int_counter_select_cnt(1)
    );
  interface_lcd_translate_int_counter_select_cnt_0 : FDC
    port map (
      C => clk,
      CLR => interface_lcd_translate_int_reset_i,
      D => interface_lcd_translate_int_counter_select_Mcount_cnt,
      Q => interface_lcd_translate_int_counter_select_cnt(0)
    );
  interface_lcd_interface_Mcount_init_count_xor_1_Q : XORCY
    port map (
      CI => interface_lcd_interface_Mcount_init_count_cy(0),
      LI => interface_lcd_interface_Mcount_init_count_xor_1_rt_658,
      O => interface_lcd_interface_Result(1)
    );
  interface_lcd_interface_Mcount_init_count_xor_0_Q : XORCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      LI => interface_lcd_interface_Mcount_init_count_lut(0),
      O => interface_lcd_interface_Result(0)
    );
  interface_lcd_interface_Mcount_init_count_cy_0_Q : MUXCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      S => interface_lcd_interface_Mcount_init_count_lut(0),
      O => interface_lcd_interface_Mcount_init_count_cy(0)
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_5_Q_333,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_5_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_4_Q_334,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_5_Q_333
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_4_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_3_Q_335,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_4_Q_334
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_3_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_2_Q_336,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_3_Q_335
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_2_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_1_Q_337,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_2_Q_336
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_1_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_0_Q_339,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_1_Q_337
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_0_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_0_Q,
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_0_Q_339
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_3_Q : XORCY
    port map (
      CI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_Q_341,
      LI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_3_rt_659,
      O => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_3_Q
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_2_Q : XORCY
    port map (
      CI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_Q_342,
      LI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_rt_655,
      O => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_2_Q
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_Q_342,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_rt_655,
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_Q_341
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_1_Q : XORCY
    port map (
      CI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_0_Q_343,
      LI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_rt_656,
      O => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_1_Q
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_0_Q_343,
      DI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_rt_656,
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_Q_342
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_0_Q : XORCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      LI => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_lut_0_Q,
      O => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_0_Q
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_0_Q : MUXCY
    port map (
      CI => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      DI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      S => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_lut_0_Q,
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_0_Q_343
    );
  interface_lcd_interface_init_count_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0400_inv,
      D => interface_lcd_interface_Result(1),
      Q => interface_lcd_interface_init_count(1)
    );
  interface_lcd_interface_init_count_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0400_inv,
      D => interface_lcd_interface_Result(0),
      Q => interface_lcd_interface_init_count(0)
    );
  interface_lcd_interface_state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_interface_state_FSM_FFd1_In,
      Q => interface_lcd_interface_state_FSM_FFd1_345
    );
  interface_lcd_interface_state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_interface_state_FSM_FFd2_In_350,
      Q => interface_lcd_interface_state_FSM_FFd2_346
    );
  interface_lcd_interface_state_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_interface_state_FSM_FFd3_In,
      Q => interface_lcd_interface_state_FSM_FFd3_347
    );
  interface_lcd_interface_state_FSM_FFd4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_top,
      D => interface_lcd_interface_state_FSM_FFd4_In,
      Q => interface_lcd_interface_state_FSM_FFd4_348
    );
  interface_lcd_interface_RS : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_Mux_96_o,
      Q => interface_lcd_interface_RS_19
    );
  interface_lcd_interface_done : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_Mux_98_o,
      Q => interface_lcd_interface_done_18
    );
  interface_lcd_interface_writing_counter_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0419_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_3_Q,
      Q => interface_lcd_interface_writing_counter(3)
    );
  interface_lcd_interface_writing_counter_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0419_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_2_Q,
      Q => interface_lcd_interface_writing_counter(2)
    );
  interface_lcd_interface_writing_counter_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0419_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_1_Q,
      Q => interface_lcd_interface_writing_counter(1)
    );
  interface_lcd_interface_writing_counter_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => interface_lcd_interface_n0419_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_0_Q,
      Q => interface_lcd_interface_writing_counter(0)
    );
  interface_lcd_interface_enable_translator : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_n0441_inv,
      D => interface_lcd_interface_state_3_X_5_o_Mux_102_o,
      Q => interface_lcd_interface_enable_translator_48
    );
  interface_lcd_interface_dataOUT_7 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_7_Q,
      Q => interface_lcd_interface_dataOUT(7)
    );
  interface_lcd_interface_dataOUT_6 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_6_Q,
      Q => interface_lcd_interface_dataOUT(6)
    );
  interface_lcd_interface_dataOUT_5 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_5_Q,
      Q => interface_lcd_interface_dataOUT(5)
    );
  interface_lcd_interface_dataOUT_4 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_4_Q,
      Q => interface_lcd_interface_dataOUT(4)
    );
  interface_lcd_interface_dataOUT_3 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_3_Q,
      Q => interface_lcd_interface_dataOUT(3)
    );
  interface_lcd_interface_dataOUT_2 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_2_Q,
      Q => interface_lcd_interface_dataOUT(2)
    );
  interface_lcd_interface_dataOUT_1 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_1_Q,
      Q => interface_lcd_interface_dataOUT(1)
    );
  interface_lcd_interface_dataOUT_0 : FDE
    port map (
      C => clk,
      CE => interface_lcd_interface_reset_inv,
      D => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_0_Q,
      Q => interface_lcd_interface_dataOUT(0)
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_3_Q : MUXCY
    port map (
      CI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_2_Q_395,
      DI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi3_394,
      S => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_3_Q_393,
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_3_Q_392
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_3_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => comparison_block_b_io(6),
      I1 => comparison_block_curr_tmp_reg_data(6),
      I2 => comparison_block_b_io(7),
      I3 => comparison_block_curr_tmp_reg_data(7),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_3_Q_393
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi3 : LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(7),
      I1 => comparison_block_curr_tmp_reg_data(6),
      I2 => comparison_block_b_io(6),
      I3 => comparison_block_b_io(7),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi3_394
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_2_Q : MUXCY
    port map (
      CI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_1_Q_398,
      DI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi2_397,
      S => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_2_Q_396,
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_2_Q_395
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_2_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => comparison_block_b_io(4),
      I1 => comparison_block_curr_tmp_reg_data(4),
      I2 => comparison_block_b_io(5),
      I3 => comparison_block_curr_tmp_reg_data(5),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_2_Q_396
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi2 : LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(5),
      I1 => comparison_block_curr_tmp_reg_data(4),
      I2 => comparison_block_b_io(4),
      I3 => comparison_block_b_io(5),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi2_397
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_1_Q : MUXCY
    port map (
      CI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_0_Q_401,
      DI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi1_400,
      S => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_1_Q_399,
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_1_Q_398
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_1_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => comparison_block_b_io(2),
      I1 => comparison_block_curr_tmp_reg_data(2),
      I2 => comparison_block_b_io(3),
      I3 => comparison_block_curr_tmp_reg_data(3),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_1_Q_399
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi1 : LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(3),
      I1 => comparison_block_curr_tmp_reg_data(2),
      I2 => comparison_block_b_io(2),
      I3 => comparison_block_b_io(3),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi1_400
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_0_Q : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      DI => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi_403,
      S => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_0_Q_402,
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_0_Q_401
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_0_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => comparison_block_b_io(0),
      I1 => comparison_block_curr_tmp_reg_data(0),
      I2 => comparison_block_b_io(1),
      I3 => comparison_block_curr_tmp_reg_data(1),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lut_0_Q_402
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi : LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(1),
      I1 => comparison_block_curr_tmp_reg_data(0),
      I2 => comparison_block_b_io(0),
      I3 => comparison_block_b_io(1),
      O => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_lutdi_403
    );
  comparison_block_comp_res : LD
    port map (
      D => comparison_block_comp_a_8_b_8_LessThan_1_o,
      G => start_comparison,
      Q => comparison_block_comp_res_452
    );
  comparison_block_state_count_cnt : FDC
    port map (
      C => clk,
      CLR => reset_top,
      D => comparison_block_state_count_cnt_cnt_MUX_1146_o,
      Q => comparison_block_state_count_cnt_491
    );
  comparison_block_state_count_tc : FDC
    port map (
      C => clk,
      CLR => reset_top,
      D => comparison_block_state_count_tc_cnt_MUX_1144_o,
      Q => comparison_block_state_count_tc_30
    );
  comparison_block_min_tmp_reg_out_data_8 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(8),
      Q => comparison_block_min_tmp_reg_out_data(8)
    );
  comparison_block_min_tmp_reg_out_data_7 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(7),
      Q => comparison_block_min_tmp_reg_out_data(7)
    );
  comparison_block_min_tmp_reg_out_data_6 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(6),
      Q => comparison_block_min_tmp_reg_out_data(6)
    );
  comparison_block_min_tmp_reg_out_data_5 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(5),
      Q => comparison_block_min_tmp_reg_out_data(5)
    );
  comparison_block_min_tmp_reg_out_data_4 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(4),
      Q => comparison_block_min_tmp_reg_out_data(4)
    );
  comparison_block_min_tmp_reg_out_data_3 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(3),
      Q => comparison_block_min_tmp_reg_out_data(3)
    );
  comparison_block_min_tmp_reg_out_data_2 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(2),
      Q => comparison_block_min_tmp_reg_out_data(2)
    );
  comparison_block_min_tmp_reg_out_data_1 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(1),
      Q => comparison_block_min_tmp_reg_out_data(1)
    );
  comparison_block_min_tmp_reg_out_data_0 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_min_outd(0),
      Q => comparison_block_min_tmp_reg_out_data(0)
    );
  comparison_block_max_tmp_reg_out_data_8 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(8),
      Q => comparison_block_max_tmp_reg_out_data(8)
    );
  comparison_block_max_tmp_reg_out_data_7 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(7),
      Q => comparison_block_max_tmp_reg_out_data(7)
    );
  comparison_block_max_tmp_reg_out_data_6 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(6),
      Q => comparison_block_max_tmp_reg_out_data(6)
    );
  comparison_block_max_tmp_reg_out_data_5 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(5),
      Q => comparison_block_max_tmp_reg_out_data(5)
    );
  comparison_block_max_tmp_reg_out_data_4 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(4),
      Q => comparison_block_max_tmp_reg_out_data(4)
    );
  comparison_block_max_tmp_reg_out_data_3 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(3),
      Q => comparison_block_max_tmp_reg_out_data(3)
    );
  comparison_block_max_tmp_reg_out_data_2 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(2),
      Q => comparison_block_max_tmp_reg_out_data(2)
    );
  comparison_block_max_tmp_reg_out_data_1 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(1),
      Q => comparison_block_max_tmp_reg_out_data(1)
    );
  comparison_block_max_tmp_reg_out_data_0 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg_out,
      CLR => reset_top,
      D => comparison_block_data_in_max_outd(0),
      Q => comparison_block_max_tmp_reg_out_data(0)
    );
  comparison_block_min_tmp_reg_ind_data_8 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(8),
      Q => comparison_block_min_tmp_reg_ind_data(8)
    );
  comparison_block_min_tmp_reg_ind_data_7 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(7),
      Q => comparison_block_min_tmp_reg_ind_data(7)
    );
  comparison_block_min_tmp_reg_ind_data_6 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(6),
      Q => comparison_block_min_tmp_reg_ind_data(6)
    );
  comparison_block_min_tmp_reg_ind_data_5 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(5),
      Q => comparison_block_min_tmp_reg_ind_data(5)
    );
  comparison_block_min_tmp_reg_ind_data_4 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(4),
      Q => comparison_block_min_tmp_reg_ind_data(4)
    );
  comparison_block_min_tmp_reg_ind_data_3 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(3),
      Q => comparison_block_min_tmp_reg_ind_data(3)
    );
  comparison_block_min_tmp_reg_ind_data_2 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(2),
      Q => comparison_block_min_tmp_reg_ind_data(2)
    );
  comparison_block_min_tmp_reg_ind_data_1 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(1),
      Q => comparison_block_min_tmp_reg_ind_data(1)
    );
  comparison_block_min_tmp_reg_ind_data_0 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_min_ind(0),
      Q => comparison_block_min_tmp_reg_ind_data(0)
    );
  comparison_block_max_tmp_reg_ind_data_8 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(8),
      Q => comparison_block_max_tmp_reg_ind_data(8)
    );
  comparison_block_max_tmp_reg_ind_data_7 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(7),
      Q => comparison_block_max_tmp_reg_ind_data(7)
    );
  comparison_block_max_tmp_reg_ind_data_6 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(6),
      Q => comparison_block_max_tmp_reg_ind_data(6)
    );
  comparison_block_max_tmp_reg_ind_data_5 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(5),
      Q => comparison_block_max_tmp_reg_ind_data(5)
    );
  comparison_block_max_tmp_reg_ind_data_4 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(4),
      Q => comparison_block_max_tmp_reg_ind_data(4)
    );
  comparison_block_max_tmp_reg_ind_data_3 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(3),
      Q => comparison_block_max_tmp_reg_ind_data(3)
    );
  comparison_block_max_tmp_reg_ind_data_2 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(2),
      Q => comparison_block_max_tmp_reg_ind_data(2)
    );
  comparison_block_max_tmp_reg_ind_data_1 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(1),
      Q => comparison_block_max_tmp_reg_ind_data(1)
    );
  comparison_block_max_tmp_reg_ind_data_0 : FDCE
    port map (
      C => clk,
      CE => comparison_block_enable_reg,
      CLR => reset_top,
      D => comparison_block_data_in_max_ind(0),
      Q => comparison_block_max_tmp_reg_ind_data(0)
    );
  comparison_block_curr_tmp_reg_data_8 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(8),
      Q => comparison_block_curr_tmp_reg_data(8)
    );
  comparison_block_curr_tmp_reg_data_7 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(7),
      Q => comparison_block_curr_tmp_reg_data(7)
    );
  comparison_block_curr_tmp_reg_data_6 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(6),
      Q => comparison_block_curr_tmp_reg_data(6)
    );
  comparison_block_curr_tmp_reg_data_5 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(5),
      Q => comparison_block_curr_tmp_reg_data(5)
    );
  comparison_block_curr_tmp_reg_data_4 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(4),
      Q => comparison_block_curr_tmp_reg_data(4)
    );
  comparison_block_curr_tmp_reg_data_3 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(3),
      Q => comparison_block_curr_tmp_reg_data(3)
    );
  comparison_block_curr_tmp_reg_data_2 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(2),
      Q => comparison_block_curr_tmp_reg_data(2)
    );
  comparison_block_curr_tmp_reg_data_1 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(1),
      Q => comparison_block_curr_tmp_reg_data(1)
    );
  comparison_block_curr_tmp_reg_data_0 : FDCE
    port map (
      C => clk,
      CE => start_comparison,
      CLR => reset_top,
      D => interface_tmp_sensor_dataout(0),
      Q => comparison_block_curr_tmp_reg_data(0)
    );
  interface_tmp_sensor_Mcount_cnt_wr_xor_0_11 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_cnt_wr(0),
      O => interface_tmp_sensor_Mcount_cnt_wr
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT31 : LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_cnt_add(3),
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_2_Q
    );
  interface_tmp_sensor_Mcount_cnt_wr_cy_2_11 : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_cnt_wr(2),
      I2 => interface_tmp_sensor_cnt_wr(1),
      I3 => interface_tmp_sensor_cnt_wr(0),
      O => interface_tmp_sensor_Mcount_cnt_wr3
    );
  interface_tmp_sensor_Mcount_cnt_wr_xor_2_11 : LUT4
    generic map(
      INIT => X"1444"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_cnt_wr(2),
      I2 => interface_tmp_sensor_cnt_wr(0),
      I3 => interface_tmp_sensor_cnt_wr(1),
      O => interface_tmp_sensor_Mcount_cnt_wr2
    );
  interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT31 : LUT4
    generic map(
      INIT => X"1444"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(3),
      I1 => interface_tmp_sensor_get_temp_cnt(2),
      I2 => interface_tmp_sensor_get_temp_cnt(0),
      I3 => interface_tmp_sensor_get_temp_cnt(1),
      O => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(2)
    );
  interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT21 : LUT4
    generic map(
      INIT => X"0266"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(0),
      I1 => interface_tmp_sensor_get_temp_cnt(1),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(3),
      O => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(1)
    );
  interface_tmp_sensor_Mcount_cnt_wr_xor_1_11 : LUT3
    generic map(
      INIT => X"14"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_cnt_wr(0),
      I2 => interface_tmp_sensor_cnt_wr(1),
      O => interface_tmp_sensor_Mcount_cnt_wr1
    );
  interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT41 : LUT4
    generic map(
      INIT => X"2404"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(1),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(0),
      O => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(3)
    );
  interface_tmp_sensor_n0438_inv1 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_n0438_inv
    );
  interface_tmp_sensor_Mmux_dataout_0_datatemp_MUX_1132_o11 : LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(0),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(1),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_0_datatemp_MUX_1132_o
    );
  interface_tmp_sensor_Mmux_dataout_2_datatemp_MUX_1130_o11 : LUT6
    generic map(
      INIT => X"ABAAAAAAA8AAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(2),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(1),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_2_datatemp_MUX_1130_o
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT11 : LUT5
    generic map(
      INIT => X"89990111"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_cnt_add(3),
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_0_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT51 : LUT4
    generic map(
      INIT => X"FF15"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_cnt_add(3),
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_4_Q
    );
  interface_tmp_sensor_Mmux_dataout_3_datatemp_MUX_1129_o11 : LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(3),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      I3 => interface_tmp_sensor_get_temp_cnt(0),
      I4 => interface_tmp_sensor_get_temp_cnt(2),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_3_datatemp_MUX_1129_o
    );
  interface_tmp_sensor_Mmux_dataout_4_datatemp_MUX_1128_o11 : LUT6
    generic map(
      INIT => X"ABAAAAAAA8AAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(4),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      I3 => interface_tmp_sensor_get_temp_cnt(2),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_4_datatemp_MUX_1128_o
    );
  interface_tmp_sensor_Mmux_dataout_5_datatemp_MUX_1127_o11 : LUT6
    generic map(
      INIT => X"ABAAAAAAA8AAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(5),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(0),
      I3 => interface_tmp_sensor_get_temp_cnt(2),
      I4 => interface_tmp_sensor_get_temp_cnt(1),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_5_datatemp_MUX_1127_o
    );
  interface_tmp_sensor_Mmux_dataout_6_datatemp_MUX_1126_o11 : LUT6
    generic map(
      INIT => X"BAAAAAAA8AAAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(6),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(1),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_6_datatemp_MUX_1126_o
    );
  interface_tmp_sensor_Mmux_dataout_7_datatemp_MUX_1125_o11 : LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(7),
      I1 => interface_tmp_sensor_get_temp_cnt(0),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      I3 => interface_tmp_sensor_get_temp_cnt(2),
      I4 => interface_tmp_sensor_get_temp_cnt(3),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_7_datatemp_MUX_1125_o
    );
  interface_tmp_sensor_Mmux_dataout_8_datatemp_MUX_1124_o11 : LUT6
    generic map(
      INIT => X"ABAAAAAAA8AAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(8),
      I1 => interface_tmp_sensor_get_temp_cnt(2),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      I3 => interface_tmp_sensor_get_temp_cnt(3),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_8_datatemp_MUX_1124_o
    );
  interface_tmp_sensor_Mcount_cnt_add_xor_3_11 : LUT5
    generic map(
      INIT => X"28888888"
    )
    port map (
      I0 => interface_tmp_sensor_state_0_inv_inv,
      I1 => interface_tmp_sensor_cnt_add(3),
      I2 => interface_tmp_sensor_cnt_add(0),
      I3 => interface_tmp_sensor_cnt_add(1),
      I4 => interface_tmp_sensor_cnt_add(2),
      O => interface_tmp_sensor_Mcount_cnt_add3
    );
  interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT111 : LUT3
    generic map(
      INIT => X"1F"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(2),
      I1 => interface_tmp_sensor_get_temp_cnt(1),
      I2 => interface_tmp_sensor_get_temp_cnt(3),
      O => interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT11
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT161211 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I1 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16121
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT42 : LUT6
    generic map(
      INIT => X"10001010FFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_cnt_add(3),
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT421,
      I4 => cu_in_out_val_5,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_3_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT4211 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_add(0),
      I1 => interface_tmp_sensor_cnt_add(1),
      I2 => interface_tmp_sensor_cnt_add(2),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT421
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd1_In21 : LUT5
    generic map(
      INIT => X"01000000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(2),
      I1 => interface_tmp_sensor_cnt(6),
      I2 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I4 => interface_tmp_sensor_cnt(5),
      O => interface_tmp_sensor_write_high_cnt_FSM_FFd1_In2
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT281111 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT151211 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I1 => interface_tmp_sensor_cnt(2),
      I2 => interface_tmp_sensor_cnt(6),
      I3 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15121
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT8121 : LUT5
    generic map(
      INIT => X"FFEFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(5),
      I1 => interface_tmp_sensor_state_0_inv_inv,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15121,
      I3 => interface_tmp_sensor_cnt(4),
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT812
    );
  interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o_9_1 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_cnt(2),
      I2 => interface_tmp_sensor_cnt(6),
      I3 => interface_tmp_sensor_cnt(1),
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114,
      O => interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1161 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_cnt(3),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116
    );
  interface_tmp_sensor_state_FSM_FFd3_In111 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(2),
      I1 => interface_tmp_sensor_get_temp_cnt(0),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      O => interface_tmp_sensor_state_FSM_FFd3_In11
    );
  interface_tmp_sensor_state_FSM_FFd4_In6211 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(6),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_cnt(4),
      I3 => interface_tmp_sensor_cnt(7),
      O => interface_tmp_sensor_state_FSM_FFd4_In621
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT321 : LUT6
    generic map(
      INIT => X"00C6C6C6C6C6C6C6"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(6),
      I1 => interface_tmp_sensor_cnt(7),
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT291,
      I5 => interface_tmp_sensor_state_FSM_FFd2_In4_248,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_7_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2911 : LUT3
    generic map(
      INIT => X"4F"
    )
    port map (
      I0 => interface_tmp_sensor_detect_done_202,
      I1 => interface_tmp_sensor_state_FSM_FFd2_In2_240,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT291
    );
  interface_tmp_sensor_state_FSM_FFd2_In41 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_cnt(9),
      O => interface_tmp_sensor_state_FSM_FFd2_In4_248
    );
  interface_tmp_sensor_nrst_state_3_AND_59_o1211 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(8),
      I1 => interface_tmp_sensor_cnt(6),
      I2 => interface_tmp_sensor_cnt(7),
      O => interface_tmp_sensor_nrst_state_3_AND_59_o121
    );
  interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o_9_1 : LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_cnt(1),
      I2 => interface_tmp_sensor_cnt(2),
      I3 => interface_tmp_sensor_cnt(9),
      I4 => interface_tmp_sensor_nrst_state_3_AND_59_o121,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116,
      O => interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o
    );
  interface_tmp_sensor_state_FSM_FFd4_In211 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(5),
      O => interface_tmp_sensor_state_FSM_FFd4_In21
    );
  interface_tmp_sensor_state_FSM_FFd4_In31 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_FSM_FFd4_In3
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd1_In1 : LUT5
    generic map(
      INIT => X"F8FAA8AA"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I1 => interface_tmp_sensor_cnt_rd_FSM_FFd1_In11,
      I2 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I3 => interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_In2,
      O => interface_tmp_sensor_cnt_rd_FSM_FFd1_In
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd1_In21 : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_cnt_rd_FSM_FFd1_In2
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd2_In1 : LUT5
    generic map(
      INIT => X"8FAF8AAA"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I1 => interface_tmp_sensor_cnt_rd_FSM_FFd1_In11,
      I2 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I3 => interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_In2,
      O => interface_tmp_sensor_cnt_rd_FSM_FFd2_In
    );
  interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o_9_1 : LUT6
    generic map(
      INIT => X"0100000000000000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_cnt(2),
      I2 => interface_tmp_sensor_cnt(6),
      I3 => interface_tmp_sensor_cnt(1),
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114,
      O => interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1141 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(9),
      I1 => interface_tmp_sensor_cnt(7),
      I2 => interface_tmp_sensor_cnt(8),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16111 : LUT6
    generic map(
      INIT => X"04545555FCFCFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_cnt(4),
      I2 => interface_tmp_sensor_cnt(5),
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511_237,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114,
      I5 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1611
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT20211 : LUT6
    generic map(
      INIT => X"A2AA2222A2AAA2AA"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249,
      I1 => interface_tmp_sensor_state_FSM_FFd2_In4_248,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT3711,
      I4 => interface_tmp_sensor_detect_done_202,
      I5 => interface_tmp_sensor_state_FSM_FFd2_In2_240,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15211 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(2),
      I1 => interface_tmp_sensor_cnt(0),
      I2 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1521
    );
  interface_tmp_sensor_state_FSM_FFd3_In21 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_state_FSM_FFd3_In2
    );
  interface_tmp_sensor_n0527_inv2 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => interface_tmp_sensor_search_time_203,
      I1 => interface_tmp_sensor_n0527_inv1_260,
      O => interface_tmp_sensor_n0527_inv
    );
  interface_tmp_sensor_write_flag_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      I1 => interface_tmp_sensor_write_flag_FSM_FFd1_In2,
      I2 => interface_tmp_sensor_n0527_inv1_260,
      O => interface_tmp_sensor_write_flag_FSM_FFd1_In
    );
  interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o_3_1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_cnt_wr(2),
      I2 => interface_tmp_sensor_cnt_wr(1),
      I3 => interface_tmp_sensor_cnt_wr(0),
      O => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o
    );
  cu_curr_state_2_GND_56_o_Mux_26_o1 : LUT6
    generic map(
      INIT => X"0200020202020200"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd2_273,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => cu_watch_dog_tc_275,
      I4 => cu_edge_detect(0),
      I5 => cu_edge_detect(1),
      O => cu_curr_state_2_GND_56_o_Mux_26_o
    );
  cu_curr_state_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"55DDD94077FFD940"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => comparison_block_state_count_tc_30,
      I3 => interface_lcd_interface_done_18,
      I4 => cu_curr_state_FSM_FFd2_273,
      I5 => interface_tmp_sensor_led1_41,
      O => cu_curr_state_FSM_FFd2_In
    );
  cu_curr_state_n0066_6_1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      O => start_display
    );
  cu_curr_state_FSM_FFd1_In1 : LUT5
    generic map(
      INIT => X"CAEA8AAA"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => interface_lcd_interface_done_18,
      I4 => interface_tmp_sensor_led1_41,
      O => cu_curr_state_FSM_FFd1_In
    );
  cu_curr_state_enable_wd1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd1_274,
      O => cu_enable_wd
    );
  cu_curr_state_ready1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd2_273,
      O => system_ready_OBUF_8
    );
  cu_curr_state_n0066_3_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      O => start_comparison
    );
  cu_curr_state_n0066_0_1 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd1_274,
      O => init_set_up
    );
  cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_11 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => cu_watch_dog_cnt(5),
      I1 => cu_watch_dog_cnt(4),
      I2 => cu_watch_dog_cnt(3),
      I3 => cu_watch_dog_cnt(0),
      I4 => cu_watch_dog_cnt(1),
      I5 => cu_watch_dog_cnt(2),
      O => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_Q
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT41 : LUT6
    generic map(
      INIT => X"0220202020202020"
    )
    port map (
      I0 => cu_enable_wd,
      I1 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o,
      I2 => cu_watch_dog_cnt(3),
      I3 => cu_watch_dog_cnt(0),
      I4 => cu_watch_dog_cnt(1),
      I5 => cu_watch_dog_cnt(2),
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_3_Q
    );
  interface_lcd_translate_int_data_out_0_231 : LUT4
    generic map(
      INIT => X"9A18"
    )
    port map (
      I0 => data_from_comparison(4),
      I1 => data_from_comparison(3),
      I2 => data_from_comparison(5),
      I3 => data_from_comparison(2),
      O => interface_lcd_translate_int_data_out_0_bdd46
    );
  interface_lcd_translate_int_counter_select_Mcount_cnt_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(1),
      I1 => interface_lcd_translate_int_counter_select_cnt(0),
      O => interface_lcd_translate_int_counter_select_Mcount_cnt1
    );
  interface_lcd_translate_int_counter_select_Mcount_cnt_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(2),
      I1 => interface_lcd_translate_int_counter_select_cnt(0),
      I2 => interface_lcd_translate_int_counter_select_cnt(1),
      O => interface_lcd_translate_int_counter_select_Mcount_cnt2
    );
  interface_lcd_translate_int_mux_Mmux_y71 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(1),
      I1 => interface_lcd_translate_int_counter_select_cnt(0),
      I2 => interface_lcd_translate_int_counter_select_cnt(2),
      O => interface_lcd_data_in_inter_4_Q
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2631 : LUT4
    generic map(
      INIT => X"0222"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2
    );
  interface_lcd_interface_n0441_inv1 : LUT5
    generic map(
      INIT => X"10040004"
    )
    port map (
      I0 => reset_top,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_n0441_inv
    );
  interface_lcd_interface_state_FSM_FFd1_In2 : LUT6
    generic map(
      INIT => X"4222420202220202"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_state_FSM_FFd1_In1,
      I5 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      O => interface_lcd_interface_state_FSM_FFd1_In
    );
  interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o_31_1 : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o
    );
  interface_lcd_interface_n0400_inv1 : LUT6
    generic map(
      INIT => X"1010100010001001"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      I1 => reset_top,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd3_347,
      I5 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_n0400_inv
    );
  interface_lcd_interface_GND_5_o_GND_5_o_select_28_OUT_5_1 : LUT6
    generic map(
      INIT => X"0040AFEAAFEAAFEA"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_translate_int_counter_select_cnt(1),
      I5 => interface_lcd_translate_int_counter_select_cnt(2),
      O => interface_lcd_interface_GND_5_o_GND_5_o_select_28_OUT(5)
    );
  interface_lcd_interface_state_FSM_FFd3_In1 : LUT6
    generic map(
      INIT => X"12325A1A02226A2A"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd4_348,
      I3 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I4 => interface_lcd_interface_state_FSM_FFd2_346,
      I5 => init_set_up,
      O => interface_lcd_interface_state_FSM_FFd3_In
    );
  interface_lcd_interface_state_FSM_FFd1_In11 : LUT5
    generic map(
      INIT => X"01115555"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_state_FSM_FFd1_In1
    );
  interface_lcd_interface_state_3_1421 : LUT4
    generic map(
      INIT => X"A8FF"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd3_347,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_state_3_142
    );
  interface_lcd_interface_state_3_711 : LUT5
    generic map(
      INIT => X"FFFF8880"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(1),
      I1 => interface_lcd_interface_writing_counter(2),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_state_3_71
    );
  interface_lcd_interface_state_FSM_FFd4_In111 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      O => interface_lcd_interface_state_FSM_FFd4_In11
    );
  interface_lcd_interface_state_3_91 : LUT3
    generic map(
      INIT => X"1F"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      O => interface_lcd_interface_state_3_9
    );
  interface_lcd_interface_state_3_81 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(1),
      O => interface_lcd_interface_state_3_8
    );
  interface_lcd_interface_state_state_2_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      O => interface_lcd_interface_state(2)
    );
  comparison_block_mux_1_Mmux_y21 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(1),
      I3 => comparison_block_min_tmp_reg_ind_data(1),
      I4 => comparison_block_max_tmp_reg_ind_data(1),
      I5 => comparison_block_max_tmp_reg_out_data(1),
      O => comparison_block_b_io(1)
    );
  comparison_block_mux_1_Mmux_y91 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(8),
      I3 => comparison_block_min_tmp_reg_ind_data(8),
      I4 => comparison_block_max_tmp_reg_ind_data(8),
      I5 => comparison_block_max_tmp_reg_out_data(8),
      O => comparison_block_b_io(8)
    );
  comparison_block_mux_1_Mmux_y81 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(7),
      I3 => comparison_block_min_tmp_reg_ind_data(7),
      I4 => comparison_block_max_tmp_reg_ind_data(7),
      I5 => comparison_block_max_tmp_reg_out_data(7),
      O => comparison_block_b_io(7)
    );
  comparison_block_mux_1_Mmux_y71 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(6),
      I3 => comparison_block_min_tmp_reg_ind_data(6),
      I4 => comparison_block_max_tmp_reg_ind_data(6),
      I5 => comparison_block_max_tmp_reg_out_data(6),
      O => comparison_block_b_io(6)
    );
  comparison_block_mux_1_Mmux_y11 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(0),
      I3 => comparison_block_min_tmp_reg_ind_data(0),
      I4 => comparison_block_max_tmp_reg_ind_data(0),
      I5 => comparison_block_max_tmp_reg_out_data(0),
      O => comparison_block_b_io(0)
    );
  comparison_block_mux_1_Mmux_y61 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(5),
      I3 => comparison_block_min_tmp_reg_ind_data(5),
      I4 => comparison_block_max_tmp_reg_ind_data(5),
      I5 => comparison_block_max_tmp_reg_out_data(5),
      O => comparison_block_b_io(5)
    );
  comparison_block_mux_1_Mmux_y51 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(4),
      I3 => comparison_block_min_tmp_reg_ind_data(4),
      I4 => comparison_block_max_tmp_reg_ind_data(4),
      I5 => comparison_block_max_tmp_reg_out_data(4),
      O => comparison_block_b_io(4)
    );
  comparison_block_mux_1_Mmux_y41 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(3),
      I3 => comparison_block_min_tmp_reg_ind_data(3),
      I4 => comparison_block_max_tmp_reg_ind_data(3),
      I5 => comparison_block_max_tmp_reg_out_data(3),
      O => comparison_block_b_io(3)
    );
  comparison_block_mux_1_Mmux_y31 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => comparison_block_state_count_cnt_491,
      I1 => cu_in_out_val_5,
      I2 => comparison_block_min_tmp_reg_out_data(2),
      I3 => comparison_block_min_tmp_reg_ind_data(2),
      I4 => comparison_block_max_tmp_reg_ind_data(2),
      I5 => comparison_block_max_tmp_reg_out_data(2),
      O => comparison_block_b_io(2)
    );
  interface_lcd_clk_enable_unit_n0012_13_1 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(9),
      I1 => interface_lcd_clk_enable_unit_count(7),
      I2 => interface_lcd_clk_enable_unit_count(13),
      I3 => interface_lcd_clk_enable_unit_count(12),
      I4 => interface_lcd_clk_enable_unit_count(11),
      O => interface_lcd_clk_enable_unit_n0012_0(13)
    );
  interface_lcd_clk_enable_unit_n0012_13_2 : LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(3),
      I1 => interface_lcd_clk_enable_unit_count(5),
      I2 => interface_lcd_clk_enable_unit_count(1),
      I3 => interface_lcd_clk_enable_unit_count(6),
      I4 => interface_lcd_clk_enable_unit_count(8),
      I5 => interface_lcd_clk_enable_unit_count(0),
      O => interface_lcd_clk_enable_unit_n0012_13_1_502
    );
  interface_lcd_clk_enable_unit_n0012_13_3 : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I1 => interface_lcd_clk_enable_unit_count(2),
      I2 => interface_lcd_clk_enable_unit_n0012_0(13),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_n0012
    );
  interface_tmp_sensor_state_FSM_FFd3_In43_SW0 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(3),
      O => N2
    );
  interface_tmp_sensor_state_FSM_FFd3_In43 : LUT6
    generic map(
      INIT => X"FFFFFFFF55551555"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(8),
      I1 => interface_tmp_sensor_cnt(6),
      I2 => interface_tmp_sensor_cnt(7),
      I3 => interface_tmp_sensor_cnt(5),
      I4 => N2,
      I5 => interface_tmp_sensor_detect_done_202,
      O => interface_tmp_sensor_state_FSM_FFd3_In43_228
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In1_504
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd1_In2 : LUT6
    generic map(
      INIT => X"0000000040000000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In1_504,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15121,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      I5 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In2_505
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd1_In3 : LUT6
    generic map(
      INIT => X"FFFFFFFF22202222"
    )
    port map (
      I0 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I1 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      I5 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In2_505,
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd1_In
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT81 : LUT4
    generic map(
      INIT => X"1FBF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I1 => interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o,
      I2 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I3 => interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT8
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT82 : LUT6
    generic map(
      INIT => X"FFFFFFFF08A80800"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT812,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT8,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT81_507
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT83 : LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT81_507,
      I1 => interface_tmp_sensor_cnt(0),
      I2 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_1_Q
    );
  interface_tmp_sensor_nrst_state_3_AND_59_o1 : LUT6
    generic map(
      INIT => X"B8B80080B8B820A0"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I4 => interface_tmp_sensor_state_FSM_FFd3_127,
      I5 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      O => interface_tmp_sensor_nrst_state_3_AND_59_o1_508
    );
  interface_tmp_sensor_nrst_state_3_AND_59_o3 : LUT6
    generic map(
      INIT => X"A333A303A033A003"
    )
    port map (
      I0 => interface_tmp_sensor_detect_done_202,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_nrst_state_3_AND_59_o2_509,
      I5 => interface_tmp_sensor_state_FSM_FFd3_In3_257,
      O => interface_tmp_sensor_nrst_state_3_AND_59_o3_510
    );
  interface_tmp_sensor_state_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_cnt_wr(3),
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_FSM_FFd1_In1_512
    );
  interface_tmp_sensor_state_FSM_FFd1_In4 : LUT6
    generic map(
      INIT => X"FFFF8A2202228A22"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_cnt_add(3),
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      I5 => interface_tmp_sensor_state_FSM_FFd1_In3_513,
      O => interface_tmp_sensor_state_FSM_FFd1_In
    );
  interface_tmp_sensor_write_flag_FSM_FFd2_In_SW0 : LUT5
    generic map(
      INIT => X"FFF7FFFF"
    )
    port map (
      I0 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_write_flag_FSM_FFd1_In2
    );
  interface_tmp_sensor_state_FSM_FFd2_In3 : LUT6
    generic map(
      INIT => X"2820282808000808"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I4 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I5 => interface_tmp_sensor_cnt_add(3),
      O => interface_tmp_sensor_state_FSM_FFd2_In5_515
    );
  interface_tmp_sensor_state_FSM_FFd2_In4 : LUT6
    generic map(
      INIT => X"2202AAAAFFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      I1 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      I2 => interface_tmp_sensor_search_time_203,
      I3 => interface_tmp_sensor_write_flag_FSM_FFd2_In111,
      I4 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I5 => interface_tmp_sensor_cnt_wr(3),
      O => interface_tmp_sensor_state_FSM_FFd2_In6_516
    );
  interface_tmp_sensor_state_FSM_FFd2_In5 : LUT6
    generic map(
      INIT => X"8888088880800080"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I4 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I5 => interface_tmp_sensor_state_FSM_FFd2_In6_516,
      O => interface_tmp_sensor_state_FSM_FFd2_In7
    );
  interface_tmp_sensor_state_FSM_FFd2_In6 : LUT4
    generic map(
      INIT => X"FF54"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd2_In7,
      I2 => interface_tmp_sensor_state_FSM_FFd2_In5_515,
      I3 => interface_tmp_sensor_state_FSM_FFd2_In3_514,
      O => interface_tmp_sensor_state_FSM_FFd2_In
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT41 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I1 => interface_tmp_sensor_GND_35_o_cnt_9_equal_120_o,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT4
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT42 : LUT6
    generic map(
      INIT => X"0FBF03B300B003B3"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12221,
      I1 => interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT4,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT41_519
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT43 : LUT4
    generic map(
      INIT => X"5540"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT41_519,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_0_Q
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In3 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2_520,
      O => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11_SW0 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(0),
      I1 => interface_tmp_sensor_cnt(9),
      O => N6
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBF"
    )
    port map (
      I0 => interface_tmp_sensor_nrst_state_3_AND_59_o121,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_cnt(3),
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111,
      I4 => interface_tmp_sensor_cnt(2),
      I5 => N6,
      O => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11_225
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd2_In2 : LUT6
    generic map(
      INIT => X"0000000040000000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_cnt(1),
      I3 => interface_tmp_sensor_cnt(2),
      I4 => interface_tmp_sensor_cnt(6),
      I5 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In2_523
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd2_In3 : LUT6
    generic map(
      INIT => X"5555555500000040"
    )
    port map (
      I0 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I1 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In2_523,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      I3 => interface_tmp_sensor_cnt(5),
      I4 => interface_tmp_sensor_cnt(4),
      I5 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In1_522,
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In
    );
  interface_tmp_sensor_state_FSM_FFd4_In1 : LUT5
    generic map(
      INIT => X"55551555"
    )
    port map (
      I0 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      I1 => interface_tmp_sensor_cnt_add(3),
      I2 => interface_tmp_sensor_search_time_203,
      I3 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT421,
      O => interface_tmp_sensor_state_FSM_FFd4_In1_524
    );
  interface_tmp_sensor_state_FSM_FFd4_In2 : LUT5
    generic map(
      INIT => X"DFFF8AFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_state_FSM_FFd4_In1_524,
      I2 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_cnt_wr_2_writetemp_7_Mux_49_o,
      O => interface_tmp_sensor_state_FSM_FFd4_In2_525
    );
  interface_tmp_sensor_state_FSM_FFd4_In5 : LUT6
    generic map(
      INIT => X"A2A2A2A2A2A2FFA2"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_cnt(9),
      I2 => interface_tmp_sensor_state_FSM_FFd3_In43_228,
      I3 => interface_tmp_sensor_state_FSM_FFd4_In61,
      I4 => N26,
      I5 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_FSM_FFd4_In6_527
    );
  interface_tmp_sensor_state_FSM_FFd4_In6 : LUT6
    generic map(
      INIT => X"FFFFFFFF08080800"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_In621,
      I1 => interface_tmp_sensor_cnt(8),
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_cnt(3),
      I4 => interface_tmp_sensor_cnt(2),
      I5 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_FSM_FFd4_In7_528
    );
  interface_tmp_sensor_state_FSM_FFd4_In7 : LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(7),
      I1 => interface_tmp_sensor_cnt(8),
      I2 => interface_tmp_sensor_cnt(3),
      I3 => interface_tmp_sensor_cnt(6),
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_state_FSM_FFd4_In8_529
    );
  interface_tmp_sensor_state_FSM_FFd4_In9 : LUT5
    generic map(
      INIT => X"55541110"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_state_FSM_FFd4_In9_530,
      I3 => interface_tmp_sensor_state_FSM_FFd4_In7_528,
      I4 => interface_tmp_sensor_state_FSM_FFd4_In6_527,
      O => interface_tmp_sensor_state_FSM_FFd4_In10_531
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT24 : LUT6
    generic map(
      INIT => X"AAAA0A0088880800"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272,
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1931,
      I3 => interface_tmp_sensor_cnt(4),
      I4 => interface_tmp_sensor_cnt(5),
      I5 => N10,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_5_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT202 : LUT5
    generic map(
      INIT => X"DDFDFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(6),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I3 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I4 => interface_tmp_sensor_cnt(2),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT201_534
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT203 : LUT5
    generic map(
      INIT => X"7FFF2FFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_0_inv_inv,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_In2,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      I3 => interface_tmp_sensor_cnt(1),
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT201_534,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT202_535
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT204 : LUT6
    generic map(
      INIT => X"AAAAAAAA08880080"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT20,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT202_535,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_4_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT161 : LUT6
    generic map(
      INIT => X"5555555515555555"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_cnt(1),
      I2 => interface_tmp_sensor_cnt(2),
      I3 => interface_tmp_sensor_cnt(0),
      I4 => interface_tmp_sensor_cnt(6),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16121,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT163 : LUT6
    generic map(
      INIT => X"FFFFFFFF54045555"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT161_537,
      I2 => interface_tmp_sensor_cnt(5),
      I3 => interface_tmp_sensor_cnt(2),
      I4 => interface_tmp_sensor_cnt(0),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT162_538
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT164 : LUT6
    generic map(
      INIT => X"EEEA00000000EEEA"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1611,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT162_538,
      I4 => interface_tmp_sensor_cnt(3),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1521,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_3_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT282 : LUT6
    generic map(
      INIT => X"FFFFFFEFFFFFFF45"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(3),
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT16121,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111,
      I3 => interface_tmp_sensor_state_FSM_FFd4_In21,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1521,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT281_540
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT284 : LUT6
    generic map(
      INIT => X"FF2A00000000FF2A"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249,
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT291,
      I2 => interface_tmp_sensor_state_FSM_FFd2_In4_248,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT282_541,
      I4 => interface_tmp_sensor_cnt(6),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_6_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(3),
      I1 => interface_tmp_sensor_cnt(6),
      I2 => interface_tmp_sensor_cnt(0),
      I3 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122_543
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT125 : LUT5
    generic map(
      INIT => X"AAAA8880"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1611,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124_544,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2021,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_2_Q
    );
  interface_tmp_sensor_n0647_inv1 : LUT6
    generic map(
      INIT => X"0000DDDDF0FFF0FF"
    )
    port map (
      I0 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I2 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I3 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I4 => interface_tmp_sensor_state_FSM_FFd3_127,
      I5 => interface_tmp_sensor_state_0_inv_inv,
      O => interface_tmp_sensor_n0647_inv1_545
    );
  interface_tmp_sensor_n0527_inv1_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      O => N12
    );
  interface_tmp_sensor_n0527_inv1 : LUT6
    generic map(
      INIT => X"0000000040000000"
    )
    port map (
      I0 => interface_tmp_sensor_write_flag_FSM_FFd2_In111,
      I1 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      I2 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      I5 => N12,
      O => interface_tmp_sensor_n0527_inv1_260
    );
  cu_curr_state_FSM_FFd3_In11 : LUT3
    generic map(
      INIT => X"BE"
    )
    port map (
      I0 => cu_watch_dog_tc_275,
      I1 => cu_edge_detect(0),
      I2 => cu_edge_detect(1),
      O => cu_curr_state_FSM_FFd3_In1
    );
  cu_curr_state_FSM_FFd3_In12 : LUT5
    generic map(
      INIT => X"F7A7F2A2"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => interface_tmp_sensor_led1_41,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => interface_lcd_interface_done_18,
      I4 => cu_curr_state_FSM_FFd3_In1,
      O => cu_curr_state_FSM_FFd3_In11_550
    );
  cu_curr_state_FSM_FFd3_In13 : LUT6
    generic map(
      INIT => X"BAABBAAA10011000"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd2_273,
      I1 => interface_lcd_interface_done_18,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => cu_watch_dog_tc_275,
      I5 => cu_curr_state_FSM_FFd3_In11_550,
      O => cu_curr_state_FSM_FFd3_In
    );
  cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o11 : LUT6
    generic map(
      INIT => X"AAAAAAAA88808080"
    )
    port map (
      I0 => cu_watch_dog_cnt(5),
      I1 => cu_watch_dog_cnt(3),
      I2 => cu_watch_dog_cnt(2),
      I3 => cu_watch_dog_cnt(0),
      I4 => cu_watch_dog_cnt(1),
      I5 => cu_watch_dog_cnt(4),
      O => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1
    );
  cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o12 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => cu_watch_dog_cnt(8),
      I1 => cu_watch_dog_cnt(6),
      I2 => cu_watch_dog_cnt(7),
      I3 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1,
      O => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT6_SW0 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => cu_watch_dog_cnt(2),
      I1 => cu_watch_dog_cnt(4),
      I2 => cu_watch_dog_cnt(3),
      O => N16
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT6 : LUT6
    generic map(
      INIT => X"2020202002202020"
    )
    port map (
      I0 => cu_enable_wd,
      I1 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o,
      I2 => cu_watch_dog_cnt(5),
      I3 => cu_watch_dog_cnt(0),
      I4 => cu_watch_dog_cnt(1),
      I5 => N16,
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_5_Q
    );
  interface_lcd_translate_int_data_out_3_8 : LUT5
    generic map(
      INIT => X"5F575D55"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(7),
      I3 => interface_lcd_translate_int_data_out_1_bdd41,
      I4 => interface_lcd_translate_int_data_out_3_6_556,
      O => interface_lcd_translate_int_data_out_3_7_557
    );
  interface_lcd_translate_int_data_out_3_9 : LUT6
    generic map(
      INIT => X"BABABABAAAAAAAEA"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(4),
      I5 => data_from_comparison(5),
      O => interface_lcd_translate_int_data_out_3_8_558
    );
  interface_lcd_translate_int_data_out_3_11 : LUT6
    generic map(
      INIT => X"F5B15511B1B11111"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => interface_lcd_translate_int_data_out_3_5_555,
      I3 => interface_lcd_translate_int_data_out_3_7_557,
      I4 => interface_lcd_translate_int_data_out_3_3,
      I5 => interface_lcd_translate_int_data_out_3_9_559,
      O => interface_lcd_data_in_inter_3_Q
    );
  interface_lcd_translate_int_data_out_1_13 : LUT6
    generic map(
      INIT => X"EFABEBAABABEBABE"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(3),
      I5 => data_from_comparison(5),
      O => interface_lcd_translate_int_data_out_1_12_564
    );
  interface_lcd_translate_int_data_out_1_14 : LUT6
    generic map(
      INIT => X"55B5551555355515"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(1),
      I1 => data_from_comparison(8),
      I2 => interface_lcd_enable_tr,
      I3 => interface_lcd_translate_int_counter_select_cnt(2),
      I4 => interface_lcd_translate_int_data_out_1_12_564,
      I5 => interface_lcd_translate_int_data_out_1_11,
      O => interface_lcd_translate_int_data_out_1_13_565
    );
  interface_lcd_translate_int_data_out_0_15 : LUT6
    generic map(
      INIT => X"FB51AB01AB01AB01"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => interface_lcd_translate_int_counter_select_cnt(1),
      I3 => interface_lcd_translate_int_data_out_0_13,
      I4 => interface_lcd_translate_int_data_out_0_4,
      I5 => interface_lcd_translate_int_data_out_0_6,
      O => interface_lcd_data_in_inter_0_Q
    );
  interface_lcd_translate_int_data_out_2_2 : LUT6
    generic map(
      INIT => X"AAAAAAAA08082820"
    )
    port map (
      I0 => interface_lcd_translate_int_data_out(2),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(5),
      I5 => data_from_comparison(8),
      O => interface_lcd_translate_int_data_out_2_1_570
    );
  interface_lcd_translate_int_data_out_2_6 : LUT4
    generic map(
      INIT => X"ECCC"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(2),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => interface_lcd_enable_tr,
      I3 => data_from_comparison(0),
      O => interface_lcd_translate_int_data_out_2_5_573
    );
  interface_lcd_translate_int_data_out_2_17 : LUT6
    generic map(
      INIT => X"2222222020222020"
    )
    port map (
      I0 => interface_lcd_enable_tr,
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => data_from_comparison(8),
      I3 => data_from_comparison(6),
      I4 => interface_lcd_translate_int_data_out_2_15_576,
      I5 => interface_lcd_translate_int_data_out_2_14_575,
      O => interface_lcd_translate_int_data_out_2_16_577
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT11 : LUT6
    generic map(
      INIT => X"0000000800080008"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd4_In11,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_interface_writing_counter(1),
      I5 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT1
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT14 : LUT6
    generic map(
      INIT => X"FFFFFFFFAAA2AAAA"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT11_579,
      I1 => interface_lcd_interface_state_FSM_FFd3_347,
      I2 => interface_lcd_interface_state_FSM_FFd4_348,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd1_345,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT1,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_0_Q
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT28 : LUT6
    generic map(
      INIT => X"4444040044445400"
    )
    port map (
      I0 => N18,
      I1 => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_3_Q,
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_writing_counter(0),
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_3_Q
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o33 : LUT5
    generic map(
      INIT => X"10040004"
    )
    port map (
      I0 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32_586
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o34 : LUT5
    generic map(
      INIT => X"01555555"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o33_587
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o35 : LUT6
    generic map(
      INIT => X"FFFFFF80FF80FF80"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd4_In11,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o33_587,
      I3 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32_586,
      I4 => interface_lcd_interface_RS_19,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o31,
      O => interface_lcd_interface_state_3_X_5_o_Mux_96_o
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o22 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o21
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o23 : LUT6
    generic map(
      INIT => X"BA22FEEEB800B800"
    )
    port map (
      I0 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I1 => interface_lcd_interface_state(1),
      I2 => init_set_up,
      I3 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o21,
      I4 => interface_lcd_interface_state_FSM_FFd1_In1,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o22_590
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o26 : LUT6
    generic map(
      INIT => X"FFFFFFFFAAAA8088"
    )
    port map (
      I0 => interface_lcd_interface_done_18,
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o24_592,
      I2 => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332,
      I3 => interface_lcd_clk_enable_unit_clk_enable_47,
      I4 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o23_591,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o22_590,
      O => interface_lcd_interface_state_3_X_5_o_Mux_98_o
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_102_o1_SW0 : LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd4_348,
      I1 => interface_lcd_interface_state_FSM_FFd3_347,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      O => N20
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_102_o1 : LUT6
    generic map(
      INIT => X"AAAAA2EAFFFFB3EA"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => N20,
      O => interface_lcd_interface_state_3_X_5_o_Mux_102_o
    );
  interface_lcd_interface_state_3_21 : LUT6
    generic map(
      INIT => X"0222020202020202"
    )
    port map (
      I0 => interface_lcd_interface_state_3_22_308,
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_state_3_9,
      O => interface_lcd_interface_state_3_2_594
    );
  interface_lcd_interface_state_3_22 : LUT6
    generic map(
      INIT => X"EFFEFBFF01541155"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(2),
      I4 => cu_in_out_val_5,
      I5 => interface_lcd_interface_dataOUT(2),
      O => interface_lcd_interface_state_3_21_595
    );
  interface_lcd_interface_state_3_42 : LUT6
    generic map(
      INIT => X"FEAAEEBE10000414"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(2),
      I4 => cu_in_out_val_5,
      I5 => interface_lcd_interface_dataOUT(4),
      O => interface_lcd_interface_state_3_41_598
    );
  interface_lcd_interface_state_3_1 : LUT6
    generic map(
      INIT => X"AAAA200075556444"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(1),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => interface_lcd_interface_state_3_9,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_state_3_142,
      I5 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_state(3)
    );
  interface_lcd_interface_state_3_2 : LUT6
    generic map(
      INIT => X"AAAAAAAAA83FC03F"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(0),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_state_3_3
    );
  interface_lcd_interface_state_3_4 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => interface_lcd_interface_state_3_3,
      I1 => interface_lcd_interface_state(1),
      I2 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I3 => interface_lcd_interface_state(3),
      I4 => interface_lcd_interface_state_3_22_308,
      O => interface_lcd_interface_state_3_5_602
    );
  interface_lcd_interface_state_3_7_SW0 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => interface_lcd_interface_state_3_22_308,
      I1 => interface_lcd_interface_state_3_9,
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(3),
      I5 => interface_lcd_interface_state_FSM_FFd4_348,
      O => N22
    );
  interface_lcd_interface_state_FSM_FFd4_In1 : LUT6
    generic map(
      INIT => X"EAE8E8E82A282828"
    )
    port map (
      I0 => init_set_up,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_clk_enable_unit_clk_enable_47,
      I4 => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332,
      I5 => start_display,
      O => interface_lcd_interface_state_FSM_FFd4_In1_604
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT252 : LUT6
    generic map(
      INIT => X"88880A8088880080"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT13,
      I1 => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_2_Q,
      I2 => interface_lcd_interface_writing_counter(3),
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_writing_counter(0),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT251_605
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT253 : LUT6
    generic map(
      INIT => X"FFFFFFFF20082808"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT136,
      I1 => interface_lcd_interface_writing_counter(2),
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => cu_in_out_val_5,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT251_605,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_2_Q
    );
  interface_lcd_interface_state_3_31 : LUT5
    generic map(
      INIT => X"22202222"
    )
    port map (
      I0 => interface_lcd_interface_state_3_22_308,
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_state_3_142,
      I4 => interface_lcd_interface_writing_counter(1),
      O => interface_lcd_interface_state_3_31_606
    );
  interface_lcd_interface_state_3_32 : LUT6
    generic map(
      INIT => X"AAAAAAAAA83FC0F3"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(3),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_state_3_32_607
    );
  interface_lcd_interface_state_3_33 : LUT5
    generic map(
      INIT => X"FB0BF000"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_state(1),
      I3 => interface_lcd_interface_state_3_32_607,
      I4 => interface_lcd_data_in_inter_3_Q,
      O => interface_lcd_interface_state_3_33_608
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT132 : LUT6
    generic map(
      INIT => X"8888008A8888AA80"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT13,
      I1 => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_1_Q,
      I2 => interface_lcd_interface_writing_counter(3),
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_writing_counter(0),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT131
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT133 : LUT6
    generic map(
      INIT => X"FFFFFFFF000A2A00"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT136,
      I1 => cu_in_out_val_5,
      I2 => interface_lcd_interface_writing_counter(2),
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(1),
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT131,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_101_OUT_1_Q
    );
  interface_lcd_interface_state_FSM_FFd2_In : LUT6
    generic map(
      INIT => X"0444544404645464"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => N24,
      I5 => interface_lcd_interface_state_FSM_FFd1_In1,
      O => interface_lcd_interface_state_FSM_FFd2_In_350
    );
  comparison_block_mux_out_Mmux_y21 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(1),
      I2 => comparison_block_min_tmp_reg_ind_data(1),
      O => comparison_block_mux_out_Mmux_y2
    );
  comparison_block_mux_out_Mmux_y22 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(1),
      I2 => comparison_block_max_tmp_reg_ind_data(1),
      O => comparison_block_mux_out_Mmux_y21_613
    );
  comparison_block_mux_out_Mmux_y91 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(8),
      I2 => comparison_block_min_tmp_reg_ind_data(8),
      O => comparison_block_mux_out_Mmux_y9
    );
  comparison_block_mux_out_Mmux_y92 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(8),
      I2 => comparison_block_max_tmp_reg_ind_data(8),
      O => comparison_block_mux_out_Mmux_y91_615
    );
  comparison_block_mux_out_Mmux_y81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(7),
      I2 => comparison_block_min_tmp_reg_ind_data(7),
      O => comparison_block_mux_out_Mmux_y8
    );
  comparison_block_mux_out_Mmux_y82 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(7),
      I2 => comparison_block_max_tmp_reg_ind_data(7),
      O => comparison_block_mux_out_Mmux_y81_617
    );
  comparison_block_mux_out_Mmux_y71 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(6),
      I2 => comparison_block_min_tmp_reg_ind_data(6),
      O => comparison_block_mux_out_Mmux_y7
    );
  comparison_block_mux_out_Mmux_y72 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(6),
      I2 => comparison_block_max_tmp_reg_ind_data(6),
      O => comparison_block_mux_out_Mmux_y71_619
    );
  comparison_block_mux_out_Mmux_y61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(5),
      I2 => comparison_block_min_tmp_reg_ind_data(5),
      O => comparison_block_mux_out_Mmux_y6
    );
  comparison_block_mux_out_Mmux_y62 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(5),
      I2 => comparison_block_max_tmp_reg_ind_data(5),
      O => comparison_block_mux_out_Mmux_y61_621
    );
  comparison_block_mux_out_Mmux_y51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(4),
      I2 => comparison_block_min_tmp_reg_ind_data(4),
      O => comparison_block_mux_out_Mmux_y5
    );
  comparison_block_mux_out_Mmux_y52 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(4),
      I2 => comparison_block_max_tmp_reg_ind_data(4),
      O => comparison_block_mux_out_Mmux_y51_623
    );
  comparison_block_mux_out_Mmux_y41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(3),
      I2 => comparison_block_min_tmp_reg_ind_data(3),
      O => comparison_block_mux_out_Mmux_y4
    );
  comparison_block_mux_out_Mmux_y42 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(3),
      I2 => comparison_block_max_tmp_reg_ind_data(3),
      O => comparison_block_mux_out_Mmux_y41_625
    );
  comparison_block_mux_out_Mmux_y31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(2),
      I2 => comparison_block_min_tmp_reg_ind_data(2),
      O => comparison_block_mux_out_Mmux_y3
    );
  comparison_block_mux_out_Mmux_y32 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(2),
      I2 => comparison_block_max_tmp_reg_ind_data(2),
      O => comparison_block_mux_out_Mmux_y31_627
    );
  reset_IBUF : IBUF
    port map (
      I => reset,
      O => reset_IBUF_0
    );
  ind_outd_sw_IBUF : IBUF
    port map (
      I => ind_outd_sw,
      O => ind_outd_sw_IBUF_2
    );
  tmp_sensor_IOBUF : IOBUF
    port map (
      I => interface_tmp_sensor_dq_220,
      T => interface_tmp_sensor_state_3_clk_1us_DFF_94_inv,
      O => N26,
      IO => tmp_sensor
    );
  lcd_data_7_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(7),
      O => lcd_data(7)
    );
  lcd_data_6_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(6),
      O => lcd_data(6)
    );
  lcd_data_5_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(5),
      O => lcd_data(5)
    );
  lcd_data_4_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(4),
      O => lcd_data(4)
    );
  lcd_data_3_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(3),
      O => lcd_data(3)
    );
  lcd_data_2_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(2),
      O => lcd_data(2)
    );
  lcd_data_1_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(1),
      O => lcd_data(1)
    );
  lcd_data_0_OBUF : OBUF
    port map (
      I => interface_lcd_interface_dataOUT(0),
      O => lcd_data(0)
    );
  lcd_enable_OBUF : OBUF
    port map (
      I => lcd_enable_OBUF_20,
      O => lcd_enable
    );
  lcd_rw_OBUF : OBUF
    port map (
      I => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      O => lcd_rw
    );
  lcd_rs_OBUF : OBUF
    port map (
      I => interface_lcd_interface_RS_19,
      O => lcd_rs
    );
  system_ready_OBUF : OBUF
    port map (
      I => system_ready_OBUF_8,
      O => system_ready
    );
  interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_31 : LUT5
    generic map(
      INIT => X"FBEA5140"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(0),
      I1 => interface_tmp_sensor_cnt_wr(1),
      I2 => interface_tmp_sensor_writetemp_6_Q,
      I3 => interface_tmp_sensor_writetemp_4_Q,
      I4 => interface_tmp_sensor_writetemp_1_Q,
      O => interface_tmp_sensor_Mmux_cnt_wr_2_writetemp_7_Mux_49_o_3
    );
  interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => interface_lcd_interface_init_count(1),
      I1 => interface_lcd_interface_init_count(0),
      O => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_0_Q
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(1),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_1_rt_643
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(2),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_2_rt_644
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(3),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_3_rt_645
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_4_rt_646
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(5),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_5_rt_647
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(6),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_6_rt_648
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(7),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_7_rt_649
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(8),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_8_rt_650
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(9),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_9_rt_651
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(10),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_10_rt_652
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(11),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_11_rt_653
    );
  interface_lcd_clk_enable_unit_Mcount_count_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(12),
      O => interface_lcd_clk_enable_unit_Mcount_count_cy_12_rt_654
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_2_rt_655
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(1),
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_cy_1_rt_656
    );
  interface_lcd_clk_enable_unit_Mcount_count_xor_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_count(13),
      O => interface_lcd_clk_enable_unit_Mcount_count_xor_13_rt_657
    );
  interface_lcd_interface_Mcount_init_count_xor_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_interface_init_count(1),
      O => interface_lcd_interface_Mcount_init_count_xor_1_rt_658
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_xor_3_rt_659
    );
  interface_lcd_interface_state_3_34 : LUT6
    generic map(
      INIT => X"FFFEF3F2FDFCF1F0"
    )
    port map (
      I0 => interface_lcd_interface_state(2),
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I2 => interface_lcd_interface_state_3_31_606,
      I3 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_73,
      I4 => interface_lcd_interface_state_3_33_608,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_63_320,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_3_Q
    );
  interface_lcd_translate_int_data_out_1_201 : LUT5
    generic map(
      INIT => X"0F0F0F1F"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(5),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(3),
      O => interface_lcd_translate_int_data_out_1_bdd41
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT31_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(0),
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(2),
      I3 => interface_lcd_interface_writing_counter(1),
      O => N28
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT31_SW1 : LUT4
    generic map(
      INIT => X"FF45"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(1),
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(2),
      O => N29
    );
  interface_lcd_translate_int_data_out_2_4_SW1 : LUT5
    generic map(
      INIT => X"777F555D"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(7),
      I3 => interface_lcd_translate_int_data_out_1_bdd41,
      I4 => interface_lcd_translate_int_data_out_2_2_571,
      O => N32
    );
  interface_lcd_translate_int_data_out_2_5 : LUT6
    generic map(
      INIT => X"FFFEFF54FF54FF54"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(1),
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => N31,
      I3 => interface_lcd_translate_int_counter_select_cnt(0),
      I4 => interface_lcd_translate_int_data_out_2_1_570,
      I5 => N32,
      O => interface_lcd_translate_int_data_out_2_4
    );
  interface_lcd_translate_int_data_out_3_5 : LUT6
    generic map(
      INIT => X"0180180660180180"
    )
    port map (
      I0 => data_from_comparison(6),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(3),
      I5 => data_from_comparison(5),
      O => interface_lcd_translate_int_data_out_3_4_554
    );
  interface_lcd_translate_int_data_out_2_3 : LUT6
    generic map(
      INIT => X"0002AAAAAAAAAAAA"
    )
    port map (
      I0 => data_from_comparison(7),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(3),
      I3 => data_from_comparison(1),
      I4 => data_from_comparison(5),
      I5 => data_from_comparison(4),
      O => interface_lcd_translate_int_data_out_2_2_571
    );
  interface_lcd_translate_int_data_out_3_7 : LUT5
    generic map(
      INIT => X"E0000000"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(4),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(5),
      O => interface_lcd_translate_int_data_out_3_6_556
    );
  interface_lcd_translate_int_data_out_0_7 : LUT6
    generic map(
      INIT => X"0000080000080808"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => start_display,
      I2 => interface_lcd_translate_int_counter_select_cnt(2),
      I3 => interface_lcd_translate_int_data_out_0_bdd46,
      I4 => N43,
      I5 => N42,
      O => interface_lcd_translate_int_data_out_0_6
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT11_SW1 : LUT6
    generic map(
      INIT => X"FFFFDAFFFFFFFFFF"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_state_3_9,
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_state_FSM_FFd4_348,
      O => N46
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT11_SW2 : LUT6
    generic map(
      INIT => X"8888888808880808"
    )
    port map (
      I0 => interface_lcd_interface_state_3_9,
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(3),
      I5 => interface_lcd_interface_writing_counter(2),
      O => N47
    );
  interface_lcd_interface_state_3_15 : LUT6
    generic map(
      INIT => X"EFEEEAEE45444044"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_71,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_61,
      I5 => interface_lcd_interface_state_3_13_584,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_1_Q
    );
  interface_lcd_interface_state_3_24 : LUT6
    generic map(
      INIT => X"FFFF0F04FFFF0B00"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I3 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_72,
      I4 => interface_lcd_interface_state_3_24_596,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_62,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_2_Q
    );
  interface_lcd_translate_int_data_out_3_6 : LUT6
    generic map(
      INIT => X"2000200020000000"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => interface_lcd_translate_int_counter_select_cnt(1),
      I3 => start_display,
      I4 => data_from_comparison(8),
      I5 => interface_lcd_translate_int_data_out_3_4_554,
      O => interface_lcd_translate_int_data_out_3_5_555
    );
  comparison_block_mux_out_Mmux_y63 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(5),
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y61_621,
      I5 => comparison_block_mux_out_Mmux_y6,
      O => data_from_comparison(5)
    );
  comparison_block_mux_out_Mmux_y33 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(2),
      I1 => cu_curr_state_FSM_FFd2_1_729,
      I2 => cu_curr_state_FSM_FFd3_1_728,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y31_627,
      I5 => comparison_block_mux_out_Mmux_y3,
      O => data_from_comparison(2)
    );
  comparison_block_mux_out_Mmux_y53 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(4),
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y51_623,
      I5 => comparison_block_mux_out_Mmux_y5,
      O => data_from_comparison(4)
    );
  interface_lcd_interface_state_3_14 : LUT6
    generic map(
      INIT => X"CCE4E4E4D8F0F0F0"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => N50,
      I2 => N49,
      I3 => interface_lcd_translate_int_data_out_1_7,
      I4 => interface_lcd_translate_int_data_out_1_4,
      I5 => interface_lcd_translate_int_data_out_1_13_565,
      O => interface_lcd_interface_state_3_13_584
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_611 : LUT6
    generic map(
      INIT => X"331B1B1B270F0F0F"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => N53,
      I2 => N52,
      I3 => interface_lcd_translate_int_data_out_1_7,
      I4 => interface_lcd_translate_int_data_out_1_4,
      I5 => interface_lcd_translate_int_data_out_1_13_565,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_61
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT41_SW1 : LUT6
    generic map(
      INIT => X"8888888880808880"
    )
    port map (
      I0 => interface_lcd_interface_state_3_9,
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_writing_counter(2),
      I3 => interface_lcd_interface_writing_counter(0),
      I4 => interface_lcd_interface_writing_counter(1),
      I5 => interface_lcd_interface_writing_counter(3),
      O => N56
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT41_SW2 : LUT6
    generic map(
      INIT => X"FFFF67FFFFFFFFFF"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_state_3_9,
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_state_FSM_FFd4_348,
      O => N57
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_63 : LUT5
    generic map(
      INIT => X"88DD0A5F"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => N57,
      I2 => N56,
      I3 => N55,
      I4 => interface_lcd_data_in_inter_3_Q,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_63_320
    );
  comparison_block_mux_out_Mmux_y43 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(3),
      I1 => cu_curr_state_FSM_FFd2_1_729,
      I2 => cu_curr_state_FSM_FFd3_1_728,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y41_625,
      I5 => comparison_block_mux_out_Mmux_y4,
      O => data_from_comparison(3)
    );
  interface_lcd_translate_int_data_out_0_11_SW2 : LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(3),
      O => N59
    );
  interface_lcd_translate_int_data_out_2_16 : LUT5
    generic map(
      INIT => X"96922496"
    )
    port map (
      I0 => data_from_comparison(3),
      I1 => data_from_comparison(5),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(2),
      O => interface_lcd_translate_int_data_out_2_15_576
    );
  interface_lcd_translate_int_data_out_2_15 : LUT5
    generic map(
      INIT => X"92964992"
    )
    port map (
      I0 => data_from_comparison(3),
      I1 => data_from_comparison(5),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(2),
      I4 => data_from_comparison(4),
      O => interface_lcd_translate_int_data_out_2_14_575
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_5_f7_4_SW0 : LUT4
    generic map(
      INIT => X"E444"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_GND_5_o_GND_5_o_select_28_OUT(5),
      I2 => interface_lcd_interface_state_3_71,
      I3 => interface_lcd_interface_dataOUT(5),
      O => N61
    );
  interface_lcd_interface_state_3_7 : LUT6
    generic map(
      INIT => X"FFFFFEBAFFFF5410"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_state(2),
      I2 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_77,
      I3 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_67,
      I4 => N22,
      I5 => N63,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_7_Q
    );
  comparison_block_mux_out_Mmux_y93 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(8),
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y91_615,
      I5 => comparison_block_mux_out_Mmux_y9,
      O => data_from_comparison(8)
    );
  comparison_block_mux_out_Mmux_y83 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(7),
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y81_617,
      I5 => comparison_block_mux_out_Mmux_y8,
      O => data_from_comparison(7)
    );
  comparison_block_mux_out_Mmux_y73 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(6),
      I1 => cu_curr_state_FSM_FFd2_1_729,
      I2 => cu_curr_state_FSM_FFd3_1_728,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y71_619,
      I5 => comparison_block_mux_out_Mmux_y7,
      O => data_from_comparison(6)
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_621 : LUT6
    generic map(
      INIT => X"FFAA3FAA0FAA3FAA"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_14_OUT_2_Q,
      I1 => N28,
      I2 => interface_lcd_interface_state(0),
      I3 => interface_lcd_interface_state(1),
      I4 => interface_lcd_translate_int_data_out_2_4,
      I5 => N65,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_62
    );
  interface_lcd_translate_int_data_out_2_18_SW1 : LUT6
    generic map(
      INIT => X"F050705070507050"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => interface_lcd_interface_state_3_8,
      I3 => interface_lcd_translate_int_data_out_2_5_573,
      I4 => interface_lcd_translate_int_data_out_2_13,
      I5 => interface_lcd_translate_int_data_out_2_16_577,
      O => N67
    );
  interface_lcd_interface_state_3_23 : LUT6
    generic map(
      INIT => X"FFA2FF80FF80FF80"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_state(1),
      I2 => interface_lcd_interface_state_3_21_595,
      I3 => interface_lcd_interface_state_3_2_594,
      I4 => interface_lcd_translate_int_data_out_2_4,
      I5 => N67,
      O => interface_lcd_interface_state_3_24_596
    );
  interface_lcd_interface_state_3_5 : LUT6
    generic map(
      INIT => X"F2F2F7F7F0F5F0F5"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => N71,
      I2 => interface_lcd_interface_state_3_5_602,
      I3 => N69,
      I4 => N70,
      I5 => interface_lcd_data_in_inter_0_Q,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_0_Q
    );
  comparison_block_mux_out_Mmux_y23 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(1),
      I1 => cu_curr_state_FSM_FFd2_1_729,
      I2 => cu_curr_state_FSM_FFd3_1_728,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => comparison_block_mux_out_Mmux_y21_613,
      I5 => comparison_block_mux_out_Mmux_y2,
      O => data_from_comparison(1)
    );
  interface_lcd_translate_int_data_out_1_12_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(2),
      O => N73
    );
  interface_lcd_translate_int_data_out_1_12 : LUT6
    generic map(
      INIT => X"1859A1A15951A185"
    )
    port map (
      I0 => data_from_comparison(5),
      I1 => data_from_comparison(4),
      I2 => data_from_comparison(6),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(7),
      I5 => N73,
      O => interface_lcd_translate_int_data_out_1_11
    );
  interface_lcd_translate_int_data_out_2_14_SW0 : LUT6
    generic map(
      INIT => X"E87E01801701E87E"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(3),
      I5 => data_from_comparison(5),
      O => N75
    );
  interface_lcd_translate_int_data_out_2_14_SW1 : LUT6
    generic map(
      INIT => X"E8FE17817F17E8FE"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(4),
      I4 => data_from_comparison(3),
      I5 => data_from_comparison(5),
      O => N76
    );
  interface_lcd_translate_int_data_out_2_14 : LUT4
    generic map(
      INIT => X"7F5D"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(7),
      I2 => N76,
      I3 => N75,
      O => interface_lcd_translate_int_data_out_2_13
    );
  interface_lcd_translate_int_data_out_3_4_SW0 : LUT6
    generic map(
      INIT => X"E97FFFE9FE977FFE"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(5),
      I5 => data_from_comparison(4),
      O => N78
    );
  interface_lcd_translate_int_data_out_3_4_SW1 : LUT6
    generic map(
      INIT => X"FFE97FFE97FFE97F"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(4),
      I5 => data_from_comparison(5),
      O => N79
    );
  interface_lcd_translate_int_data_out_3_4 : LUT4
    generic map(
      INIT => X"5D7F"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(7),
      I2 => N79,
      I3 => N78,
      O => interface_lcd_translate_int_data_out_3_3
    );
  interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_SW0 : LUT6
    generic map(
      INIT => X"F0F0FF00FF004444"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_clk_enable_47,
      I1 => interface_lcd_interface_dataOUT(0),
      I2 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_Q,
      I3 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_Q,
      I4 => interface_lcd_interface_state(0),
      I5 => interface_lcd_interface_state(1),
      O => N81
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_78 : LUT6
    generic map(
      INIT => X"FFFFFFFE00010000"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd2_273,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332,
      I4 => N81,
      I5 => N82,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_7
    );
  comparison_block_mux_out_Mmux_y12_SW0 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_max_tmp_reg_out_data(0),
      I2 => comparison_block_max_tmp_reg_ind_data(0),
      O => N84
    );
  comparison_block_mux_out_Mmux_y12_SW1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => comparison_block_min_tmp_reg_out_data(0),
      I2 => comparison_block_min_tmp_reg_ind_data(0),
      O => N85
    );
  comparison_block_mux_out_Mmux_y12 : LUT6
    generic map(
      INIT => X"EC00E0002C002000"
    )
    port map (
      I0 => comparison_block_curr_tmp_reg_data(0),
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => N84,
      I5 => N85,
      O => data_from_comparison(0)
    );
  interface_lcd_enable_tr1 : LUT4
    generic map(
      INIT => X"8880"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd2_273,
      O => interface_lcd_enable_tr
    );
  interface_lcd_translate_int_data_out_3_10 : LUT6
    generic map(
      INIT => X"2220000000000000"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd3_272,
      I4 => cu_curr_state_FSM_FFd1_274,
      I5 => interface_lcd_translate_int_data_out_3_8_558,
      O => interface_lcd_translate_int_data_out_3_9_559
    );
  interface_lcd_translate_int_data_out_0_5_SW0 : LUT6
    generic map(
      INIT => X"FEE07FFE0007E000"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(5),
      I5 => data_from_comparison(4),
      O => N87
    );
  interface_lcd_translate_int_data_out_0_5_SW1 : LUT6
    generic map(
      INIT => X"FFEC800137FFEC80"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(7),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(4),
      I5 => data_from_comparison(5),
      O => N88
    );
  interface_lcd_translate_int_data_out_0_5 : LUT4
    generic map(
      INIT => X"7F5D"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => N88,
      I3 => N87,
      O => interface_lcd_translate_int_data_out_0_4
    );
  interface_lcd_translate_int_data_out_1_8_SW0 : LUT5
    generic map(
      INIT => X"BAA65DDB"
    )
    port map (
      I0 => data_from_comparison(4),
      I1 => data_from_comparison(5),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(2),
      O => N90
    );
  interface_lcd_translate_int_data_out_1_8_SW1 : LUT5
    generic map(
      INIT => X"99924999"
    )
    port map (
      I0 => data_from_comparison(4),
      I1 => data_from_comparison(2),
      I2 => data_from_comparison(7),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(5),
      O => N91
    );
  interface_lcd_translate_int_data_out_1_8 : LUT5
    generic map(
      INIT => X"A8AA888A"
    )
    port map (
      I0 => interface_lcd_translate_int_data_out_1_5_561,
      I1 => data_from_comparison(8),
      I2 => data_from_comparison(6),
      I3 => N90,
      I4 => N91,
      O => interface_lcd_translate_int_data_out_1_7
    );
  interface_lcd_translate_int_data_out_1_5_SW0 : LUT6
    generic map(
      INIT => X"A49225A45A49925A"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(7),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(5),
      I5 => data_from_comparison(4),
      O => N93
    );
  interface_lcd_translate_int_data_out_1_5_SW1 : LUT6
    generic map(
      INIT => X"A5B6DA5B6DA5B6DA"
    )
    port map (
      I0 => data_from_comparison(1),
      I1 => data_from_comparison(7),
      I2 => data_from_comparison(2),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(4),
      I5 => data_from_comparison(5),
      O => N94
    );
  interface_lcd_translate_int_data_out_1_5 : LUT4
    generic map(
      INIT => X"75FD"
    )
    port map (
      I0 => data_from_comparison(8),
      I1 => data_from_comparison(6),
      I2 => N93,
      I3 => N94,
      O => interface_lcd_translate_int_data_out_1_4
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_711 : LUT5
    generic map(
      INIT => X"222A2220"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(1),
      I1 => init_set_up,
      I2 => interface_lcd_interface_state(1),
      I3 => interface_lcd_interface_state(0),
      I4 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_71
    );
  interface_lcd_translate_int_data_out_0_14_SW0 : LUT4
    generic map(
      INIT => X"9BDF"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(2),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => data_from_comparison(0),
      I3 => data_from_comparison(1),
      O => N96
    );
  interface_lcd_translate_int_data_out_0_14_SW1 : LUT4
    generic map(
      INIT => X"8ACE"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(2),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => data_from_comparison(0),
      I3 => data_from_comparison(1),
      O => N97
    );
  interface_lcd_interface_state_3_43 : LUT6
    generic map(
      INIT => X"FFFFFFFFA8882000"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_state(1),
      I2 => interface_lcd_data_in_inter_4_Q,
      I3 => interface_lcd_interface_state_3_8,
      I4 => interface_lcd_interface_state_3_41_598,
      I5 => interface_lcd_interface_state_3_4_597,
      O => interface_lcd_interface_state_3_42_599
    );
  interface_tmp_sensor_Mmux_dq_state_3_MUX_1141_o11 : LUT6
    generic map(
      INIT => X"AAAA2022AAAAE0E2"
    )
    port map (
      I0 => N26,
      I1 => interface_tmp_sensor_nrst_state_3_AND_59_o1_508,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_nrst_state_3_AND_59_o3_510,
      I4 => interface_tmp_sensor_nrst_inv,
      I5 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_dq_state_3_MUX_1141_o
    );
  interface_tmp_sensor_nrst_state_3_AND_59_o2 : LUT5
    generic map(
      INIT => X"22222AAA"
    )
    port map (
      I0 => N26,
      I1 => interface_tmp_sensor_cnt(9),
      I2 => interface_tmp_sensor_cnt(4),
      I3 => interface_tmp_sensor_cnt(5),
      I4 => interface_tmp_sensor_nrst_state_3_AND_59_o121,
      O => interface_tmp_sensor_nrst_state_3_AND_59_o2_509
    );
  interface_lcd_interface_state_3_11 : LUT6
    generic map(
      INIT => X"0455044404440444"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(0),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_state_3_9,
      O => interface_lcd_interface_state_3_1_582
    );
  interface_tmp_sensor_write_flag_FSM_FFd2_In1111 : LUT4
    generic map(
      INIT => X"FEFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_add(2),
      I1 => interface_tmp_sensor_cnt_add(0),
      I2 => interface_tmp_sensor_cnt_add(1),
      I3 => interface_tmp_sensor_cnt_add(3),
      O => interface_tmp_sensor_write_flag_FSM_FFd2_In111
    );
  interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_1 : LUT4
    generic map(
      INIT => X"AAAB"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(0),
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd1_274,
      O => interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_Q
    );
  interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_1 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(0),
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd1_274,
      O => interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_Q
    );
  interface_lcd_translate_int_data_out_2_1 : LUT5
    generic map(
      INIT => X"22200000"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => interface_lcd_translate_int_counter_select_cnt(2),
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd3_272,
      I4 => cu_curr_state_FSM_FFd1_274,
      O => interface_lcd_translate_int_data_out(2)
    );
  interface_lcd_interface_state_3_63 : LUT6
    generic map(
      INIT => X"EFEEEAEE45444044"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_76,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_66,
      I5 => interface_lcd_interface_state_3_61,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_6_Q
    );
  interface_lcd_interface_state_3_44 : LUT6
    generic map(
      INIT => X"FFFFFFFF44544404"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_74,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd1_345,
      I4 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_64,
      I5 => interface_lcd_interface_state_3_42_599,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_4_Q
    );
  interface_lcd_interface_state_3_51 : LUT6
    generic map(
      INIT => X"EFEEEAEE45444044"
    )
    port map (
      I0 => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o2,
      I1 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_75,
      I2 => interface_lcd_interface_state_FSM_FFd1_345,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_65,
      I5 => N61,
      O => interface_lcd_interface_state_3_X_5_o_wide_mux_95_OUT_5_Q
    );
  interface_tmp_sensor_state_FSM_FFd4_In10 : LUT6
    generic map(
      INIT => X"FFFFFF88FFFF0888"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      I4 => interface_tmp_sensor_state_FSM_FFd4_In10_531,
      I5 => interface_tmp_sensor_state_FSM_FFd4_In5_526,
      O => interface_tmp_sensor_state_FSM_FFd4_In
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_761 : LUT5
    generic map(
      INIT => X"222A2220"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(6),
      I1 => init_set_up,
      I2 => interface_lcd_interface_state(1),
      I3 => interface_lcd_interface_state(0),
      I4 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_76
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_771 : LUT5
    generic map(
      INIT => X"222A2220"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(7),
      I1 => init_set_up,
      I2 => interface_lcd_interface_state(1),
      I3 => interface_lcd_interface_state(0),
      I4 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_77
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT283 : LUT5
    generic map(
      INIT => X"70700070"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT114,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT281_540,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT282_541
    );
  interface_lcd_interface_state_3_41 : LUT6
    generic map(
      INIT => X"0808080808000000"
    )
    port map (
      I0 => interface_lcd_interface_state_3_22_308,
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_writing_counter(3),
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_state_3_9,
      I5 => interface_lcd_interface_writing_counter(0),
      O => interface_lcd_interface_state_3_4_597
    );
  interface_lcd_translate_int_data_out_1_15_SW3 : LUT6
    generic map(
      INIT => X"FFFF0D0DFFF20D00"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd4_In11,
      I3 => interface_lcd_interface_state_3_8,
      I4 => interface_lcd_interface_state_3_12,
      I5 => interface_lcd_interface_state_3_1_582,
      O => N50
    );
  interface_lcd_translate_int_data_out_2_4_SW0 : LUT5
    generic map(
      INIT => X"A8000000"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => data_from_comparison(8),
      O => N31
    );
  interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_SW1 : LUT6
    generic map(
      INIT => X"F3C0FF00EE22AAAA"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(0),
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_Q,
      I3 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_Q,
      I4 => interface_lcd_interface_state_3_9,
      I5 => interface_lcd_interface_state(1),
      O => N82
    );
  interface_lcd_translate_int_data_out_0_14_SW2 : LUT6
    generic map(
      INIT => X"EEEEEEEE7777777F"
    )
    port map (
      I0 => data_from_comparison(6),
      I1 => data_from_comparison(7),
      I2 => data_from_comparison(3),
      I3 => data_from_comparison(5),
      I4 => data_from_comparison(4),
      I5 => data_from_comparison(8),
      O => N101
    );
  interface_lcd_translate_int_data_out_0_14_SW3 : LUT6
    generic map(
      INIT => X"FEEEFEEE7777777F"
    )
    port map (
      I0 => data_from_comparison(6),
      I1 => data_from_comparison(7),
      I2 => data_from_comparison(4),
      I3 => data_from_comparison(5),
      I4 => data_from_comparison(3),
      I5 => data_from_comparison(8),
      O => N102
    );
  interface_lcd_translate_int_data_out_0_14 : LUT6
    generic map(
      INIT => X"2222220A0A220A0A"
    )
    port map (
      I0 => interface_lcd_enable_tr,
      I1 => N96,
      I2 => N97,
      I3 => N59,
      I4 => N101,
      I5 => N102,
      O => interface_lcd_translate_int_data_out_0_13
    );
  interface_lcd_interface_state_state_1_1 : LUT4
    generic map(
      INIT => X"222A"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_state(1)
    );
  interface_lcd_interface_state_state_0_1 : LUT4
    generic map(
      INIT => X"222A"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd4_348,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      O => interface_lcd_interface_state(0)
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_741 : LUT5
    generic map(
      INIT => X"5F5F4051"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => init_set_up,
      I3 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      I4 => interface_lcd_interface_dataOUT(4),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_74
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_751 : LUT5
    generic map(
      INIT => X"5F5F4051"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => init_set_up,
      I3 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      I4 => interface_lcd_interface_dataOUT(5),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_75
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_721 : LUT5
    generic map(
      INIT => X"54F044E0"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => interface_lcd_interface_dataOUT(2),
      I3 => init_set_up,
      I4 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_72
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_731 : LUT5
    generic map(
      INIT => X"7F606E60"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => init_set_up,
      I3 => interface_lcd_interface_dataOUT(3),
      I4 => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_73
    );
  interface_lcd_interface_state_3_5_SW0 : LUT6
    generic map(
      INIT => X"44044000FFBFFBBB"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => N46,
      I4 => N45,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_7,
      O => N69
    );
  interface_lcd_interface_state_3_5_SW1 : LUT6
    generic map(
      INIT => X"04440040BFFFBBFB"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => N47,
      I4 => N45,
      I5 => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_7,
      O => N70
    );
  interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_lut : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => interface_lcd_clk_enable_unit_clk_enable_47,
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => cu_curr_state_FSM_FFd3_272,
      O => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_lut_703
    );
  interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_cy : MUXCY
    port map (
      CI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332,
      DI => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_lut_1_Q,
      S => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT111_lut_703,
      O => interface_lcd_interface_Mmux_dataOUT_7_dataOUT_7_mux_5_OUT11
    );
  interface_lcd_translate_int_data_out_2_18_SW0 : MUXF7
    port map (
      I0 => N104,
      I1 => N105,
      S => interface_lcd_translate_int_data_out_2_16_577,
      O => N65
    );
  interface_lcd_translate_int_data_out_2_18_SW0_F : LUT5
    generic map(
      INIT => X"70F850FA"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => N29,
      I3 => N28,
      I4 => interface_lcd_translate_int_data_out_2_5_573,
      O => N104
    );
  interface_lcd_translate_int_data_out_2_18_SW0_G : LUT6
    generic map(
      INIT => X"F0F050FA70F850FA"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(0),
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => N29,
      I3 => N28,
      I4 => interface_lcd_translate_int_data_out_2_5_573,
      I5 => interface_lcd_translate_int_data_out_2_13,
      O => N105
    );
  interface_lcd_interface_state_FSM_FFd4_In3 : MUXF7
    port map (
      I0 => N106,
      I1 => N107,
      S => interface_lcd_interface_state_FSM_FFd4_In1_604,
      O => interface_lcd_interface_state_FSM_FFd4_In
    );
  interface_lcd_interface_state_FSM_FFd4_In3_F : LUT6
    generic map(
      INIT => X"0042020015570200"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd3_347,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => init_set_up,
      O => N106
    );
  interface_lcd_interface_state_FSM_FFd4_In3_G : LUT6
    generic map(
      INIT => X"0111511B555F5555"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => init_set_up,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      I4 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I5 => interface_lcd_interface_state_FSM_FFd4_348,
      O => N107
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32 : MUXF7
    port map (
      I0 => N108,
      I1 => N109,
      S => interface_lcd_interface_Mcompar_GND_5_o_init_count_31_LessThan_1_o_cy_6_Q_332,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o31
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32_F : LUT6
    generic map(
      INIT => X"45514511CDD1CD13"
    )
    port map (
      I0 => init_set_up,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_clk_enable_unit_clk_enable_47,
      O => N108
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_96_o32_G : LUT5
    generic map(
      INIT => X"ABB1AB15"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => init_set_up,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      O => N109
    );
  interface_tmp_sensor_state_FSM_FFd4_In4 : MUXF7
    port map (
      I0 => N110,
      I1 => N111,
      S => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_FSM_FFd4_In5_526
    );
  interface_tmp_sensor_state_FSM_FFd4_In4_F : LUT6
    generic map(
      INIT => X"0F5F0F0F04550404"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT11,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I4 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I5 => interface_tmp_sensor_state_FSM_FFd4_In2_525,
      O => N110
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124 : MUXF7
    port map (
      I0 => N112,
      I1 => N113,
      S => interface_tmp_sensor_cnt(5),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124_544
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124_F : LUT5
    generic map(
      INIT => X"5F4F5F40"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12221,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122_543,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      O => N112
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT124_G : LUT6
    generic map(
      INIT => X"15FF15FF15FF1515"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_cnt(0),
      I2 => interface_tmp_sensor_cnt(3),
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122_543,
      O => N113
    );
  interface_tmp_sensor_state_FSM_FFd3_In5 : MUXF7
    port map (
      I0 => N114,
      I1 => N115,
      S => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_state_FSM_FFd3_In
    );
  interface_tmp_sensor_state_FSM_FFd3_In5_F : LUT6
    generic map(
      INIT => X"22EC22A822EC2220"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd4_In61,
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_state_FSM_FFd3_In3_257,
      I5 => interface_tmp_sensor_state_FSM_FFd3_In43_228,
      O => N114
    );
  interface_tmp_sensor_state_FSM_FFd3_In5_G : LUT5
    generic map(
      INIT => X"54444444"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd3_In5_511,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd3_In43_228,
      O => N115
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT41_SW0 : LUT6
    generic map(
      INIT => X"8880AAAADDD5FFFF"
    )
    port map (
      I0 => init_set_up,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_dataOUT(3),
      O => N55
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_661_SW0 : LUT3
    generic map(
      INIT => X"64"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(1),
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(0),
      O => N116
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_661 : LUT6
    generic map(
      INIT => X"101010101010BA10"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => init_set_up,
      I2 => interface_lcd_interface_dataOUT(6),
      I3 => interface_lcd_interface_state(0),
      I4 => N116,
      I5 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_66
    );
  interface_lcd_interface_state_3_13 : LUT6
    generic map(
      INIT => X"FFFFEAEB01554041"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_dataOUT(1),
      O => interface_lcd_interface_state_3_12
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_651 : LUT5
    generic map(
      INIT => X"A2F7A2A2"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => interface_lcd_interface_GND_5_o_GND_5_o_select_28_OUT(5),
      I3 => init_set_up,
      I4 => interface_lcd_interface_dataOUT(5),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_65
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_671 : LUT5
    generic map(
      INIT => X"80D58080"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      I2 => interface_lcd_interface_state(0),
      I3 => init_set_up,
      I4 => interface_lcd_interface_dataOUT(7),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_67
    );
  interface_tmp_sensor_state_FSM_FFd3_In3_SW0 : LUT5
    generic map(
      INIT => X"AAAA0020"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_wr(3),
      I1 => interface_tmp_sensor_search_time_203,
      I2 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I3 => interface_tmp_sensor_write_flag_FSM_FFd2_In111,
      I4 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      O => N118
    );
  interface_tmp_sensor_state_FSM_FFd3_In3 : LUT6
    generic map(
      INIT => X"FF8AAA8AAA8AAA8A"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd3_In11,
      I2 => interface_tmp_sensor_get_temp_cnt(3),
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      I5 => N118,
      O => interface_tmp_sensor_state_FSM_FFd3_In5_511
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_641 : LUT5
    generic map(
      INIT => X"A2F7A2A2"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_state(0),
      I2 => N120,
      I3 => init_set_up,
      I4 => interface_lcd_interface_dataOUT(4),
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_64
    );
  comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_4_Q : LUT3
    generic map(
      INIT => X"8E"
    )
    port map (
      I0 => comparison_block_comp_Mcompar_a_8_b_8_LessThan_1_o_cy_3_Q_392,
      I1 => comparison_block_b_io(8),
      I2 => comparison_block_curr_tmp_reg_data(8),
      O => comparison_block_comp_a_8_b_8_LessThan_1_o
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd1_In3_SW0 : LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      I1 => interface_tmp_sensor_cnt(1),
      I2 => interface_tmp_sensor_cnt(4),
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_In2,
      I4 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => N122
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd1_In3 : LUT6
    generic map(
      INIT => X"20222222FF222222"
    )
    port map (
      I0 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28111,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      I5 => N122,
      O => interface_tmp_sensor_write_high_cnt_FSM_FFd1_In
    );
  interface_tmp_sensor_n0535_inv1 : LUT6
    generic map(
      INIT => X"0000800000000000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      I5 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_n0535_inv
    );
  interface_tmp_sensor_n0452_inv1 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_n0452_inv
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT402_SW0 : LUT6
    generic map(
      INIT => X"F7FF7777F7FFF7FF"
    )
    port map (
      I0 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249,
      I1 => interface_tmp_sensor_state_FSM_FFd2_In4_248,
      I2 => interface_tmp_sensor_detect_done_202,
      I3 => interface_tmp_sensor_state_FSM_FFd2_In2_240,
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT3711,
      O => N124
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT402 : LUT6
    generic map(
      INIT => X"8888288888888888"
    )
    port map (
      I0 => N124,
      I1 => interface_tmp_sensor_cnt(9),
      I2 => interface_tmp_sensor_cnt(7),
      I3 => interface_tmp_sensor_cnt(6),
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272,
      I5 => interface_tmp_sensor_cnt(8),
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_9_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511_SW1 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I2 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      O => N126
    );
  interface_tmp_sensor_n0499_inv_SW1 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => N128
    );
  interface_tmp_sensor_n0499_inv : LUT6
    generic map(
      INIT => X"0101010101110110"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => N128,
      I2 => interface_tmp_sensor_get_temp_cnt(3),
      I3 => interface_tmp_sensor_get_temp_cnt(1),
      I4 => interface_tmp_sensor_get_temp_cnt(0),
      I5 => interface_tmp_sensor_get_temp_cnt(2),
      O => interface_tmp_sensor_n0499_inv_157
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT281 : LUT5
    generic map(
      INIT => X"FFFFFF2F"
    )
    port map (
      I0 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I1 => interface_tmp_sensor_write_low_cnt_FSM_FFd1_152,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT28
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT37111 : LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(6),
      I1 => interface_tmp_sensor_cnt(7),
      I2 => interface_tmp_sensor_cnt(8),
      I3 => interface_tmp_sensor_cnt(4),
      I4 => interface_tmp_sensor_cnt(5),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT3711
    );
  interface_tmp_sensor_state_FSM_FFd4_In611 : LUT6
    generic map(
      INIT => X"00010101FFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(8),
      I1 => interface_tmp_sensor_cnt(6),
      I2 => interface_tmp_sensor_cnt(7),
      I3 => interface_tmp_sensor_cnt(5),
      I4 => interface_tmp_sensor_cnt(4),
      I5 => interface_tmp_sensor_cnt(9),
      O => interface_tmp_sensor_state_FSM_FFd4_In61
    );
  interface_tmp_sensor_state_FSM_FFd2_In21 : LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(8),
      I1 => interface_tmp_sensor_cnt(3),
      I2 => interface_tmp_sensor_cnt(6),
      I3 => interface_tmp_sensor_cnt(5),
      I4 => interface_tmp_sensor_cnt(4),
      I5 => interface_tmp_sensor_cnt(7),
      O => interface_tmp_sensor_state_FSM_FFd2_In2_240
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1131 : LUT6
    generic map(
      INIT => X"0100000000000000"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(9),
      I1 => interface_tmp_sensor_cnt(7),
      I2 => interface_tmp_sensor_cnt(8),
      I3 => interface_tmp_sensor_cnt(0),
      I4 => interface_tmp_sensor_cnt(3),
      I5 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1211 : LUT3
    generic map(
      INIT => X"D5"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd3_127,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121_249
    );
  interface_lcd_translate_int_data_out_1_6 : LUT6
    generic map(
      INIT => X"0080008000800000"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => interface_lcd_translate_int_counter_select_cnt(1),
      I2 => interface_lcd_interface_enable_translator_48,
      I3 => interface_lcd_translate_int_counter_select_cnt(2),
      I4 => cu_curr_state_FSM_FFd3_272,
      I5 => cu_curr_state_FSM_FFd2_273,
      O => interface_lcd_translate_int_data_out_1_5_561
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT122211 : LUT6
    generic map(
      INIT => X"80FF8080FFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd1_146,
      I4 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I5 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12221
    );
  interface_lcd_interface_dataOUT_7_GND_5_o_mux_14_OUT_2_1 : LUT4
    generic map(
      INIT => X"AAAB"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT(2),
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd1_274,
      O => interface_lcd_interface_dataOUT_7_GND_5_o_mux_14_OUT_2_Q
    );
  interface_tmp_sensor_nrst_inv1 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => reset_IBUF_0,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      O => interface_tmp_sensor_nrst_inv
    );
  interface_tmp_sensor_n0531_inv1 : LUT6
    generic map(
      INIT => X"0100000000000000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd3_In11,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_get_temp_cnt(3),
      I5 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => interface_tmp_sensor_n0531_inv
    );
  reset_top1 : LUT4
    generic map(
      INIT => X"FF04"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd2_273,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => reset_IBUF_0,
      O => reset_top
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o25 : LUT4
    generic map(
      INIT => X"AA81"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd3_347,
      I2 => interface_lcd_interface_state_FSM_FFd4_348,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o24_592
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT91 : LUT6
    generic map(
      INIT => X"2000000020080008"
    )
    port map (
      I0 => cu_enable_wd,
      I1 => cu_watch_dog_cnt(8),
      I2 => cu_watch_dog_cnt(6),
      I3 => cu_watch_dog_cnt(7),
      I4 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_Q,
      I5 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1,
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_8_Q
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT121 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(2),
      I1 => interface_tmp_sensor_cnt(0),
      I2 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT12
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT71 : LUT6
    generic map(
      INIT => X"0202020A20202020"
    )
    port map (
      I0 => cu_enable_wd,
      I1 => cu_watch_dog_cnt(8),
      I2 => cu_watch_dog_cnt(6),
      I3 => cu_watch_dog_cnt(7),
      I4 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1,
      I5 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_Q,
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_6_Q
    );
  interface_tmp_sensor_Mcount_cnt_add_xor_2_11 : LUT6
    generic map(
      INIT => X"00A2A200A200A200"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd4_In3,
      I3 => interface_tmp_sensor_cnt_add(2),
      I4 => interface_tmp_sensor_cnt_add(0),
      I5 => interface_tmp_sensor_cnt_add(1),
      O => interface_tmp_sensor_Mcount_cnt_add2
    );
  interface_tmp_sensor_cnt_rd_FSM_FFd1_In111 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_cnt_rd_FSM_FFd1_In11
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT11 : LUT6
    generic map(
      INIT => X"0000000222222222"
    )
    port map (
      I0 => cu_enable_wd,
      I1 => cu_watch_dog_cnt(0),
      I2 => cu_watch_dog_cnt(6),
      I3 => cu_watch_dog_cnt(7),
      I4 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1,
      I5 => cu_watch_dog_cnt(8),
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_0_Q
    );
  interface_lcd_translate_int_reset_i1 : LUT4
    generic map(
      INIT => X"57FF"
    )
    port map (
      I0 => interface_lcd_interface_enable_translator_48,
      I1 => cu_curr_state_FSM_FFd2_273,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd1_274,
      O => interface_lcd_translate_int_reset_i
    );
  comparison_block_enable_reg_out1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_in_out_val_5,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd2_273,
      O => comparison_block_enable_reg_out
    );
  comparison_block_enable_reg1 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => cu_in_out_val_5,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd1_274,
      O => comparison_block_enable_reg
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_137_OUT71 : LUT5
    generic map(
      INIT => X"FF155515"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_cnt_add(3),
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_6_Q
    );
  interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT12 : LUT4
    generic map(
      INIT => X"1115"
    )
    port map (
      I0 => interface_tmp_sensor_get_temp_cnt(0),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(1),
      I3 => interface_tmp_sensor_get_temp_cnt(2),
      O => interface_tmp_sensor_GND_35_o_GND_35_o_select_108_OUT(0)
    );
  interface_tmp_sensor_Mmux_dataout_1_datatemp_MUX_1131_o11 : LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
    port map (
      I0 => interface_tmp_sensor_dataout(1),
      I1 => interface_tmp_sensor_get_temp_cnt(3),
      I2 => interface_tmp_sensor_get_temp_cnt(2),
      I3 => interface_tmp_sensor_get_temp_cnt(0),
      I4 => interface_tmp_sensor_get_temp_cnt(1),
      I5 => interface_tmp_sensor_datatemp_201,
      O => interface_tmp_sensor_dataout_1_datatemp_MUX_1131_o
    );
  comparison_block_mux_4_Mmux_y11 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(0),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(0),
      O => comparison_block_data_in_min_outd(0)
    );
  comparison_block_mux_4_Mmux_y21 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(1),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(1),
      O => comparison_block_data_in_min_outd(1)
    );
  comparison_block_mux_4_Mmux_y31 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(2),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(2),
      O => comparison_block_data_in_min_outd(2)
    );
  comparison_block_mux_4_Mmux_y41 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(3),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(3),
      O => comparison_block_data_in_min_outd(3)
    );
  comparison_block_mux_4_Mmux_y51 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(4),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(4),
      O => comparison_block_data_in_min_outd(4)
    );
  comparison_block_mux_4_Mmux_y61 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(5),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(5),
      O => comparison_block_data_in_min_outd(5)
    );
  comparison_block_mux_4_Mmux_y71 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(6),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(6),
      O => comparison_block_data_in_min_outd(6)
    );
  comparison_block_mux_4_Mmux_y81 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(7),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(7),
      O => comparison_block_data_in_min_outd(7)
    );
  comparison_block_mux_4_Mmux_y91 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_out_data(8),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(8),
      O => comparison_block_data_in_min_outd(8)
    );
  comparison_block_mux_7_Mmux_y11 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(0),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(0),
      O => comparison_block_data_in_min_ind(0)
    );
  comparison_block_mux_7_Mmux_y21 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(1),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(1),
      O => comparison_block_data_in_min_ind(1)
    );
  comparison_block_mux_7_Mmux_y31 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(2),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(2),
      O => comparison_block_data_in_min_ind(2)
    );
  comparison_block_mux_7_Mmux_y41 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(3),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(3),
      O => comparison_block_data_in_min_ind(3)
    );
  comparison_block_mux_7_Mmux_y51 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(4),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(4),
      O => comparison_block_data_in_min_ind(4)
    );
  comparison_block_mux_7_Mmux_y61 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(5),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(5),
      O => comparison_block_data_in_min_ind(5)
    );
  comparison_block_mux_7_Mmux_y71 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(6),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(6),
      O => comparison_block_data_in_min_ind(6)
    );
  comparison_block_mux_7_Mmux_y81 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(7),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(7),
      O => comparison_block_data_in_min_ind(7)
    );
  comparison_block_mux_7_Mmux_y91 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_min_tmp_reg_ind_data(8),
      I1 => comparison_block_state_count_cnt_491,
      I2 => comparison_block_comp_res_452,
      I3 => comparison_block_curr_tmp_reg_data(8),
      O => comparison_block_data_in_min_ind(8)
    );
  comparison_block_mux_6_Mmux_y11 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(0),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(0),
      O => comparison_block_data_in_max_ind(0)
    );
  comparison_block_mux_6_Mmux_y21 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(1),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(1),
      O => comparison_block_data_in_max_ind(1)
    );
  comparison_block_mux_6_Mmux_y31 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(2),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(2),
      O => comparison_block_data_in_max_ind(2)
    );
  comparison_block_mux_6_Mmux_y41 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(3),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(3),
      O => comparison_block_data_in_max_ind(3)
    );
  comparison_block_mux_6_Mmux_y51 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(4),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(4),
      O => comparison_block_data_in_max_ind(4)
    );
  comparison_block_mux_6_Mmux_y61 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(5),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(5),
      O => comparison_block_data_in_max_ind(5)
    );
  comparison_block_mux_6_Mmux_y71 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(6),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(6),
      O => comparison_block_data_in_max_ind(6)
    );
  comparison_block_mux_6_Mmux_y81 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(7),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(7),
      O => comparison_block_data_in_max_ind(7)
    );
  comparison_block_mux_6_Mmux_y91 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_ind_data(8),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(8),
      O => comparison_block_data_in_max_ind(8)
    );
  comparison_block_mux_5_Mmux_y11 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(0),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(0),
      O => comparison_block_data_in_max_outd(0)
    );
  comparison_block_mux_5_Mmux_y21 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(1),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(1),
      O => comparison_block_data_in_max_outd(1)
    );
  comparison_block_mux_5_Mmux_y31 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(2),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(2),
      O => comparison_block_data_in_max_outd(2)
    );
  comparison_block_mux_5_Mmux_y41 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(3),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(3),
      O => comparison_block_data_in_max_outd(3)
    );
  comparison_block_mux_5_Mmux_y51 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(4),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(4),
      O => comparison_block_data_in_max_outd(4)
    );
  comparison_block_mux_5_Mmux_y61 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(5),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(5),
      O => comparison_block_data_in_max_outd(5)
    );
  comparison_block_mux_5_Mmux_y71 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(6),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(6),
      O => comparison_block_data_in_max_outd(6)
    );
  comparison_block_mux_5_Mmux_y81 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(7),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(7),
      O => comparison_block_data_in_max_outd(7)
    );
  comparison_block_mux_5_Mmux_y91 : LUT4
    generic map(
      INIT => X"AEA2"
    )
    port map (
      I0 => comparison_block_max_tmp_reg_out_data(8),
      I1 => comparison_block_comp_res_452,
      I2 => comparison_block_state_count_cnt_491,
      I3 => comparison_block_curr_tmp_reg_data(8),
      O => comparison_block_data_in_max_outd(8)
    );
  comparison_block_state_count_Mmux_tc_cnt_MUX_1144_o11 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => comparison_block_state_count_cnt_491,
      O => comparison_block_state_count_tc_cnt_MUX_1144_o
    );
  comparison_block_state_count_Mmux_cnt_cnt_MUX_1146_o11 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => comparison_block_state_count_cnt_491,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => cu_curr_state_FSM_FFd2_273,
      O => comparison_block_state_count_cnt_cnt_MUX_1146_o
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_01 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(0),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_0
    );
  interface_lcd_translate_int_data_out_1_15_SW2 : LUT6
    generic map(
      INIT => X"FFFFFD5502AA0000"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd4_348,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd1_345,
      I4 => interface_lcd_interface_state_3_12,
      I5 => interface_lcd_interface_state_3_1_582,
      O => N49
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT24_SW0 : LUT6
    generic map(
      INIT => X"2A2A2A2A002A2A2A"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT113,
      I4 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511_237,
      I5 => interface_tmp_sensor_cnt(2),
      O => N10
    );
  interface_tmp_sensor_state_FSM_FFd3_In31 : LUT6
    generic map(
      INIT => X"00101010FFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(2),
      I1 => interface_tmp_sensor_nrst_state_3_AND_59_o121,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT116,
      I3 => interface_tmp_sensor_cnt(0),
      I4 => interface_tmp_sensor_cnt(1),
      I5 => interface_tmp_sensor_cnt(9),
      O => interface_tmp_sensor_state_FSM_FFd3_In3_257
    );
  interface_tmp_sensor_write_low_cnt_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
    port map (
      I0 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I1 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11_225,
      I2 => interface_tmp_sensor_cnt(4),
      I3 => interface_tmp_sensor_cnt(5),
      I4 => interface_tmp_sensor_cnt(1),
      I5 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_write_low_cnt_FSM_FFd2_In1_522
    );
  interface_tmp_sensor_state_FSM_FFd4_In8 : LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAA8A"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(9),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_state_FSM_FFd3_In2,
      I3 => interface_tmp_sensor_cnt(2),
      I4 => interface_tmp_sensor_state_FSM_FFd4_In8_529,
      I5 => interface_tmp_sensor_cnt(4),
      O => interface_tmp_sensor_state_FSM_FFd4_In9_530
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT11_SW0 : LUT6
    generic map(
      INIT => X"44405555777F5555"
    )
    port map (
      I0 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_10_OUT_0_Q,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd2_346,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_dataOUT_7_GND_5_o_mux_12_OUT_0_Q,
      O => N45
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_131 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(13),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_13
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_121 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(12),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_12
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_111 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(11),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_11_90
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_101 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(10),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_10
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_91 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(9),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_9
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_81 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(8),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_8
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_71 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(7),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_7
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_61 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(6),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_6
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_51 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(5),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_5
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_41 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(4),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_4
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_31 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(3),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_3
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_21 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(2),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_2
    );
  interface_lcd_clk_enable_unit_Mcount_count_eqn_11 : LUT6
    generic map(
      INIT => X"AA2AAAAAAAAAAAAA"
    )
    port map (
      I0 => Result(1),
      I1 => interface_lcd_clk_enable_unit_n0012_13_1_502,
      I2 => interface_lcd_clk_enable_unit_count(2),
      I3 => interface_lcd_clk_enable_unit_count(10),
      I4 => interface_lcd_clk_enable_unit_n0012_0(13),
      I5 => interface_lcd_clk_enable_unit_count(4),
      O => interface_lcd_clk_enable_unit_Mcount_count_eqn_1
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT12 : LUT5
    generic map(
      INIT => X"DDFD1101"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(0),
      I1 => interface_lcd_interface_writing_counter(2),
      I2 => interface_lcd_interface_writing_counter(3),
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter_31_GND_5_o_add_49_OUT_0_Q,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT11_579
    );
  interface_lcd_interface_n0419_inv1 : LUT5
    generic map(
      INIT => X"10040404"
    )
    port map (
      I0 => reset_top,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_n0419_inv
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o24 : LUT5
    generic map(
      INIT => X"54154415"
    )
    port map (
      I0 => init_set_up,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd1_345,
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_Mux_98_o23_591
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_Mux_136_o11 : LUT5
    generic map(
      INIT => X"C4D44454"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd4_In61,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_3_X_12_o_Mux_136_o
    );
  interface_lcd_interface_state_3_5_SW2 : LUT5
    generic map(
      INIT => X"222AFFFF"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd1_345,
      I2 => interface_lcd_interface_state_FSM_FFd2_346,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_state_3_8,
      O => N71
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT21 : LUT5
    generic map(
      INIT => X"00010100"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o,
      I3 => cu_watch_dog_cnt(0),
      I4 => cu_watch_dog_cnt(1),
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_1_Q
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT31 : LUT6
    generic map(
      INIT => X"0001010001000100"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o,
      I3 => cu_watch_dog_cnt(2),
      I4 => cu_watch_dog_cnt(0),
      I5 => cu_watch_dog_cnt(1),
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_2_Q
    );
  interface_lcd_interface_state_FSM_FFd2_In_SW0 : LUT5
    generic map(
      INIT => X"FFFE5554"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd2_346,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      I3 => cu_curr_state_FSM_FFd1_274,
      I4 => interface_lcd_interface_GND_5_o_writing_counter_31_equal_56_o,
      O => N24
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_5_f7_6_SW0 : LUT6
    generic map(
      INIT => X"0000008080808080"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_3_71,
      I2 => interface_lcd_interface_dataOUT(7),
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_state_FSM_FFd2_346,
      I5 => interface_lcd_interface_state_FSM_FFd1_345,
      O => N63
    );
  interface_tmp_sensor_state_FSM_FFd4_In4_G : LUT6
    generic map(
      INIT => X"5515555544044444"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_GND_35_o_cnt_9_equal_124_o,
      I3 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I4 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I5 => interface_tmp_sensor_Mmux_GND_35_o_GND_35_o_select_108_OUT11,
      O => N111
    );
  interface_tmp_sensor_state_FSM_FFd2_In2_SW0 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_In2_240,
      I1 => interface_tmp_sensor_detect_done_202,
      O => N130
    );
  interface_tmp_sensor_state_FSM_FFd2_In2 : LUT6
    generic map(
      INIT => X"0020002002200020"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_state_FSM_FFd2_126,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_cnt(9),
      I5 => N130,
      O => interface_tmp_sensor_state_FSM_FFd2_In3_514
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT5 : LUT6
    generic map(
      INIT => X"1444444444444444"
    )
    port map (
      I0 => N132,
      I1 => cu_watch_dog_cnt(4),
      I2 => cu_watch_dog_cnt(1),
      I3 => cu_watch_dog_cnt(2),
      I4 => cu_watch_dog_cnt(3),
      I5 => cu_watch_dog_cnt(0),
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_4_Q
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT21_SW0_SW0 : LUT6
    generic map(
      INIT => X"F9FFFFFFFFFFFFFF"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(0),
      I1 => interface_lcd_interface_writing_counter(3),
      I2 => interface_lcd_interface_writing_counter(2),
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_state_3_9,
      O => N134
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT21_SW0 : LUT6
    generic map(
      INIT => X"BBBBBBBA11111110"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_dataOUT(1),
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => cu_curr_state_FSM_FFd2_273,
      I4 => cu_curr_state_FSM_FFd3_272,
      I5 => N134,
      O => N52
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT21_SW1_SW0 : LUT6
    generic map(
      INIT => X"BFEA000000000000"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => interface_lcd_interface_writing_counter(1),
      I3 => interface_lcd_interface_writing_counter(3),
      I4 => interface_lcd_interface_state_FSM_FFd4_348,
      I5 => interface_lcd_interface_state_3_9,
      O => N136
    );
  interface_lcd_interface_Mmux_GND_5_o_GND_5_o_select_28_OUT21_SW1 : LUT6
    generic map(
      INIT => X"11111110BBBBBBBA"
    )
    port map (
      I0 => interface_lcd_interface_state(1),
      I1 => interface_lcd_interface_dataOUT(1),
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => cu_curr_state_FSM_FFd2_273,
      I4 => cu_curr_state_FSM_FFd3_272,
      I5 => N136,
      O => N53
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT361_SW0 : LUT5
    generic map(
      INIT => X"FFDFDFDF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_cnt(9),
      I3 => interface_tmp_sensor_detect_done_202,
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => N138
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT361 : LUT6
    generic map(
      INIT => X"E0E0E0E00EE0E0E0"
    )
    port map (
      I0 => N138,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_cnt(8),
      I3 => interface_tmp_sensor_cnt(7),
      I4 => interface_tmp_sensor_cnt(6),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_133_OUT_8_Q
    );
  interface_tmp_sensor_n0590_inv3 : LUT6
    generic map(
      INIT => X"5151515100005100"
    )
    port map (
      I0 => reset_IBUF_0,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => interface_tmp_sensor_n0590_inv2_547,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      I5 => interface_tmp_sensor_n0527_inv1_260,
      O => interface_tmp_sensor_n0590_inv
    );
  interface_lcd_interface_reset_inv1 : LUT4
    generic map(
      INIT => X"5551"
    )
    port map (
      I0 => reset_IBUF_0,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => cu_curr_state_FSM_FFd2_273,
      O => interface_lcd_interface_reset_inv
    );
  interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_1_1 : LUT5
    generic map(
      INIT => X"4544CDCC"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd1_125,
      I2 => interface_tmp_sensor_cnt_add(3),
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_3_X_12_o_wide_mux_137_OUT_1_Q
    );
  interface_tmp_sensor_state_state_0_1 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_0_inv_inv
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT19311 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(2),
      I1 => interface_tmp_sensor_cnt(3),
      I2 => interface_tmp_sensor_cnt(0),
      I3 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1931
    );
  interface_tmp_sensor_n0647_inv3 : LUT4
    generic map(
      INIT => X"5100"
    )
    port map (
      I0 => reset_IBUF_0,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd1_274,
      I3 => interface_tmp_sensor_n0647_inv2_546,
      O => interface_tmp_sensor_n0647_inv
    );
  interface_tmp_sensor_nrst_state_3_AND_59_o4 : LUT6
    generic map(
      INIT => X"4545004545450000"
    )
    port map (
      I0 => reset_IBUF_0,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_curr_state_FSM_FFd3_272,
      I3 => interface_tmp_sensor_state_FSM_FFd2_126,
      I4 => interface_tmp_sensor_nrst_state_3_AND_59_o1_508,
      I5 => interface_tmp_sensor_nrst_state_3_AND_59_o3_510,
      O => interface_tmp_sensor_nrst_state_3_AND_59_o
    );
  interface_lcd_interface_state_3_221 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_writing_counter(2),
      O => interface_lcd_interface_state_3_22_308
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT251 : LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd1_345,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd3_347,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT13
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT1361 : LUT5
    generic map(
      INIT => X"01000000"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd4_348,
      I3 => interface_lcd_interface_state_FSM_FFd3_347,
      I4 => interface_lcd_interface_state_FSM_FFd1_345,
      O => interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT136
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_101_OUT28_SW0 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => interface_lcd_interface_state_FSM_FFd3_347,
      I1 => interface_lcd_interface_state_FSM_FFd2_346,
      I2 => interface_lcd_interface_state_FSM_FFd4_348,
      I3 => interface_lcd_interface_state_FSM_FFd1_345,
      O => N18
    );
  interface_lcd_enable1 : LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd1_274,
      I1 => cu_curr_state_FSM_FFd3_272,
      I2 => cu_curr_state_FSM_FFd2_273,
      O => lcd_enable_OBUF_20
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT201 : LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(2),
      I2 => interface_tmp_sensor_cnt(0),
      I3 => interface_tmp_sensor_cnt(1),
      I4 => interface_tmp_sensor_cnt(3),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT20
    );
  interface_lcd_interface_Mmux_state_3_X_5_o_wide_mux_95_OUT_641_SW0 : LUT6
    generic map(
      INIT => X"4E004E4E4EFF4E00"
    )
    port map (
      I0 => interface_lcd_translate_int_counter_select_cnt(1),
      I1 => interface_lcd_translate_int_counter_select_cnt(0),
      I2 => interface_lcd_translate_int_counter_select_cnt(2),
      I3 => interface_lcd_interface_writing_counter(2),
      I4 => interface_lcd_interface_writing_counter(1),
      I5 => interface_lcd_interface_writing_counter(3),
      O => N120
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511 : LUT6
    generic map(
      INIT => X"0000000800080008"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(1),
      I2 => interface_tmp_sensor_cnt(6),
      I3 => N126,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      I5 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT1511_237
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT162 : LUT6
    generic map(
      INIT => X"AAAA0888AAAAFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_state_FSM_FFd1_125,
      I4 => interface_tmp_sensor_cnt(1),
      I5 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT15121,
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT161_537
    );
  interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT2721 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(4),
      I1 => interface_tmp_sensor_cnt(5),
      I2 => interface_tmp_sensor_cnt(2),
      I3 => interface_tmp_sensor_cnt(3),
      I4 => interface_tmp_sensor_cnt(0),
      I5 => interface_tmp_sensor_cnt(1),
      O => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT272
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT81 : LUT6
    generic map(
      INIT => X"0001010001000100"
    )
    port map (
      I0 => cu_curr_state_FSM_FFd3_272,
      I1 => cu_curr_state_FSM_FFd1_274,
      I2 => cu_watch_dog_cnt(8),
      I3 => cu_watch_dog_cnt(7),
      I4 => cu_watch_dog_cnt(6),
      I5 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_cy_5_Q,
      O => cu_watch_dog_GND_55_o_cnt_9_mux_3_OUT_7_Q
    );
  interface_tmp_sensor_Mcount_cnt_add_xor_1_11 : LUT6
    generic map(
      INIT => X"00002AAA2AAA0000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_cnt_add(0),
      I5 => interface_tmp_sensor_cnt_add(1),
      O => interface_tmp_sensor_Mcount_cnt_add1
    );
  interface_tmp_sensor_Mcount_cnt_add_xor_0_11 : LUT5
    generic map(
      INIT => X"04444444"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_add(0),
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_Mcount_cnt_add
    );
  cu_watch_dog_Mmux_GND_55_o_cnt_9_mux_3_OUT5_SW1 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAAA8"
    )
    port map (
      I0 => cu_watch_dog_cnt(8),
      I1 => cu_watch_dog_cnt(6),
      I2 => cu_watch_dog_cnt(7),
      I3 => cu_watch_dog_GND_55_o_cnt_9_LessThan_1_o1,
      I4 => cu_curr_state_FSM_FFd1_274,
      I5 => cu_curr_state_FSM_FFd3_272,
      O => N132
    );
  interface_tmp_sensor_n0482_inv21 : LUT5
    generic map(
      INIT => X"00040404"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd3_127,
      I3 => interface_tmp_sensor_cnt_add(3),
      I4 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => interface_tmp_sensor_n0482_inv2
    );
  interface_tmp_sensor_n0647_inv2 : LUT6
    generic map(
      INIT => X"BD99BD89BD11BD01"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_state_FSM_FFd3_In3_257,
      I5 => interface_tmp_sensor_n0647_inv1_545,
      O => interface_tmp_sensor_n0647_inv2_546
    );
  interface_tmp_sensor_n0482_inv1 : LUT5
    generic map(
      INIT => X"08140C14"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_state_FSM_FFd4_128,
      I4 => interface_tmp_sensor_cnt_add(3),
      O => interface_tmp_sensor_n0482_inv
    );
  interface_tmp_sensor_write_flag_FSM_FFd2_In1 : LUT5
    generic map(
      INIT => X"AAAA3331"
    )
    port map (
      I0 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I1 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      I2 => interface_tmp_sensor_search_time_203,
      I3 => interface_tmp_sensor_write_flag_FSM_FFd2_In111,
      I4 => interface_tmp_sensor_write_flag_FSM_FFd1_In2,
      O => interface_tmp_sensor_write_flag_FSM_FFd2_In
    );
  cu_curr_state_FSM_FFd3_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_curr_state_FSM_FFd3_In,
      Q => cu_curr_state_FSM_FFd3_1_728
    );
  cu_curr_state_FSM_FFd2_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => reset_IBUF_0,
      D => cu_curr_state_FSM_FFd2_In,
      Q => cu_curr_state_FSM_FFd2_1_729
    );
  interface_lcd_clk_enable_unit_Mcount_count_lut_0_INV_0 : INV
    port map (
      I => interface_lcd_clk_enable_unit_count(0),
      O => interface_lcd_clk_enable_unit_Mcount_count_lut(0)
    );
  interface_lcd_interface_Mcount_init_count_lut_0_INV_0 : INV
    port map (
      I => interface_lcd_interface_init_count(0),
      O => interface_lcd_interface_Mcount_init_count_lut(0)
    );
  interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_lut_0_INV_0 : INV
    port map (
      I => interface_lcd_interface_writing_counter(0),
      O => interface_lcd_interface_Madd_writing_counter_31_GND_5_o_add_49_OUT_lut_0_Q
    );
  interface_tmp_sensor_state_3_clk_1us_DFF_94_inv1_INV_0 : INV
    port map (
      I => interface_tmp_sensor_state_3_clk_1us_DFF_94_200,
      O => interface_tmp_sensor_state_3_clk_1us_DFF_94_inv
    );
  cu_reset_inv1_INV_0 : INV
    port map (
      I => reset_IBUF_0,
      O => cu_reset_inv
    );
  interface_lcd_translate_int_counter_select_Mcount_cnt_xor_0_11_INV_0 : INV
    port map (
      I => interface_lcd_translate_int_counter_select_cnt(0),
      O => interface_lcd_translate_int_counter_select_Mcount_cnt
    );
  interface_tmp_sensor_Mmux_state_3_PWR_30_o_Mux_176_o13 : MUXF7
    port map (
      I0 => N140,
      I1 => N141,
      S => interface_tmp_sensor_state_FSM_FFd2_126,
      O => interface_tmp_sensor_state_3_PWR_30_o_Mux_176_o
    );
  interface_tmp_sensor_Mmux_state_3_PWR_30_o_Mux_176_o13_F : LUT5
    generic map(
      INIT => X"222ABBBB"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd1_125,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_cnt_rd_FSM_FFd2_143,
      I3 => interface_tmp_sensor_cnt_rd_FSM_FFd1_217,
      I4 => interface_tmp_sensor_state_FSM_FFd3_127,
      O => N140
    );
  interface_tmp_sensor_Mmux_state_3_PWR_30_o_Mux_176_o13_G : LUT5
    generic map(
      INIT => X"0145FFFF"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd3_127,
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_write_low_cnt_FSM_FFd2_153,
      I3 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      I4 => interface_tmp_sensor_state_FSM_FFd1_125,
      O => N141
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2 : MUXF7
    port map (
      I0 => N142,
      I1 => N143,
      S => interface_tmp_sensor_write_high_cnt_FSM_FFd2_147,
      O => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2_520
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2_F : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd1_125,
      I3 => interface_tmp_sensor_state_FSM_FFd3_127,
      I4 => interface_tmp_sensor_GND_35_o_cnt_9_equal_88_o,
      O => N142
    );
  interface_tmp_sensor_write_high_cnt_FSM_FFd2_In2_G : LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
    port map (
      I0 => interface_tmp_sensor_cnt(5),
      I1 => interface_tmp_sensor_state_FSM_FFd4_128,
      I2 => interface_tmp_sensor_cnt(4),
      I3 => interface_tmp_sensor_cnt(1),
      I4 => interface_tmp_sensor_write_high_cnt_FSM_FFd2_In11_225,
      O => N143
    );
  interface_tmp_sensor_state_FSM_FFd1_In3 : MUXF7
    port map (
      I0 => N144,
      I1 => N145,
      S => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_state_FSM_FFd1_In3_513
    );
  interface_tmp_sensor_state_FSM_FFd1_In3_F : LUT6
    generic map(
      INIT => X"FFFFAA08FFFFFFFF"
    )
    port map (
      I0 => interface_tmp_sensor_write_flag_FSM_FFd2_218,
      I1 => interface_tmp_sensor_search_time_203,
      I2 => interface_tmp_sensor_write_flag_FSM_FFd2_In111,
      I3 => interface_tmp_sensor_write_flag_FSM_FFd1_219,
      I4 => interface_tmp_sensor_state_FSM_FFd1_In1_512,
      I5 => interface_tmp_sensor_PWR_19_o_cnt_wr_3_equal_71_o,
      O => N144
    );
  interface_tmp_sensor_state_FSM_FFd1_In3_G : LUT6
    generic map(
      INIT => X"5555555555515555"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd2_126,
      I1 => interface_tmp_sensor_get_temp_cnt(1),
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      I3 => interface_tmp_sensor_get_temp_cnt(2),
      I4 => interface_tmp_sensor_get_temp_cnt(3),
      I5 => interface_tmp_sensor_get_temp_cnt(0),
      O => N145
    );
  interface_lcd_interface_state_3_62 : MUXF7
    port map (
      I0 => N146,
      I1 => N147,
      S => interface_lcd_interface_state(1),
      O => interface_lcd_interface_state_3_61
    );
  interface_lcd_interface_state_3_62_F : LUT6
    generic map(
      INIT => X"4000111144445555"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(2),
      I1 => interface_lcd_interface_writing_counter(1),
      I2 => interface_lcd_interface_state_3_9,
      I3 => interface_lcd_interface_state_FSM_FFd4_348,
      I4 => interface_lcd_interface_writing_counter(3),
      I5 => interface_lcd_interface_writing_counter(0),
      O => N146
    );
  interface_lcd_interface_state_3_62_G : LUT6
    generic map(
      INIT => X"FFFFFFFF01555555"
    )
    port map (
      I0 => interface_lcd_interface_writing_counter(3),
      I1 => interface_lcd_interface_writing_counter(0),
      I2 => cu_in_out_val_5,
      I3 => interface_lcd_interface_writing_counter(1),
      I4 => interface_lcd_interface_writing_counter(2),
      I5 => interface_lcd_interface_dataOUT(6),
      O => N147
    );
  interface_tmp_sensor_n0590_inv2 : MUXF7
    port map (
      I0 => N148,
      I1 => N149,
      S => interface_tmp_sensor_state_FSM_FFd3_127,
      O => interface_tmp_sensor_n0590_inv2_547
    );
  interface_tmp_sensor_n0590_inv2_F : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => interface_tmp_sensor_cnt_add(3),
      I1 => interface_tmp_sensor_state_FSM_FFd2_126,
      I2 => interface_tmp_sensor_state_FSM_FFd4_128,
      O => N148
    );
  interface_tmp_sensor_n0590_inv2_G : LUT6
    generic map(
      INIT => X"5555FBBBFFFFFBBB"
    )
    port map (
      I0 => interface_tmp_sensor_state_FSM_FFd4_128,
      I1 => N26,
      I2 => interface_tmp_sensor_Mmux_state_3_X_12_o_wide_mux_133_OUT3711,
      I3 => interface_tmp_sensor_cnt(9),
      I4 => interface_tmp_sensor_state_FSM_FFd2_126,
      I5 => interface_tmp_sensor_state_FSM_FFd4_In3,
      O => N149
    );
  interface_lcd_translate_int_data_out_0_6_SW1 : MUXF7
    port map (
      I0 => N150,
      I1 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => data_from_comparison(8),
      O => N43
    );
  interface_lcd_translate_int_data_out_0_6_SW1_F : LUT6
    generic map(
      INIT => X"C282C2A648C2CAC2"
    )
    port map (
      I0 => data_from_comparison(7),
      I1 => data_from_comparison(6),
      I2 => data_from_comparison(4),
      I3 => data_from_comparison(3),
      I4 => data_from_comparison(2),
      I5 => data_from_comparison(5),
      O => N150
    );
  interface_lcd_translate_int_data_out_0_6_SW0 : MUXF7
    port map (
      I0 => N152,
      I1 => cu_watch_dog_Madd_cnt_9_GND_55_o_add_1_OUT_lut_9_Q,
      S => data_from_comparison(8),
      O => N42
    );
  interface_lcd_translate_int_data_out_0_6_SW0_F : LUT6
    generic map(
      INIT => X"C86CC9EC77577F77"
    )
    port map (
      I0 => data_from_comparison(7),
      I1 => data_from_comparison(4),
      I2 => data_from_comparison(3),
      I3 => data_from_comparison(5),
      I4 => data_from_comparison(2),
      I5 => data_from_comparison(6),
      O => N152
    );

end Structure;

