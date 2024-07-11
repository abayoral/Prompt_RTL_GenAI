module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] lower_sum_0, lower_sum_1, upper_sum_0, upper_sum_1;
    wire lower_cout_0, lower_cout_1, upper_cout_0, upper_cout_1;
    
    // Instantiate lower adders
    add16 lower_adder_0(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(lower_sum_0), .cout(lower_cout_0));
    add16 lower_adder_1(.a(a[15:0]), .b(b[15:0]), .cin(1), .sum(lower_sum_1), .cout(lower_cout_1));

    // Instantiate upper adders
    add16 upper_adder_0(.a(a[31:16]), .b(b[31:16]), .cin(lower_cout_0), .sum(upper_sum_0), .cout(upper_cout_0));
    add16 upper_adder_1(.a(a[31:16]), .b(b[31:16]), .cin(lower_cout_1), .sum(upper_sum_1), .cout(upper_cout_1));
    
    // Instantiate mux
    mux2x1 lower_mux(.d0(lower_sum_0), .d1(lower_sum_1), .sel(lower_cout_0), .y(sum[15:0]));
    mux2x1 upper_mux(.d0(upper_sum_0), .d1(upper_sum_1), .sel(upper_cout_0), .y(sum[31:16]));

endmodule