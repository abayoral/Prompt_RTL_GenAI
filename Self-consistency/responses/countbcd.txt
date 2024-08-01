module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);

    wire carry0, carry1, carry2;

    decade_counter unit0 (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .q(q[3:0]),
        .carry(carry0)
    );

    decade_counter unit1 (
        .clk(clk),
        .reset(reset),
        .enable(carry0),
        .q(q[7:4]),
        .carry(carry1)
    );

    decade_counter unit2 (
        .clk(clk),
        .reset(reset),
        .enable(carry1),
        .q(q[11:8]),
        .carry(carry2)
    );

    decade_counter unit3 (
        .clk(clk),
        .reset(reset),
        .enable(carry2),
        .q(q[15:12]),
        .carry()
    );

    assign ena[1] = carry0;
    assign ena[2] = carry1;
    assign ena[3] = carry2;

endmodule