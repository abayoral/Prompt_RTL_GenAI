module top_module (
    input wire [7:0] in,
    output wire parity
);
    // Parity computation logic: Calculate even parity bit using reduction XOR
    assign parity = ^in;
endmodule