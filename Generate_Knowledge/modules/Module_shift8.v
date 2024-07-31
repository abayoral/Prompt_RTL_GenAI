module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0] q1, q2, q3;

    // Instantiate three my_dff8 modules
    my_dff8 dff0 ( .clk(clk), .d(d), .q(q1) );
    my_dff8 dff1 ( .clk(clk), .d(q1), .q(q2) );
    my_dff8 dff2 ( .clk(clk), .d(q2), .q(q3) );

    // 4-to-1 Multiplexer
    always @(*) begin
        case (sel)
            2'd0: q = d;     // No delay (input d)
            2'd1: q = q1;    // After 1 cycle
            2'd2: q = q2;    // After 2 cycles
            2'd3: q = q3;    // After 3 cycles
            default: q = d;  // Default case to handle unspeciﬁed select values
        endcase
    end
endmodule