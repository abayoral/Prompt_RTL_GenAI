module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    wire carry0, carry1, carry2;

    bcd_counter ones (
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0]),
        .carry(carry0)
    );

    assign ena[1] = carry0;
    bcd_counter tens (
        .clk(clk),
        .reset(reset),
        .ena(carry0),
        .q(q[7:4]),
        .carry(carry1)
    );

    assign ena[2] = carry1;
    bcd_counter hundreds (
        .clk(clk),
        .reset(reset),
        .ena(carry1),
        .q(q[11:8]),
        .carry(carry2)
    );

    assign ena[3] = carry2;
    bcd_counter thousands (
        .clk(clk),
        .reset(reset),
        .ena(carry2),
        .q(q[15:12]),
        .carry()
    );
    
endmodule