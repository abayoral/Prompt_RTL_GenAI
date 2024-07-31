module top_module( 
    input [2:0] a, 
    input [2:0] b,
    input cin,
    output [2:0] cout,
    output [2:0] sum 
);

    wire [2:0] carry;
    
    // Instantiate the three full adders
    full_adder fa0 (
        .A(a[0]),
        .B(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry[0])
    );

    full_adder fa1 (
        .A(a[1]),
        .B(b[1]),
        .cin(carry[0]),
        .sum(sum[1]),
        .cout(carry[1])
    );

    full_adder fa2 (
        .A(a[2]),
        .B(b[2]),
        .cin(carry[1]),
        .sum(sum[2]),
        .cout(cout[2])
    );

    // The carry-outs from each full-adder
    assign cout[0] = carry[0];
    assign cout[1] = carry[1];
    
endmodule