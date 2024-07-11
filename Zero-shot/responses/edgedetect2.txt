module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    // A register to hold the previous state of in
    reg [7:0] prev_in;
 
    always @(posedge clk) begin
        // Detect any edge
        anyedge = (in ^ prev_in) & in;
 
        // Save the current state of in
        prev_in = in;
    end
 
endmodule