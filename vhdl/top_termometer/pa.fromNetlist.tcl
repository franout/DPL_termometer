
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name top_termometer -dir "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/top_termometer/planAhead_run_3" -part xc7a100tlcsg324-2L
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/top_termometer/top_termometer.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/uni/2019-2020/CTH/Digital_project_laboratory/project/vhdl/top_termometer} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top_termometer.ucf" [current_fileset -constrset]
add_files [list {top_termometer.ucf}] -fileset [get_property constrset [current_run]]
link_design
