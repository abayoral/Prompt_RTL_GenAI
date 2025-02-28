.PHONY: vcs sim clean

TEST_DESIGN = ../../modules/multi_pipe_8bit

compile:
	iverilog -o simv ${TEST_DESIGN}.v testbench.v

sim:
		./simv -l run.log

clean:
		rm -rf *.log  csrc  simv*  *.key *.vpd  DVEfiles coverage *.vdb output.txt
