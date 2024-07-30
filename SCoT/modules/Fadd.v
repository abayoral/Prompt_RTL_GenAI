module top_module (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
    // Sum calculation: XOR all inputs
    assign sum = a ^ b ^ cin;
    
    // Carry-out calculation: (a AND b) OR (b AND cin) OR (cin AND a)
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule