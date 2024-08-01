module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    // Wires to connect the individual BCD adders
    wire [3:0] sum0, sum1, sum2, sum3;
    wire cout0, cout1, cout2, cout3;

    // Instantiate 4 BCD adders to create a 4-digit BCD ripple-carry adder
    bcd_fadd bcd_fadd0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cout0), .sum(sum0));
    bcd_fadd bcd_fadd1 (.a(a[7:4]), .b(b[7:4]), .cin(cout0), .cout(cout1), .sum(sum1));
    bcd_fadd bcd_fadd2 (.a(a[11:8]), .b(b[11:8]), .cin(cout1), .cout(cout2), .sum(sum2));
    bcd_fadd bcd_fadd3 (.a(a[15:12]), .b(b[15:12]), .cin(cout2), .cout(cout3), .sum(sum3));

    // Connect the individual sums to the output
    assign sum = {sum3, sum2, sum1, sum0};
    assign cout = cout3;

endmodule