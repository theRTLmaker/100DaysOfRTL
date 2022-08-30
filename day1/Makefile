DAY  = day1
TIME = $$(date +'%Y%m%d-%H%M%S')

all:

sim:
	$(MAKE) -C test -f Makefile_GLS DAY=$(DAY) clean
	$(MAKE) -C test -f Makefile_SIM DAY=$(DAY) clean
	$(MAKE) -C test -f Makefile_SIM DAY=$(DAY)

gls: synth
	$(MAKE) -C test -f Makefile_GLS DAY=$(DAY) clean
	$(MAKE) -C test -f Makefile_SIM DAY=$(DAY) clean
	$(MAKE) -C test -f Makefile_GLS DAY=$(DAY)

synth:
	$(MAKE) -C synth DAY=$(DAY) TIME=$(TIME)

wave:
	gtkwave ./test/sim.vcd

clean:
	rm -f ./synth/*.v ./synth/*.sp ./synth/*.ys ./synth/*.dot
	rm -f ./test/*.vcd
	rm -f ./test/results.xml
	$(MAKE) -C test -f Makefile_GLS DAY=$(DAY) clean
	$(MAKE) -C test -f Makefile_SIM DAY=$(DAY) clean

.PHONY: clean synth

# TOOLCMD = iverilog -o sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

# compile: clean
# 	$(TOOLCMD) -s $(DAY) $(DAY).sv

# sim: clean
# 	$(TOOLCMD) -s $(DAY)_tb $(DAY).sv $(DAY)_tb.sv
# 	/opt/homebrew/bin/vvp ./sim.vvp
# 	gtkwave $(DAY).vcd -r ../gtkwaverc &

# build: clean
# 	touch synth.ys
# 	echo "read -sv $(DAY).sv" > synth.ys
# 	echo "hierarchy -top $(DAY)" >> synth.ys
# 	echo "proc; opt; techmap; opt" >> synth.ys
# 	echo "write_verilog synth.v" >> synth.ys
# 	echo "show -prefix $(DAY) -colors $(TIME)" >> synth.ys

# synth: build
# 	yosys synth.ys

# clean:
# 	rm -rf sim.vvp synth.ys synth.v $(DAY).dot $(DAY).dot.pid $(DAY).vcd

# # Makefile

# # defaults
# SIM ?= icarus
# TOPLEVEL_LANG ?= verilog

# VERILOG_SOURCES += $(PWD)/day1.sv

# # TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
# TOPLEVEL = day1

# # MODULE is the basename of the Python test file
# MODULE = day1

# # include cocotb's make rules to take care of the simulator setup
# include $(shell cocotb-config --makefiles)/Makefile.sim