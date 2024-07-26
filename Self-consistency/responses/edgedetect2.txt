module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    
    reg [7:0] in_prev;
    
    always @(posedge clk) 
    begin
        anyedge <= (in ^ in_prev) & in;  // Detect edge and check if input is 1
        in_prev <= in;   // Memorize the current input for the next clock cycle
    end

endmodule