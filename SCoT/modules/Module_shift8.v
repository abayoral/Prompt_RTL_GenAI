module top_module (
    input wire clk,
    input wire [7:0] d,
    input wire [1:0] sel,
    output reg [7:0] q
);
    // Intermediate signals to hold the outputs of each my_dff8 instance
    wire [7:0] q0, q1, q2;

    // Instantiate three my_dff8 modules
    my_dff8 dff0 (.clk(clk), .d(d), .q(q0));
    my_dff8 dff1 (.clk(clk), .d(q0), .q(q1));
    my_dff8 dff2 (.clk(clk), .d(q1), .q(q2));

    // Multiplexer to select the output based on sel
    always @(*) begin
        case (sel)
            2'b00: q = d;   // No delay
            2'b01: q = q0;  // 1 clock cycle delay
            2'b10: q = q1;  // 2 clock cycle delay
            2'b11: q = q2;  // 3 clock cycle delay
            default: q = 8'b0; // Default case (to handle any unforeseen conditions)
        endcase
    end
endmodule