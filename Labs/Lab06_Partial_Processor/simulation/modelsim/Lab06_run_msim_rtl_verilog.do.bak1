transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/RF.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/mux16_3x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/JMP_addr.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/IR.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/inst_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/data_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/processor.v}

vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor {C:/Users/charlesshinaver/Documents/Lab06_Partial_Processor/processor_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  processor_testbench

add wave *
view structure
view signals
run 500 ns
