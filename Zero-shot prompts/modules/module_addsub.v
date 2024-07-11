module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] lower_sum, lower_cout, upper_sum, upper_cout;

    wire [15:0] a_lower = a[15:0];
    wire [15:0] a_upper = a[31:16];
    wire [15:0] b_lower = b[15:0] ^ {16{sub}};
    wire [15:0] b_upper = b[31:16] ^ {16{sub}};

    add16 add_lower(
        .a(a_lower),
        .b(b_lower),
        .cin(sub),
        .sum(lower_sum),
        .cout(lower_cout)
    );

    add16 add_upper(
        .a(a_upper),
        .b(b_upper),
        .cin(lower_cout),
        .sum(upper_sum),
        .cout(upper_cout)
    );

    assign sum = {upper_sum, lower_sum};
endmodule