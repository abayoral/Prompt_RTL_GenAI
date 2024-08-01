module top_module ( 
    input wire [2:0] vec,  // Input: 3-bit vector
    output wire [2:0] outv, // Output: same 3-bit vector
    output wire o2,        // Output: bit 2 (MSB) of the input vector
    output wire o1,        // Output: bit 1 of the input vector
    output wire o0         // Output: bit 0 (LSB) of the input vector
); 

    // Assign the input vector to the output vector
    assign outv = vec;
    
    // Split the input vector into individual bits
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

endmodule