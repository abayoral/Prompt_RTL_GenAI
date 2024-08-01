module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(negedge clk) begin
        if (reset) 
            q <= 8'h34; // On reset, set q to 0x34
        else 
            q <= d;     // Otherwise, follow input d
    end

endmodule