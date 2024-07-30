module top_module (
    input wire [99:0] a,
    input wire [99:0] b,
    input wire cin,
    output wire [99:0] sum,
    output wire cout
);
    // Internal signal to hold the complete result with carry-out
    wire [100:0] result;

    // Perform the addition with carry-in
    assign result = a + b + cin;

    // Extract the sum and carry-out from the result
    assign sum = result[99:0];
    assign cout = result[100];

endmodule