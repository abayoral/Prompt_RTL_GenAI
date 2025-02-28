.PHONY: vcs sim clean

TEST_DESIGN =  ../../modules/fixed_point_substractor

compile:
	iverilog -o simv ${TEST_DESIGN}.v testbench.v

sim:
	vvp simv

clean:
	rm -rf *.log simv *.vcd
