
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P18_Cont0a59 -dir "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P18_Cont0a59/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P18_Cont0a59/Cont0a59.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P18_Cont0a59} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Cont0a59.ucf" [current_fileset -constrset]
add_files [list {Cont0a59.ucf}] -fileset [get_property constrset [current_run]]
link_design
