module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] lower_sum_0, lower_sum_1, upper_sum_0, upper_sum_1;
    wire lower_cout_0, lower_cout_1, upper_cout_0, upper_cout_1;
    wire [15:0] upper_sum;

    // Compute the sum of lower and upper 16 bits with carry-in 0
    add16 add_lower_0 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(lower_sum_0), .cout(lower_cout_0));
    add16 add_upper_0 (.a(a[31:16]), .b(b[31:16]), .cin(lower_cout_0), .sum(upper_sum_0), .cout(upper_cout_0));

    // Compute the sum of lower and upper 16 bits with carry-in 1
    add16 add_lower_1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b1), .sum(lower_sum_1), .cout(lower_cout_1));
    add16 add_upper_1 (.a(a[31:16]), .b(b[31:16]), .cin(lower_cout_1), .sum(upper_sum_1), .cout(upper_cout_1));

    // Select the correct upper sum based on carry of lower
    assign upper_sum = lower_cout_0 ? upper_sum_1 : upper_sum_0;

    // Concatenate the lower and upper 16 bits to get 32-bit sum
    assign sum = {upper_sum, lower_sum_0};
endmodule