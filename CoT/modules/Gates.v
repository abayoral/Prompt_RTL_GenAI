module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    // Logic gate operations
    assign out_and = a & b;       // AND gate
    assign out_or = a | b;        // OR gate
    assign out_xor = a ^ b;       // XOR gate
    assign out_nand = ~(a & b);   // NAND gate
    assign out_nor = ~(a | b);    // NOR gate
    assign out_xnor = ~(a ^ b);   // XNOR gate
    assign out_anotb = a & ~b;    // AND-NOT gate

endmodule