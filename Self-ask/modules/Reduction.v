module top_module (
    input [7:0] in,
    output parity
); 
    assign parity = ^in;  // XOR all bits of the input to determine the parity
endmodule