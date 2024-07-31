module top_module(
    input wire clk,
    input wire resetn,
    input wire [1:0] byteena,
    input wire [15:0] d,
    output reg [15:0] q
);
    // D flip-flop logic for 16-bit register with byte-enable and synchronous, active-low reset
    always @(posedge clk) begin
        if (!resetn) begin
            // Reset all flip-flops to 0 when resetn is low
            q <= 16'b0;
        end else begin
            // Condition to update the upper 8 bits if byteena[1] is high
            if (byteena[1])
                q[15:8] <= d[15:8];
            // Condition to update the lower 8 bits if byteena[0] is high
            if (byteena[0])
                q[7:0] <= d[7:0];
        end
    end
endmodule