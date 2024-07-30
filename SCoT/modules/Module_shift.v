module top_module (
    input wire clk,
    input wire d,
    output wire q
);
    // Intermediate signals for connecting the stages
    wire q1, q2;

    // Instantiate three instances of my_dff module
    my_dff dff1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );

    my_dff dff2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );

    my_dff dff3 (
        .clk(clk),
        .d(q2),
        .q(q)
    );

endmodule