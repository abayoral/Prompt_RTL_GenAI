module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire [15:0] lowerSum1, lowerSum2, upperSum1, upperSum2;
wire lowerCarry, upperCarry1, upperCarry2;

add16 lowerAdder (
    .a(a[15:0]), 
    .b(b[15:0]), 
    .cin(1'b0), 
    .sum(lowerSum1), 
    .cout(lowerCarry)
);

add16 upperAdder1 (
    .a(a[31:16]), 
    .b(b[31:16]), 
    .cin(1'b0), 
    .sum(upperSum1), 
    .cout(upperCarry1)
);

add16 upperAdder2 (
    .a(a[31:16]), 
    .b(b[31:16]), 
    .cin(lowerCarry), 
    .sum(upperSum2), 
    .cout(upperCarry2)
);

mux2to1_16bit upperMux (
    .a(upperSum1), 
    .b(upperSum2), 
    .sel(lowerCarry), 
    .y(sum[31:16])
);

assign sum[15:0] = lowerSum1;

endmodule