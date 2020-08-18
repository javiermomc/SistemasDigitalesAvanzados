
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P03_Bin_7Seg_Decoder -dir "D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P03_Bin_7Seg_Decoder/planAhead_run_5" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P03_Bin_7Seg_Decoder/Bin_7Seg_Decoder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P03_Bin_7Seg_Decoder} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Bin_7Seg_Decoder.ucf" [current_fileset -constrset]
add_files [list {Bin_7Seg_Decoder.ucf}] -fileset [get_property constrset [current_run]]
link_design
