module top_module (
    input wire a,
    input wire b,
    output wire sum,
    output wire cout
);
    // Half adder logic:
    // sum is the XOR of a and b
    // cout is the AND of a and b
    assign sum = a ^ b;
    assign cout = a & b;
endmodule