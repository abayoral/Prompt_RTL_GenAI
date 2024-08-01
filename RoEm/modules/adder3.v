module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire [2:0] carry;

    // Instantiate full adders
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(carry[0]),
        .sum(sum[0])
    );

    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(carry[0]),
        .cout(carry[1]),
        .sum(sum[1])
    );

    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(carry[1]),
        .cout(carry[2]),
        .sum(sum[2])
    );

    // Assign carry out
    assign cout = carry;

endmodule