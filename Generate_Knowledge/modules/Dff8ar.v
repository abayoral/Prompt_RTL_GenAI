module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);

always @(posedge clk or posedge areset) begin
    if (areset)
        q <= 8'b0;      // On reset, set all outputs to 0
    else
        q <= d;         // On clock edge, capture input d
end

endmodule