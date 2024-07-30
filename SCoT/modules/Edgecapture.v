module top_module (
    input wire clk,
    input wire reset,
    input wire [31:0] in,
    output reg [31:0] out
);

    reg [31:0] previous_state;

    always @(posedge clk) begin
        if (reset) begin
            out <= 32'b0; // Reset all bits in the output register to 0
        end else begin
            for (integer i = 0; i < 32; i = i + 1) begin
                if (previous_state[i] == 1'b1 && in[i] == 1'b0) begin
                    out[i] <= 1'b1; // Set the corresponding output bit if a 1 to 0 transition is detected
                end
            end
            previous_state <= in; // Update previous_state with the current input vector
        end
    end

endmodule