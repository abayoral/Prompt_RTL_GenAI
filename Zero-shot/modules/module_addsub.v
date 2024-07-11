module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] sum_low, sum_high;
    wire [31:0] b_inv;
    wire cout_low, cout_high;

    // Use a 32-bit wide XOR gate to invert the b input whenever sub is 1
    assign b_inv = b ^ {32{sub}};

    // Split a and b into lower and upper 16 bits
    wire [15:0] a_low = a[15:0], a_high = a[31:16];
    wire [15:0] b_low = b_inv[15:0], b_high = b_inv[31:16];

    // Instantiate the 16-bit adder twice
    add16 U1 (.a(a_low), .b(b_low), .cin(sub), .sum(sum_low), .cout(cout_low));
    add16 U2 (.a(a_high), .b(b_high), .cin(cout_low), .sum(sum_high), .cout(cout_high));

    // Output 32-bit sum
    assign sum = {sum_high, sum_low};

endmodule