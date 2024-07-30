module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lower, sum_upper0, sum_upper1;
    wire cout_lower, cout_upper0, cout_upper1;
    
    // Lower 16-bit adder
    add16 adder_lower (
        .a(a[15:0]), 
        .b(b[15:0]), 
        .cin(1'b0), 
        .sum(sum_lower), 
        .cout(cout_lower)
    );
    
    // Upper 16-bit adder with carry-in 0
    add16 adder_upper0 (
        .a(a[31:16]), 
        .b(b[31:16]), 
        .cin(1'b0), 
        .sum(sum_upper0), 
        .cout(cout_upper0)
    );
    
    // Upper 16-bit adder with carry-in 1
    add16 adder_upper1 (
        .a(a[31:16]), 
        .b(b[31:16]), 
        .cin(1'b1), 
        .sum(sum_upper1), 
        .cout(cout_upper1)
    );
    
    // 16-bit 2-to-1 multiplexer for upper 16 bits of the sum
    mux2_1 mux_upper (
        .in0(sum_upper0), 
        .in1(sum_upper1), 
        .sel(cout_lower), 
        .out(sum[31:16])
    );

    // Combine lower and upper sum
    assign sum[15:0] = sum_lower;

endmodule