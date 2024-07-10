//Using Chain of Thought:

// Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.

// You may want to instantiate or modify some one-digit decade counters.

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // Insert your code here

endmodule

//Please understand the requirement and write a rough solving process. It starts with a input-output structure, then defines intermediate signals. The thought process should be explained in pseudocode with no Verilog modules or syntax whatsoever. The necessary details should be written in natural languages.
