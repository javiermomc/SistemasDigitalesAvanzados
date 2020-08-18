
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name P02_Basic_Gates -dir "D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P02_Basic_Gates/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Basic_Gates.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Basic_Gates.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Basic_Gates $srcset
add_files [list {Basic_Gates.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
