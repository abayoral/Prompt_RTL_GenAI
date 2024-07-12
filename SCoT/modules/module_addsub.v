module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] sum_16bit;
    wire cin;
    wire [31:0] b_invert = b ^ {32{sub}}; // Invert b when sub is high
    wire unused;
    
    //Instantiate lower 16bit adder
    add16 lower_adder(
        .a(a[15:0]),
        .b(b_invert[15:0]),
        .cin(sub),
        .cout(cin),
        .sum(sum_16bit)
    );
  
    //Equal lower 16 bits of sum to output of lower adder
    assign sum[15:0] = sum_16bit;
    
    //Instantiate upper 16bit adder
    add16 upper_adder(
        .a(a[31:16]),
        .b(b_invert[31:16]),
        .cin(cin),
        .cout(unused), // Not used
        .sum(sum_16bit)
    );
  
    //Equal upper 16 bits of sum to output of upper adder
    assign sum[31:16] = sum_16bit;
endmodule