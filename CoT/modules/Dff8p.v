module top_module (
    input wire clk,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q
);
    // D Flip-Flop logic with synchronous reset to 0x34 triggered on negative edge of clk
    always @(negedge clk) begin
        if (reset)
            q <= 8'h34; // reset value 0x34 (hexadecimal)
        else
            q <= d;
    end
endmodule