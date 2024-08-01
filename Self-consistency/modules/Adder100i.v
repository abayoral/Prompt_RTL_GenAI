module top_module( 
    input [99:0] a, 
    input [99:0] b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
);

    genvar i;
    wire [99:0] c; // Local carry array

    // Instantiate the first full adder separately as it uses the input carry `cin`
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c[0])
    );

    // Generate statement to instantiate the remaining 99 full adders
    generate
        for (i = 1; i < 100; i = i + 1) begin: FA_GEN
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i-1]),
                .sum(sum[i]),
                .cout(c[i])
            );
        end
    endgenerate

    assign cout = c;

endmodule