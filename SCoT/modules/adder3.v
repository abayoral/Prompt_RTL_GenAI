module top_module (
    input wire [2:0] a,
    input wire [2:0] b,
    input wire cin,
    output wire [2:0] cout,
    output wire [2:0] sum
);
    // Intermediate carry signals
    wire c1, c2;

    // Instantiate first full adder
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );

    // Instantiate second full adder
    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    // Instantiate third full adder
    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(cout[2])
    );

    // Assign carry-out signals
    assign cout[0] = c1;
    assign cout[1] = c2;

endmodule