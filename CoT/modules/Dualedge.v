module top_module (
    input wire clk,
    input wire d,
    output reg q
);

    // Intermediate signals for storing values at different clock edges
    reg q_posedge; // Value at positive edge of the clock
    reg q_negedge; // Value at negative edge of the clock

    // Process for the positive edge of the clock
    always @(posedge clk) begin
        q_posedge <= d;
    end

    // Process for the negative edge of the clock
    always @(negedge clk) begin
        q_negedge <= d;
    end

    // Select the appropriate value of q based on clock edge
    always @(*) begin
        if (clk)
            q = q_negedge; // Use the value captured at the negative edge
        else
            q = q_posedge; // Use the value captured at the positive edge
    end

endmodule