module top_module (
    input wire clk,
    input wire d,
    output reg q
);
    reg q_pos, q_neg;  // Intermediate signals for positive and negative edge capturing
    reg q_internal;    // Intermediate signal for determining the final output

    // Capture value at the rising edge of clk
    always @(posedge clk) begin
        q_pos <= d;
    end

    // Capture value at the falling edge of clk
    always @(negedge clk) begin
        q_neg <= d;
    end

    // Determine q_internal based on the current edge of clk
    always @(posedge clk or negedge clk) begin
        if (clk)  // Rising edge
            q_internal <= q_pos;
        else      // Falling edge
            q_internal <= q_neg;
    end

    // Output assignment
    assign q = q_internal;

endmodule