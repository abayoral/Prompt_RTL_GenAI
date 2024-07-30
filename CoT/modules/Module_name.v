module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    // Instantiate mod_a and connect ports by name
    mod_a u_mod_a (
        .out1(out1),  // Connect mod_a output out1 to top_module output out1
        .out2(out2),  // Connect mod_a output out2 to top_module output out2
        .in1(a),      // Connect top_module input a to mod_a input in1
        .in2(b),      // Connect top_module input b to mod_a input in2
        .in3(c),      // Connect top_module input c to mod_a input in3
        .in4(d)       // Connect top_module input d to mod_a input in4
    );
endmodule