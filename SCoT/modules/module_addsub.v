module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire sub,
    output wire [31:0] sum
);

    wire [31:0] b_invert;
    wire carry;
    wire [15:0] sum_low, sum_high;

    // XOR the b input with the sub to create b_invert
    assign b_invert = b ^ {32{sub}};

    // Instantiate the lower 16-bit adder
    add16 lower_adder (
        .a(a[15:0]),
        .b(b_invert[15:0]),
        .cin(sub),
        .sum(sum_low),
        .carry(carry)
    );

    // Instantiate the higher 16-bit adder
    add16 higher_adder (
        .a(a[31:16]),
        .b(b_invert[31:16]),
        .cin(carry),
        .sum(sum_high)
    );

    // Combine the results
    assign sum = {sum_high, sum_low};

endmodule