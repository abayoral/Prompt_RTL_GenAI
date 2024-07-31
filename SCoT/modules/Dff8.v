module top_module (
    input wire clk,
    input wire [7:0] d,
    output reg [7:0] q
);
    // D flip-flop logic: Capture d at the rising edge of clk for each bit
    always @(posedge clk) begin
        q <= d;
    end
endmodule