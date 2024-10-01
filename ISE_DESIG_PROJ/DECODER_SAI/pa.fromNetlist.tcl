
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name DECODER_SAI -dir "C:/Users/caio.madeira/Desktop/ISE_DESIG_PROJ/DECODER_SAI/planAhead_run_3" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/caio.madeira/Desktop/ISE_DESIG_PROJ/DECODER_SAI/decoder_sai.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/caio.madeira/Desktop/ISE_DESIG_PROJ/DECODER_SAI} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "decoder_sai.ucf" [current_fileset -constrset]
add_files [list {decoder_sai.ucf}] -fileset [get_property constrset [current_run]]
link_design
