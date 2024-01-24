vlog -reportprogress 300 -work work E:/sandbox/fpga/fft/rtl/ctrl_stage.sv
vsim -novopt work.ctrl_stage

add wave -position insertpoint sim:/ctrl_stage/*

force -freeze sim:/ctrl_stage/clk 1 0, 0 {2 ns} -r 5
force -freeze sim:/ctrl_stage/din_valid 0 0

run 100
force -freeze sim:/ctrl_stage/din_valid 1 0

run 100
force -freeze sim:/ctrl_stage/din_valid 0 0
run 100