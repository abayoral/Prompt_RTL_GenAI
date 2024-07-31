module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    wire ena0, ena1, ena2;

    // Instantiate BCD digits
    bcd_digit digit0 (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .q(q[3:0]),
        .ena(ena0)
    );

    bcd_digit digit1 (
        .clk(clk),
        .reset(reset),
        .enable(ena0),
        .q(q[7:4]),
        .ena(ena1)
    );

    bcd_digit digit2 (
        .clk(clk),
        .reset(reset),
        .enable(ena1),
        .q(q[11:8]),
        .ena(ena2)
    );

    bcd_digit digit3 (
        .clk(clk),
        .reset(reset),
        .enable(ena2),
        .q(q[15:12]),
        .ena()
    );

    // Connecting the enable signals to the output
    assign ena[1] = ena0;
    assign ena[2] = ena1;
    assign ena[3] = ena2;
endmodule