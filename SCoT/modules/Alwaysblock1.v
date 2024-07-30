module top_module (
    input wire a,
    input wire b,
    output wire out_assign,
    output reg out_alwaysblock
);

    // Using an assign statement to drive out_assign
    assign out_assign = a & b;

    // Using a combinational always block to drive out_alwaysblock
    always @(a or b) begin
        out_alwaysblock = a & b;
    end

endmodule