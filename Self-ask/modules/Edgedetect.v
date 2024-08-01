module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] in_d;

    always @(posedge clk) begin
        in_d <= in; // store the previous state of 'in'
        pedge <= ~in_d & in; // detect the positive edge (0 to 1 transition)
    end

endmodule