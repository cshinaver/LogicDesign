transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Joshua/Documents/SophomoreYear/Spring/LogicDesign/Lab3 {C:/Users/Joshua/Documents/SophomoreYear/Spring/LogicDesign/Lab3/BusMux.v}

vlog -vlog01compat -work work +incdir+C:/Users/Joshua/Documents/SophomoreYear/Spring/LogicDesign/Lab3 {C:/Users/Joshua/Documents/SophomoreYear/Spring/LogicDesign/Lab3/BusMuxTestBench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  BusMuxTestBench

add wave *
view structure
view signals
run -all
