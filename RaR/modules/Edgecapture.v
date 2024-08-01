module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] in_prev;

    always @(posedge clk) begin
        if (reset) begin
            out <= 32'b0;
        end
        else begin
            out <= out | (in_prev & ~in); // Set out bit if transition 1->0 detected
        end
        in_prev <= in; // Store previous input state
    end

endmodule