module top_module(
    input wire clk,
    input wire reset,
    input wire en,
    output wire [15:0] q
);

    wire [3:0] cnt1, cnt10, cnt100, cnt1000;
    wire c1, c10, c100, cna;

    bcd_counter U1 (
        .clk(clk), .reset(reset), .en(en), .q(cnt1), .c(c1)
    );

    bcd_counter U2 (
        .clk(clk), .reset(reset), .en(c1 & ena), .q(cnt10), .c(c10)
    );

    bcd_counter U3 (
        .clk(clk), .reset(reset), .en(c10 & ena), .q(cnt100), .c(c100)
    );

    bcd_counter U4 (
        .clk(clk), .reset(reset), .en(c100 & ena), .q(cnt1000), .c(cna)
    );

    assign q = {cnt1000, cnt100, cnt10, cnt1};

endmodule