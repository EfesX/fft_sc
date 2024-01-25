set RTL_DIR ../../rtl
set SIM_DIR ..

vlog -work work $RTL_DIR/fft_pkg.sv
vlog -work work $RTL_DIR/*.sv

vlog -work work $SIM_DIR/tb_fft_sc.sv

vsim -t ns -novopt work.tb_fft_sc 

add wave -group tb          sim:/tb_fft_sc/*
add wave -group dut         sim:/tb_fft_sc/dut/*
add wave -group in_reord    sim:/tb_fft_sc/dut/in_reorder/*

add wave -group st1       {sim:/tb_fft_sc/dut/genblk1[0]/stage/*}
add wave -group st1_pe    {sim:/tb_fft_sc/dut/genblk1[0]/stage/genblk1/proc_elem/*}
add wave -group st1_rot   {sim:/tb_fft_sc/dut/genblk1[0]/stage/genblk1/proc_elem/genblk3/rotator/*}
add wave -group st1_reord {sim:/tb_fft_sc/dut/genblk1[0]/stage/genblk2/reorder/*}

run 3000
run 6000