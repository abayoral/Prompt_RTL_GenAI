module top_module (
    input wire clk,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q
);
    // Flip-flop logic with synchronous reset: Capture d at the rising edge of clk, reset to 0 if reset is high
    always @(posedge clk) begin
        if (reset)
            q <= 8'b00000000; // If reset is high, reset q to 0
        else
            q <= d; // Otherwise, capture the value of d
    end
endmodule