module top_module (
    input clk,
    input reset,
    output reg [3:0] q
);
    // Decade counter logic: Synchronous reset to 1 and count from 1 to 10
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0001;  // Reset q to 1
        else if (q == 4'b1010)  // If q is 10
            q <= 4'b0001;  // Wrap around to 1
        else
            q <= q + 1;  // Otherwise, increment q
    end
endmodule