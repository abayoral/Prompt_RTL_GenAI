module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // Instantiate the mod_a module and connect ports
    mod_a instance_name (
        .output(out1),
        .output(out2),
        .input(a),
        .input(b),
        .input(c),
        .input(d)
    );

endmodule

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // Instantiate the mod_a module and connect ports
    mod_a instance_name (
        .out1(out1),
        .out2(out2),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

endmodule