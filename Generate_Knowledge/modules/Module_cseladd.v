module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire [15:0] sum0, sum1;
wire cout0, cout1, cout_sel;

// Lower 16 bits addition without carry propagation
add16 lower_add (
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(1'b0),
    .sum(sum[15:0]),
    .cout(cout0)
);

// Upper 16 bits addition assuming carry-in is 0
add16 upper_add0 (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b0),
    .sum(sum0),
    .cout(cout1)
);

// Upper 16 bits addition assuming carry-in is 1
add16 upper_add1 (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b1),
    .sum(sum1),
    .cout() // We don't need the carry-out from this addition
);

// Multiplex the sum and carry-out based on carry-in from lower addition part
mux2to1_16bit sum_mux (
    .in0(sum0),
    .in1(sum1),
    .sel(cout0),
    .out(sum[31:16])
);

endmodule