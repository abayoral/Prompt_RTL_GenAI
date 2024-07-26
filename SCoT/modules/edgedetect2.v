module top_module (
    input wire clk,
    input wire [7:0] in,
    output reg [7:0] anyedge
);
    // Previous input signal
    reg [7:0] prev_in = 0;

    // Detect any edge in signal
    always @(posedge clk) begin
        // Any edge detection logic: Identify any 0 to 1 transition
        anyedge <= in & ~prev_in;

        // Update previous input for the next cycle
        prev_in <= in;
    end
endmodule