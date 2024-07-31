module top_module (
    input wire a,
    input wire b,
    output wire out
);
    // Instantiate mod_a and map its ports to the top-level ports
    mod_a instance_name (
        .in1(a),  // Connect in1 of mod_a to input a of top-level module
        .in2(b),  // Connect in2 of mod_a to input b of top-level module
        .out(out) // Connect out of mod_a to output out of top-level module
    );

endmodule