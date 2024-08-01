module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] in_delayed;

    always @(posedge clk) begin
        // Detection of any edge from the previous clock cycle
        anyedge <= (in & ~in_delayed);
        // Update the delayed version of the input
        in_delayed <= in;
    end

endmodule