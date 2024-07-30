module top_module ( input clk, input d, output q );
    // Intermediate signals to connect the D flip-flops
    wire q1, q2;

    // Instantiate the three D flip-flops
    my_dff dff1 ( .clk(clk), .d(d), .q(q1) );
    my_dff dff2 ( .clk(clk), .d(q1), .q(q2) );
    my_dff dff3 ( .clk(clk), .d(q2), .q(q) );

endmodule