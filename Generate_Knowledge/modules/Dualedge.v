module top_module (
    input clk,
    input d,
    output q
);

    // Internal signals to capture on positive and negative edges
    reg q_posedge, q_negedge;

    // Capture on positive edge
    always @(posedge clk) begin
        q_posedge <= d;
    end

    // Capture on negative edge
    always @(negedge clk) begin
        q_negedge <= d;
    end

    // Combine the outputs of the two flip-flops using a multiplexer
    assign q = clk ? q_negedge : q_posedge;

endmodule