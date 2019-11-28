
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name top_display -dir "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/planAhead_run_4" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display/top_display.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/interface_lcd/top_display} }
set_property target_constrs_file "top_display.ucf" [current_fileset -constrset]
add_files [list {top_display.ucf}] -fileset [get_property constrset [current_run]]
link_design
