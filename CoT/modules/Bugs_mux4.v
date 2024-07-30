module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out
);
    wire [7:0] mux0, mux1;
    
    mux2 u_mux0 ( .sel(sel[0]), .a(a), .b(b), .out(mux0) );
    mux2 u_mux1 ( .sel(sel[0]), .a(c), .b(d), .out(mux1) );
    mux2 u_mux2 ( .sel(sel[1]), .a(mux0), .b(mux1), .out(out) );
    
endmodule