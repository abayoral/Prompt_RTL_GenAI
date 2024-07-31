module top_module (
    input wire clk,
    input wire [7:0] in,
    output reg [7:0] pedge
);

    // Intermediate signal to store the previous state of 'in'
    reg [7:0] in_prev;

    // Sequential logic to capture positive edge transitions
    always @(posedge clk) begin
        // Detect transitions from 0 to 1
        pedge = (in & ~in_prev);
        
        // Update 'in_prev' to the current state of 'in'
        in_prev <= in;
    end

endmodule