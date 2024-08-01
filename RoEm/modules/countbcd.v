module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    wire ena1, ena2, ena3;
    wire ena1_out, ena2_out, ena3_out;

    // Ones digit (q[3:0])
    bcd_counter digit0 (
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0]),
        .ena_out(ena1_out)
    );

    // Tens digit (q[7:4])
    bcd_counter digit1 (
        .clk(clk),
        .reset(reset),
        .ena(ena1_out),
        .q(q[7:4]),
        .ena_out(ena2_out)
    );

    // Hundreds digit (q[11:8])
    bcd_counter digit2 (
        .clk(clk),
        .reset(reset),
        .ena(ena2_out),
        .q(q[11:8]),
        .ena_out(ena3_out)
    );

    // Thousands digit (q[15:12])
    bcd_counter digit3 (
        .clk(clk),
        .reset(reset),
        .ena(ena3_out),
        .q(q[15:12]),
        .ena_out()
    );

    // Enable signals
    assign ena[1] = ena1_out;
    assign ena[2] = ena2_out;
    assign ena[3] = ena3_out;

endmodule