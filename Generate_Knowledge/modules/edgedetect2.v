module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    
    reg [7:0] prev_in; //Store previous input state

    always @(posedge clk) begin
        anyedge <= (in ^ prev_in) & in;  // XOR gives change, AND with the input gives rising edge detection
        prev_in <= in;  //Store input state for next cycle
    end

endmodule