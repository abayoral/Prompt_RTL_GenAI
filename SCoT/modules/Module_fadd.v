module top_module (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum
);
    wire [15:0] sum_lower;
    wire [15:0] sum_upper;
    wire carry_lower;
    
    // Instantiate the first 16-bit adder for the lower 16 bits
    add16 adder_lower (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lower),
        .cout(carry_lower)
    );
    
    // Instantiate the second 16-bit adder for the upper 16 bits
    add16 adder_upper (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_lower),
        .sum(sum_upper),
        .cout() // Carry-out from the upper adder is not needed in this case
    );

    // Concatenate the results to form the final 32-bit sum
    assign sum = {sum_upper, sum_lower};
endmodule