module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    // XOR using assign statement
    assign out_assign = a ^ b;

    // XOR using combinational always block
    always @(*) begin
        out_always_comb = a ^ b;
    end

    // XOR using clocked always block (rising edge)
    always @(posedge clk) begin
        out_always_ff = a ^ b;
    end

endmodule