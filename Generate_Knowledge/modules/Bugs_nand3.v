module top_module (input a, input b, input c, output out);
    wire intermediate;
    
    andgate inst1 (.out(intermediate), .a(1'b1), .b(1'b1), .c(a), .d(b), .e(c));
    assign out = ~intermediate;
endmodule