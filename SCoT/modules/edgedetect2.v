module top_module (
    input wire clk,
    input wire [7:0] in,
    output reg [7:0] anyedge
);
    reg [7:0] prev_in;

    // Edge detection logic: Check for changes from 0 to 1 and update anyedge
    always @(posedge clk) begin
        anyedge <= in & ~prev_in;
        prev_in <= in;
    end
endmodule