module top_module (
    input wire [99:0] a,
    input wire [99:0] b,
    input wire cin,
    output wire [99:0] sum,
    output wire [99:0] cout
);
    // Intermediate carry signals
    wire [99:1] carry; // Carries between the full adders

    // Instantiate the first full adder
    full_adder FA0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cout[0])
    );

    // Generate block to instantiate the remaining 99 full adders
    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin: ripple_adders
            full_adder FA (
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate
endmodule