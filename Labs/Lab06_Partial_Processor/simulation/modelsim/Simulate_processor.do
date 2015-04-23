transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

# Compile design
vlog -vlog01compat -work work +incdir+../../ {../../PC.v}
vlog -vlog01compat -work work +incdir+../../ {../../JMP_addr.v}
vlog -vlog01compat -work work +incdir+../../ {../../IR.v}
vlog -vlog01compat -work work +incdir+../../ {../../control.v}
vlog -vlog01compat -work work +incdir+../../ {../../inst_mem.v}
vlog -vlog01compat -work work +incdir+../../ {../../data_mem.v}
vlog -vlog01compat -work work +incdir+../../ {../../RF.v}
vlog -vlog01compat -work work +incdir+../../ {../../mux16_3x1.v}
vlog -vlog01compat -work work +incdir+../../ {../../alu.v}
vlog -vlog01compat -work work +incdir+../../ {../../datapath.v}
vlog -vlog01compat -work work +incdir+../../ {../../processor.v}
vlog -vlog01compat -work work +incdir+../../ {../../controller.v}
vlog -vlog01compat -work work +incdir+../../ {../../processor_testbench.v}

# Load design
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_testbench

# Set view and shown signals
#add wave *
add wave -noupdate clk
add wave -noupdate -unsigned cycleCount
add wave -noupdate reset
add wave -noupdate start

# Processor State and Instruction
add wave -noupdate -divider "Processor State and Instruction" 
add wave -noupdate -radix ascii sim:/processor_testbench/CPU/C/C/state_text
#add wave -noupdate -radix unsigned sim:/processor_testbench/CPU/C/C/state
add wave -noupdate -radix ascii sim:/processor_testbench/CPU/C/C/opcode_text
add wave -noupdate -hex sim:/processor_testbench/CPU/C/C/inst
add wave -noupdate -label "Take Jump (CPU/C/PC_ld)" sim:/processor_testbench/CPU/C/PC_ld
#add wave -noupdate -hex sim:/processor_testbench/CPU/C/P/jmp_addr

# Instruction Memory
add wave -noupdate -divider "Instruction Memory" 
add wave -noupdate -hex sim:/processor_testbench/CPU/pc_addr
add wave -noupdate sim:/processor_testbench/CPU/I_rd
add wave -noupdate -hex sim:/processor_testbench/CPU/I_R_data

# Data Memory
add wave -noupdate -divider "Data Memory" 
add wave -noupdate -hex sim:/processor_testbench/CPU/D_addr
add wave -noupdate sim:/processor_testbench/CPU/D_rd
add wave -noupdate -hex sim:/processor_testbench/CPU/D_R_data
add wave -noupdate sim:/processor_testbench/CPU/D_wr
add wave -noupdate -hex sim:/processor_testbench/CPU/D_W_data

# Register File
add wave -noupdate -divider "Register File" 
add wave -noupdate -hex \
	{sim:/processor_testbench/CPU/D/R/rfile[7]} \
	{sim:/processor_testbench/CPU/D/R/rfile[6]} \
	{sim:/processor_testbench/CPU/D/R/rfile[5]} \
	{sim:/processor_testbench/CPU/D/R/rfile[4]} \
	{sim:/processor_testbench/CPU/D/R/rfile[3]} \
	{sim:/processor_testbench/CPU/D/R/rfile[2]} \
	{sim:/processor_testbench/CPU/D/R/rfile[1]} \
	{sim:/processor_testbench/CPU/D/R/rfile[0]}
add wave -noupdate -hex sim:/processor_testbench/CPU/D/R/rfile
		
# Control Signals
add wave -noupdate -divider "Control Signals"
add wave -noupdate sim:/processor_testbench/CPU/C/RF_Rp_zero
add wave -noupdate sim:/processor_testbench/CPU/C/RF_Rp_neg

# Datapath Signals
#add wave -noupdate -divider "Datapath Signals"

view structure
view signals

# Run simulation
run 3000 ns
wave zoomfull

#.main clear
#restart -force