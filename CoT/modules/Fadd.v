module top_module(
    input wire a,
    input wire b,
    input wire cin,
    output wire cout,
    output wire sum
);
    // Full adder logic
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | ((a ^ b) & cin);
endmodule