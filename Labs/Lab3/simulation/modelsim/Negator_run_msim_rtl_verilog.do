transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/FullAdder.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/RCA8.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/Negator.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/BusMux.v}
vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/AbsSign.v}

vlog -vlog01compat -work work +incdir+C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3 {C:/Users/charlesshinaver/Desktop/LogicDesign/Labs/Lab3/AbsSignTestBench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  AbsSignTestBench

add wave *
view structure
view signals
run -all
