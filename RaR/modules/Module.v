module top_module (input a, input b, output out);
    mod_a u_mod_a (
        .in1(a),    // Connecting top_module port 'a' to mod_a port 'in1'
        .in2(b),    // Connecting top_module port 'b' to mod_a port 'in2'
        .out(out)   // Connecting top_module port 'out' to mod_a port 'out'
    );
endmodule