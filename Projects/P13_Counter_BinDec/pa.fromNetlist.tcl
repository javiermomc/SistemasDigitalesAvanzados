
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P13_Counter_BinDec -dir "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P13_Counter_BinDec/planAhead_run_4" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P13_Counter_BinDec/Counter_BinDec.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P13_Counter_BinDec} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Counter_BinDec.ucf" [current_fileset -constrset]
add_files [list {Counter_BinDec.ucf}] -fileset [get_property constrset [current_run]]
link_design
