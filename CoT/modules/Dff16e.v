module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

    // Flip-flop logic: Capture d at the rising edge of clk based on byteena bits
    always @(posedge clk) begin
        if (!resetn) begin
            // Active-low reset: set q to zero when resetn is low
            q <= 16'b0;
        end else begin
            // Write to flip-flops based on byteena signals
            if (byteena[1]) 
                q[15:8] <= d[15:8];

            if (byteena[0])
                q[7:0] <= d[7:0];
        end
    end
endmodule