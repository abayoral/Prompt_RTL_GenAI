module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] adder1_out, adder2_out;
    wire [31:0] bxor;
    
    assign bxor = b ^ {32{sub}};
    
    add16 add1 ( .a(a[15:0]), .b(bxor[15:0]), .cin(sub), .sum(adder1_out),.cout());
    add16 add2 ( .a(a[31:16]), .b(bxor[31:16]), .cin(sub), .sum(adder2_out),.cout());
    
    assign sum = {adder2_out, adder1_out};
endmodule