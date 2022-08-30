all: build
	yosys -s do_synt.ys

build:
	touch do_synt.ys
	echo "read_verilog -sv ../*.sv" > do_synt.ys
	echo "read_liberty -lib ../../yosys_sky130/lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib" >> do_synt.ys
	echo "synth -top $(DAY)" >> do_synt.ys
	echo "dfflibmap -liberty ../../yosys_sky130/lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib" >> do_synt.ys
	echo "abc -liberty ../../yosys_sky130/lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib" >> do_synt.ys
	echo "clean" >> do_synt.ys
	echo "write_verilog -noattr synth.v" >> do_synt.ys
	echo "flatten" >> do_synt.ys
	echo "write_verilog -noattr flatten_synth.v" >> do_synt.ys
	echo "write_spice synth.sp" >> do_synt.ys
	echo "show -prefix $(DAY) -colors $(TIME)" >> do_synt.ys