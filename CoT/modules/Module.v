module top_module ( input a, input b, output out );
    // Instantiate mod_a and connect its ports to top_module's ports
    mod_a instance_name (
        .in1(a),
        .in2(b),
        .out(out)
    );
endmodule