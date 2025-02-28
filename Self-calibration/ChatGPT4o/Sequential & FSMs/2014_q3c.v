// you're a senior Digital Design Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.

// Given the state-assigned table shown below, implement the logic functions Y[0] and z.

//Present state 		Next state Y[2:0]
//		y[2:0]								Output z
//							x=0	x=1
						
//		000					000	001				0
//		001					001	100				0
//		010					010	001				0
//		011					001	010				1
//		100					011	100				1


module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

	// Insert your code here

endmodule
