module top_module (
    input wire [2:0] a,
    input wire [2:0] b,
    input wire cin,
    output wire [2:0] sum,
    output wire [2:0] cout
);
    wire carry1, carry2;

    // Instantiate three full-adders
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cout[0])
    );

    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(cout[0]),
        .sum(sum[1]),
        .cout(cout[1])
    );

    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(cout[1]),
        .sum(sum[2]),
        .cout(cout[2])
    );
endmodule