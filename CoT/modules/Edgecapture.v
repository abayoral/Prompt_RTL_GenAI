module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] previous_in;

    always @(posedge clk) begin
        if (reset) begin
            out <= 32'b0;
        end else begin
            // Detect 1 to 0 transition for each bit
            out <= out | (previous_in & ~in);
        end
        // Store the current state as the previous state for the next cycle
        previous_in <= in;
    end

endmodule