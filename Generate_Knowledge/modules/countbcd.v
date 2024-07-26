module top_module (
    input wire clk,
    input wire reset,   // Synchronous active-high reset
    output wire [3:1] ena,
    output wire [15:0] q);

    // Decade Counter for each digit
    wire [3:0] ones, tens, hundreds, thousands;

    // Instantiate 4-digit decades counters
    decade_counter d0 (.clk(clk), .reset(reset), .q(ones), .en(ena[1]));
    decade_counter d1 (.clk(clk), .reset(reset), .q(tens), .en(ena[2]));
    decade_counter d2 (.clk(clk), .reset(reset), .q(hundreds), .en(ena[3]));
    decade_counter d3 (.clk(clk), .reset(reset), .q(thousands), .en(1'b0));

    // Gather all values
    assign q = {thousands, hundreds, tens, ones};

endmodule