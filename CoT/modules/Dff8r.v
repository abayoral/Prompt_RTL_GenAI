module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg [7:0] q
);

    // D flip-flops logic: Capture d at the rising edge of clk if reset is low; else set q to 0
    always @(posedge clk) begin
        if (reset) 
            q <= 8'b00000000;
        else 
            q <= d;
    end

endmodule