module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    // Intermediate signal to hold the sum and carry-out of the addition
    wire [100:0] temp_sum;

    // Adding a, b, and cin
    assign temp_sum = a + b + cin;

    // Assign sum and cout from the results
    assign sum = temp_sum[99:0];
    assign cout = temp_sum[100];

endmodule