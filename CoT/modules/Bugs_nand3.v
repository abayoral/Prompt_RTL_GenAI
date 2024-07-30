module top_module (input a, input b, input c, output out);
    wire and_out;

    // Instantiate the 5-input AND gate with the first three inputs and two tied high inputs
    andgate inst1 (.out(and_out), .a(a), .b(b), .c(c), .d(1'b1), .e(1'b1));

    // Invert the AND gate output to achieve NAND functionality
    assign out = ~and_out;
endmodule