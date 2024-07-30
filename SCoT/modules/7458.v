module top_module (
    input wire p1a, p1b, p1c, p1d, p1e, p1f,
    input wire p2a, p2b, p2c, p2d,
    output wire p1y, p2y
);
    // Define intermediate signals for AND gates
    wire and1_out, and2_out, and3_out, and4_out;

    // Implement AND gate logic for part 1
    assign and1_out = p1a & p1b;
    assign and2_out = p1c & p1d;
    assign and3_out = p1e & p1f;

    // Implement OR gate logic for part 1
    assign p1y = and1_out | and2_out | and3_out;

    // Implement AND gate logic for part 2
    assign and4_out = p2a & p2b & p2c & p2d;

    // Implement OR gate logic for part 2 (single AND gate output directly drives p2y)
    assign p2y = and4_out;

endmodule