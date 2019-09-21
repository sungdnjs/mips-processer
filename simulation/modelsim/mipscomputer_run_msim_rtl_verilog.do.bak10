transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/adder.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/alu.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/aludec.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/controller.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/datapath.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/eqcmp.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/flopenr.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/flopenrc.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/flopr.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/floprc.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/forwarding_unit.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/hazard_detection_unit.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/maindec.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/mips.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/mipscomputer.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/mux2.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/mux3.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/regfile.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/signext.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/sl2.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/dmem.v}
vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/imem.v}

vlog -vlog01compat -work work +incdir+C:/altera/12.1sp1/quartus/3-1cdproject3 {C:/altera/12.1sp1/quartus/3-1cdproject3/tb_mipscomputer.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  tb_mipscomputer

add wave *
view structure
view signals
run -all
