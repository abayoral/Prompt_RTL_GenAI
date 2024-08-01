module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lower;
    wire cout_lower;
    wire [15:0] sum_upper;
    wire cout_upper;
    
    // First 16-bit adder (lower 16 bits)
    add16 u_add16_lower (
        .a(a[15:0]), 
        .b(b[15:0]), 
        .cin(1'b0), 
        .sum(sum_lower), 
        .cout(cout_lower)
    );
    
    // Second 16-bit adder (upper 16 bits), with carry-in from first adder
    add16 u_add16_upper (
        .a(a[31:16]), 
        .b(b[31:16]), 
        .cin(cout_lower), 
        .sum(sum_upper), 
        .cout(cout_upper)
    );
    
    // Concatenate the lower and upper sums to form the 32-bit sum
    assign sum = {sum_upper, sum_lower};

endmodule