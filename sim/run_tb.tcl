# путь к установленному Quartus
set QUARTUS_INSTALL_DIR "C:/intelFPGA/18.0/quartus"

set RTL_DIR ../../rtl
set SIM_DIR ..

vlib lpm_ver

vlog -work fv_lib $QUARTUS_INSTALL_DIR/eda/fv_lib/verilog/lpm_mult.v
vlog -work lpm_ver $QUARTUS_INSTALL_DIR/eda/fv_lib/verilog/pipeline_internal_fv.v
vlog -work lpm_ver $QUARTUS_INSTALL_DIR/eda/fv_lib/verilog/addsub_block.v
vlog -work lpm_ver $QUARTUS_INSTALL_DIR/eda/fv_lib/verilog/mult_block.v

vlog -work lpm_ver $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v

vmap lpm_ver ./lpm_ver

vlog -work work $RTL_DIR/fft_pkg.sv
vlog -work work $RTL_DIR/*.sv

vlog -work work $SIM_DIR/tb_fft_sc.sv

vsim -t ns -novopt -L lpm_ver work.tb_fft_sc 

add wave -group tb          sim:/tb_fft_sc/*
add wave -group dut         sim:/tb_fft_sc/dut/*
add wave -group in_reord    sim:/tb_fft_sc/dut/in_reorder/*

add wave -group st1       {sim:/tb_fft_sc/dut/GEN_STAGES[0]/stage/*}
add wave -group st1_pe    {sim:/tb_fft_sc/dut/GEN_STAGES[0]/stage/genblk1/proc_elem/*}
add wave -group st1_rot   {sim:/tb_fft_sc/dut/GEN_STAGES[0]/stage/genblk1/proc_elem/genblk3/rotator/*}
add wave -group st1_reord {sim:/tb_fft_sc/dut/GEN_STAGES[0]/stage/genblk2/reorder/*}

add wave -group st2 {sim:/tb_fft_sc/dut/GEN_STAGES[1]/stage/*}
add wave -group st3 {sim:/tb_fft_sc/dut/GEN_STAGES[2]/stage/*}
add wave -group st4 {sim:/tb_fft_sc/dut/GEN_STAGES[3]/stage/*}

add wave -group twid sim:/tb_fft_sc/dut/twiddles_storage/*

run 3000
run 6000
run 60000
run 60000