onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider entradas
add wave -noupdate /tb/DUT/A
add wave -noupdate /tb/DUT/B
add wave -noupdate /tb/DUT/m
add wave -noupdate /tb/DUT/Cin
add wave -noupdate -divider saidas
add wave -noupdate /tb/DUT/Cout
add wave -noupdate /tb/DUT/Soma
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2041 ns}
