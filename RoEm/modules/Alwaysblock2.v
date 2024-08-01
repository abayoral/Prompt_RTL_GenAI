module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff);

    // XOR gate using assign statement
    assign out_assign = a ^ b;

    // XOR gate using a combinational always block
    always @(*) begin
        out_always_comb = a ^ b;
    end

    // XOR gate using a clocked always block
    always @(posedge clk) begin
        out_always_ff <= a ^ b;
    end

endmodule