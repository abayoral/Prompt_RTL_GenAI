module top_module (
    input wire clk,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q
);

    // Flip-flop logic: Capture d at the negative edge of clk or reset to 0x34 when reset is high
    always @(negedge clk) begin
        if (reset)
            q <= 8'b00110100;  // reset value to 0x34
        else
            q <= d;
    end

endmodule