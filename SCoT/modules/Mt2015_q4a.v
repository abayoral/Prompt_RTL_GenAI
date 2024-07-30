module top_module (
    input wire x,
    input wire y,
    output wire z
);
    // Define intermediate signal
    wire intermediate;

    // Compute intermediate result: x XOR y
    assign intermediate = x ^ y;

    // Compute final output: intermediate AND x
    assign z = intermediate & x;
endmodule