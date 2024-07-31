module top_module( 
    input [99:0] a,
    input [99:0] b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);
    wire [99:0] carry;
    
    // Instantiate the first full adder
    full_adder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry[0])
    );
    
    // Generate block to instantiate the remaining 99 full adders
    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin : gen_fa
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i-1]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate
    
    // Assign the carry signal to cout
    assign cout = carry;

endmodule