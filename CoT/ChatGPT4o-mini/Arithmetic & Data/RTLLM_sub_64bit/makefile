.PHONY: vcs sim clean

TEST_DESIGN = ../../../modules/sub_64bit

compile:
	iverilog -o simv ${TEST_DESIGN}.v testbench.v
sim:
		./simv -l run.log

clean:
		rm -rf *.log  csrc  simv*  *.key *.vpd  DVEfiles coverage *.vdb output.txt
