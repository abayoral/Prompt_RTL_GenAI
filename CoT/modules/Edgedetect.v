module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    // Register to hold the previous state of the input
    reg [7:0] prev_in;

    always @(posedge clk) begin
        // Detect the 0 to 1 transition for each bit
        pedge <= (in & ~prev_in);

        // Update the previous state to current state
        prev_in <= in;
    end
endmodule