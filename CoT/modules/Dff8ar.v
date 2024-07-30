module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);

    // 8 D flip-flops with active high asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 8'b00000000;
        else
            q <= d;
    end

endmodule