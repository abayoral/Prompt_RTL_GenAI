// you're a senior FPGA Design Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.

// Consider the function f shown in the Karnaugh map below. Implement this function.

         x_1'x_2'	x_1'x_2 	x_1x_2		x_1x_2'

x_3'x_4'	1		0		0		1
x_3'x_4		0		0		0		0
x_3x_4  	1		1		1		0
x_3x_4'		1		1		0		1

// Hint: Be careful of the ordering of the x[4:1] input bits in the Karnaugh map.

module top_module (
    input [4:1] x,
    output f
); 

	// Insert your code here

endmodule

