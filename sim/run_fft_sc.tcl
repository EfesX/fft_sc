vlog -reportprogress 300 -work work E:/sandbox/fpga/fft/rtl/fft_pkg.sv
vlog -reportprogress 300 -work work E:/sandbox/fpga/fft/rtl/*.sv

vsim -t ns -novopt work.fft_sc 

add wave -group fft_sc      sim:/fft_sc/*
add wave -group reord_in    sim:/fft_sc/in_reorder/*

#add wave -group st1             sim:/fft_sc/stage_1/*
#add wave -group st1_pe          sim:/fft_sc/stage_1/proc_elem/*
#add wave -group st1_pe_butter   sim:/fft_sc/stage_1/proc_elem/genblk1/butterfly/*
#add wave -group st1_pe_rotator  sim:/fft_sc/stage_1/proc_elem/genblk3/rotator/*
#add wave -group st1_ro          sim:/fft_sc/stage_1/genblk1/reorder/*

#add wave -group st2             sim:/fft_sc/stage_2/*
#add wave -group st2_pe          sim:/fft_sc/stage_2/proc_elem/*
#add wave -group st2_pe_butter   sim:/fft_sc/stage_2/proc_elem/genblk1/butterfly/*
#add wave -group st2_pe_rotator  sim:/fft_sc/stage_2/proc_elem/genblk3/rotator/*
#add wave -group st2_ro          sim:/fft_sc/stage_2/genblk1/reorder/*

#add wave -group st3             sim:/fft_sc/stage_3/*
#add wave -group st3_pe          sim:/fft_sc/stage_3/proc_elem/*
#add wave -group st3_pe_butter   sim:/fft_sc/stage_3/proc_elem/genblk1/butterfly/*
#add wave -group st3_pe_rotator  sim:/fft_sc/stage_3/proc_elem/genblk3/rotator/*
#add wave -group st3_ro          sim:/fft_sc/stage_3/genblk1/reorder/*

#add wave -group st4             sim:/fft_sc/stage_4/*
#add wave -group st4_pe          sim:/fft_sc/stage_4/proc_elem/*
#add wave -group st4_pe_butter   sim:/fft_sc/stage_4/proc_elem/genblk1/butterfly/*

add wave -group st1 {sim:/fft_sc/genblk1[0]/stage/*}
add wave -group st2 {sim:/fft_sc/genblk1[1]/stage/*}
add wave -group st3 {sim:/fft_sc/genblk1[2]/stage/*}
add wave -group st4 {sim:/fft_sc/genblk1[3]/stage/*}
add wave -group st5 {sim:/fft_sc/genblk1[4]/stage/*}

add wave -group oro   sim:/fft_sc/out_reorder/*
add wave -group oro1 {sim:/fft_sc/out_reorder/genblk1[0]/GEN_FIRST_REORDER/reorder/*}
add wave -group oro2 {sim:/fft_sc/out_reorder/genblk1[1]/GEN_SECOND_REORDER/reorder/*}
add wave -group oro3 {sim:/fft_sc/out_reorder/genblk1[2]/GEN_ANOTHER_REORDERS/reorder/*}





force -freeze sim:/fft_sc/clk 1 0, 0 {2 ns} -r 5
force -freeze sim:/fft_sc/din_valid 0 0

run 100

force -freeze sim:/fft_sc/din_im 0000000000000000 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
force -freeze sim:/fft_sc/din_valid 1 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000001 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000010 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000011 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000100 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000101 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000110 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000000111 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001000 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001001 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001010 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001011 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001100 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001101 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001110 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000001111 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0

run 5
force -freeze sim:/fft_sc/din_im 0000000000010000 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010001 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010010 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010011 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010100 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010101 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010110 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000010111 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011000 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011001 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011010 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011011 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011100 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011101 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011110 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_im 0000000000011111 0
force -freeze sim:/fft_sc/din_re 0000000000000000 0
run 5
force -freeze sim:/fft_sc/din_valid 0 0




run 1000