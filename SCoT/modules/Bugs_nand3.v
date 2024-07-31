module top_module (
    input wire a,
    input wire b,
    input wire c,
    output wire out
);
    wire and_output;

    // Instantiating the 5-input AND gate module
    andgate and_inst (
        .a(a),
        .b(b),
        .c(c),
        .d(1'b1), // Connect unused inputs to logic '1'
        .e(1'b1), // Connect unused inputs to logic '1'
        .out(and_output)
    );

    // Invert and_output to implement NAND logic
    assign out = ~and_output;

endmodule