module top_module( 
    input wire a, 
    input wire b,
    output wire cout, 
    output wire sum 
);
    // Sum is a XOR b
    assign sum = a ^ b;
    // Carry-out is a AND b
    assign cout = a & b;
endmodule