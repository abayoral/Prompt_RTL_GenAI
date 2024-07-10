//Using Chain of Thought:

// Build a priority encoder for 8-bit inputs. Given an 8-bit vector, 
// the output should report the first (least significant) bit in the vector that is 1. 
// Report zero if the input vector has no bits that are high. 
// For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high.

// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );

    // Insert your code here

endmodule

//Please understand the requirement and write a rough solving process. It starts with a input-output structure, then defines intermediate signals. The thought process should be explained in pseudocode with no Verilog modules or syntax whatsoever. The necessary details should be written in natural languages.
