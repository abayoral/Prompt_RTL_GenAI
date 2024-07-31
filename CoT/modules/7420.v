module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    // NAND gate logic for p1y
    assign p1y = ~(p1a & p1b & p1c & p1d);

    // NAND gate logic for p2y
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule