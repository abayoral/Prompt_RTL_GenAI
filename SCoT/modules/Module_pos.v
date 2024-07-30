module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out1,
    output wire out2
);
    // Instance of mod_a with port mapping by position
    mod_a instance_name (
        .out1(out1), // 1st output of mod_a
        .out2(out2), // 2nd output of mod_a
        .in1(a),     // 1st input of mod_a
        .in2(b),     // 2nd input of mod_a
        .in3(c),     // 3rd input of mod_a
        .in4(d)      // 4th input of mod_a
    );
endmodule