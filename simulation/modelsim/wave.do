onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_mipscomputer/clk
add wave -noupdate /tb_mipscomputer/reset
add wave -noupdate /tb_mipscomputer/memwrite
add wave -noupdate -group mem -color Salmon -radix hexadecimal /tb_mipscomputer/imem_a
add wave -noupdate -group mem -color Salmon -radix hexadecimal /tb_mipscomputer/imem_rd
add wave -noupdate -group mem -color Salmon -radix hexadecimal /tb_mipscomputer/dmem_a
add wave -noupdate -group mem -color Salmon -radix hexadecimal /tb_mipscomputer/dmem_rd
add wave -noupdate -group mem -color Salmon -radix hexadecimal /tb_mipscomputer/dmem_wd
add wave -noupdate -expand -group instr -color {Medium Orchid} -radix hexadecimal /tb_mipscomputer/dut/mips/instrF
add wave -noupdate -expand -group instr -color {Medium Orchid} -radix hexadecimal /tb_mipscomputer/dut/mips/dp/r2D/q
add wave -noupdate -expand -group fd -color {Medium Sea Green} /tb_mipscomputer/dut/mips/dp/fd_unit/forwardaE
add wave -noupdate -expand -group fd -color {Medium Sea Green} /tb_mipscomputer/dut/mips/dp/fd_unit/forwardbE
add wave -noupdate -expand -group fd -color {Medium Sea Green} /tb_mipscomputer/dut/mips/dp/fd_unit/forwardaD
add wave -noupdate -expand -group fd -color {Medium Sea Green} /tb_mipscomputer/dut/mips/dp/fd_unit/forwardbD
add wave -noupdate -radix decimal {/tb_mipscomputer/dut/mips/dp/rf/rfile[19]}
add wave -noupdate -radix decimal {/tb_mipscomputer/dut/mips/dp/rf/rfile[18]}
add wave -noupdate -radix decimal {/tb_mipscomputer/dut/mips/dp/rf/rfile[17]}
add wave -noupdate -radix decimal {/tb_mipscomputer/dut/mips/dp/rf/rfile[16]}
add wave -noupdate -radix decimal {/tb_mipscomputer/dut/mips/dp/rf/rfile[8]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {65090 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 116
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
WaveRestoreZoom {0 ps} {163994 ps}
