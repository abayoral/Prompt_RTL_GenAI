module top_module (
    input wire clk,
    input wire d,
    output reg q
);
    // Flip-flop logic: Capture d at the positive edge of clk
    always @(posedge clk) begin
        q <= d;
    end
endmodule