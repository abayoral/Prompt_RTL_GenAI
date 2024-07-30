module top_module(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out1,
    output wire out2
);

    // Instantiate mod_a and connect ports using named mapping
    mod_a instance_mod_a (
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d),
        .out1(out1),
        .out2(out2)
    );

endmodule