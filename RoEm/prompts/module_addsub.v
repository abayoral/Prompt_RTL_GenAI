// you're a senior Digital Design Engineer at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.

// Build the adder-subtractor below.
// You are provided with a 16-bit adder module, which you need to instantiate twice:

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

// Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. 
// (This can also be viewed as b[31:0] XORed with sub replicated 32 times.). 
// Also connect the sub input to the carry-in of the adder.

// Hint: An XOR gate can also be viewed as a programmable inverter, where one input controls whether the other should be inverted.

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

	// INsert your code here

endmodule