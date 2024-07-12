module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] bxor;
    wire [15:0] add16_lower_sum, add16_upper_sum;
    wire add16_lower_cout;
    
    assign bxor = b ^ ({32{sub}});
    
    add16 add16_lower(
        .a(a[15:0]),
        .b(bxor[15:0]),
        .cin(sub),
        .sum(add16_lower_sum),
        .cout(add16_lower_cout)
    );

    add16 add16_upper(
        .a(a[31:16]),
        .b(bxor[31:16]),
        .cin(add16_lower_cout),
        .sum(add16_upper_sum),
        .cout()
    );

    assign sum = {add16_upper_sum, add16_lower_sum};

endmodule