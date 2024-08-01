// Design a digital circuit within a Verilog module named "top_module". This circuit should accept a single 3-bit input vector named 'vec' and then provide this vector as an output named 'outv' without altering it. Additionally, the circuit must separate the provided 3-bit input vector into three distinct 1-bit outputs. Specifically, the least significant bit (bit 0) of 'vec' should be assigned to an output named 'o0', the second bit (bit 1) of 'vec' should be assigned to an output named 'o1', and the most significant bit (bit 2) of 'vec' should be assigned to an output named 'o2'. The design should ensure proper connections as described and should be encapsulated within the provided module framework.

module top_module ( 
    input wire [2:0] vec,  // Input: 3-bit vector
    output wire [2:0] outv, // Output: same 3-bit vector
    output wire o2,        // Output: bit 2 (MSB) of the input vector
    output wire o1,        // Output: bit 1 of the input vector
    output wire o0         // Output: bit 0 (LSB) of the input vector
); 

// Insert your code here to achieve the functionality described

endmodule