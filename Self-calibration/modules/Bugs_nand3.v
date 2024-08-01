module top_module (input a, input b, input c, output out);

    wire and_out;
    
    // Use the andgate with fixed inputs for the unused inputs
    andgate inst1 (and_out, a, b, c, 1'b1, 1'b1);
    
    // Invert the output of the andgate to create a NAND gate
    assign out = ~and_out;
endmodule