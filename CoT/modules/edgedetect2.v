module top_module (
        input wire clk,
        input wire [7:0] in,
        output reg [7:0] anyedge
    );
        // Intermediate signal to keep the last state of in
        reg [7:0] in_last;

        // Update in_last with in at every rising edge of clk
        always @(posedge clk) begin
            in_last <= in;
        end

        // Detect a 0 to 1 transition in in and set the corresponding anyedge bit
        always @(posedge clk) begin
            anyedge <= (in_last ^ in) & in;  // anyedge bit is set if in changes from 0 to 1
        end
    endmodule