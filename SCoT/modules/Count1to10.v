module top_module (
    input wire clk,         // Clock input
    input wire reset,       // Synchronous reset input
    output reg [3:0] q      // 4-bit output to hold the current counter value
);

    // Always block triggered by the rising edge of the clock
    always @(posedge clk) begin
        if (reset) begin
            // Reset condition: assign 1 to the counter
            q <= 4'd1;
        end else if (q == 4'd10) begin
            // If the counter reaches 10, reset to 1
            q <= 4'd1;
        end else begin
            // Otherwise, increment the counter
            q <= q + 1;
        end
    end
endmodule