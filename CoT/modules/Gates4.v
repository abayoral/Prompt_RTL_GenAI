module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    // AND gate logic: all bits of in must be 1 for out_and to be 1
    assign out_and = &in;

    // OR gate logic: any bit of in being 1 will make out_or 1
    assign out_or = |in;

    // XOR gate logic: out_xor is 1 if the number of 1s in in is odd
    assign out_xor = ^in;

endmodule