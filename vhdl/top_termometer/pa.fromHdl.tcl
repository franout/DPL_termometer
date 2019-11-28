
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name top_termometer -dir "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/top_termometer/planAhead_run_2" -part xc7a100tlcsg324-2L
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top_termometer.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../interface_lcd/top_display/mux8_1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_lcd/top_display/counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_tmp_sensor/clock_enable.vhdl}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_lcd/top_display/translator.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_lcd/lcd.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_lcd/counter_clk_enable.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../control_unit/counter_wd.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/reg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/mux4_1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/mux.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/counter_comparison.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/comparator.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_tmp_sensor/temperature.vhdl}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../interface_lcd/top_display/top_display.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../control_unit/control_unit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../comparison/comparison.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top_termometer.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top top_termometer $srcset
add_files [list {top_termometer.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7a100tlcsg324-2L
