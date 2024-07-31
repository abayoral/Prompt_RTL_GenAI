module top_module (
    input wire a, // Input a
    input wire b, // Input b
    input wire clk, // Clock input for clocked always block
    output wire out_assign, // Output using assign statement
    output reg out_always_comb, // Output using combinational always block
    output reg out_always_ff // Output using clocked always block
);

    // XOR using assign statement
    assign out_assign = a ^ b;

    // XOR using combinational always block
    always @(*) begin
        out_always_comb = a ^ b;
    end

    // XOR using clocked always block
    always @(posedge clk) begin
        out_always_ff <= a ^ b;
    end

endmodule