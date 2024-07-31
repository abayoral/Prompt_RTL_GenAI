module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    // Instantiate eight D flip-flops
    d_flipflop dff0 (.clk(clk), .D(d[0]), .Q(q[0]));
    d_flipflop dff1 (.clk(clk), .D(d[1]), .Q(q[1]));
    d_flipflop dff2 (.clk(clk), .D(d[2]), .Q(q[2]));
    d_flipflop dff3 (.clk(clk), .D(d[3]), .Q(q[3]));
    d_flipflop dff4 (.clk(clk), .D(d[4]), .Q(q[4]));
    d_flipflop dff5 (.clk(clk), .D(d[5]), .Q(q[5]));
    d_flipflop dff6 (.clk(clk), .D(d[6]), .Q(q[6]));
    d_flipflop dff7 (.clk(clk), .D(d[7]), .Q(q[7]));
    
endmodule