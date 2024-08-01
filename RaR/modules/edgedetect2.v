module top_module (
    input clk,      // Clock signal
    input [7:0] in, // 8-bit input vector
    output reg [7:0] anyedge // 8-bit output vector indicating 0 to 1 transitions
); 

    reg [7:0] prev_in;

    always @(posedge clk) begin
        anyedge <= (in & ~prev_in);
        prev_in <= in;
    end

endmodule