module top_module (
    input clk,    // Clock signal
    input d,      // Data input
    output reg q  // Data output
);

    // Flip-flop logic: Capture d at the rising edge of clk
    always @(posedge clk) begin
        q <= d;
    end
    
endmodule