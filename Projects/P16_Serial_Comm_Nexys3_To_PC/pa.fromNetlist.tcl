
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P16_Serial_Comm_Nexys3_To_PC -dir "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P16_Serial_Comm_Nexys3_To_PC/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P16_Serial_Comm_Nexys3_To_PC/Serial_Comm_Nexys3_To_PC.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P16_Serial_Comm_Nexys3_To_PC} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Serial_Comm_Nexys3_To_PC.ucf" [current_fileset -constrset]
add_files [list {Serial_Comm_Nexys3_To_PC.ucf}] -fileset [get_property constrset [current_run]]
link_design
