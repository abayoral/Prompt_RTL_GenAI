module top_module (input a, input b, input c, output out);
    wire and_out;
    andgate inst1 (and_out, a, b, c, 1'b1, 1'b1); // Use 1'b1 to fill the unused inputs
    assign out = ~and_out; // NAND operation
endmodule