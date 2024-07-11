module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] old_in;
    
    always @(posedge clk) begin
        for(int i = 0; i < 8; i = i + 1) begin
            anyedge[i] <= (old_in[i] ^ in[i]) ? 1 : 0;
        end
        old_in <= in;
    end
    
endmodule