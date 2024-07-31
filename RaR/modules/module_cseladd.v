module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1, sum2, sum3;
    wire c1, c2, c3;
    
    // Instantiate the add16 modules
    add16 u1 (a[15:0], b[15:0], 0, sum1, c1); // Least significant 16 bits
    add16 u2 (a[31:16], b[31:16], 0, sum2, c2);
    add16 u3 (a[31:16], b[31:16], 1, sum3, c3);
    
    // Instantiate the 2-to-1 multiplexer module
    mux16 mux1 (.a(sum2), .b(sum3), .sel(c1), .y(sum[31:16]));
    
    assign sum[15:0] = sum1;
endmodule