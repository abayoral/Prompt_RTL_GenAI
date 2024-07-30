module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] in_reg;

    always @(posedge clk) begin
        in_reg <= in;
        anyedge <= ({in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]} ^ in_reg);
    end

endmodule