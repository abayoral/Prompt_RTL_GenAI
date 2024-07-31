module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire sub,
    output wire [31:0] sum
);
    wire [15:0] sum_lower, sum_upper;
    wire [15:0] b_inverted_lower, b_inverted_upper;
    wire carry_out_lower, carry_into_upper;

    // Split inputs into lower and upper 16 bits
    wire [15:0] a_lower = a[15:0];
    wire [15:0] a_upper = a[31:16];
    wire [15:0] b_lower = b[15:0];
    wire [15:0] b_upper = b[31:16];

    // Conditionally invert b based on sub signal
    assign b_inverted_lower = b_lower ^ {16{sub}};
    assign b_inverted_upper = b_upper ^ {16{sub}};

    // First 16-bit adder instance
    add16 add_lower (
        .a(a_lower),
        .b(b_inverted_lower),
        .cin(sub),
        .sum(sum_lower),
        .cout(carry_out_lower)
    );

    // Second 16-bit adder instance
    add16 add_upper (
        .a(a_upper),
        .b(b_inverted_upper),
        .cin(carry_out_lower),
        .sum(sum_upper),
        .cout(carry_into_upper)  // not used
    );

    // Concatenate the lower and upper sums to form the final 32-bit sum
    assign sum = {sum_upper, sum_lower};
endmodule