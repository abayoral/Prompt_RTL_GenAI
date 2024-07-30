module top_module (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);
    // Counter logic: Reset q when reset is high, otherwise increment q on each rising edge of clk
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= q + 1;
    end
endmodule