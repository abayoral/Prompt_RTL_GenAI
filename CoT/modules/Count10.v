module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q
);
    // Counter logic: increment q on each rising edge of clk; reset q when reset is high
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0000;
        else if (q == 4'b1001) // if q is 9, reset to 0
            q <= 4'b0000;
        else
            q <= q + 1;       // otherwise, increment
    end
endmodule