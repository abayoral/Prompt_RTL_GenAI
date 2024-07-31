module top_module (
    input [7:0] in,
    output parity
); 
    // Parity logic: Calculate even parity bit using reduction XOR
    assign parity = ^in;
endmodule