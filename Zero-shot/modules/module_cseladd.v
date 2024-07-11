module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
  wire [15:0] sum0, sum1, sum2, cout0, cout1;
  
  add16 U1 ( .a(a[15:0]), .b(b[15:0]), .cin(0, .sum(sum0), .cout(cout0) );
  add16 U2 ( .a(a[31:16]), .b(b[31:16]), .cin(cout0), .sum(sum1) .cout() );
  add16 U3 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum2), .cout() );

  mux2to1 M1 ( .a(sum1), .b(sum2), .sel(cout0), .y(sum[31:16]) );
  
  assign sum[15:0] = sum0;

endmodule