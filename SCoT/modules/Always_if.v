module top_module (
    input wire a,
    input wire b,
    input wire sel_b1,
    input wire sel_b2,
    output wire out_assign,
    output reg out_always
);
    // Implementing with assign statement
    assign out_assign = (sel_b1 && sel_b2) ? b : a;

    // Implementing with procedural always block
    always @(sel_b1 or sel_b2 or a or b) begin
        if (sel_b1 && sel_b2)
            out_always = b;
        else
            out_always = a;
    end
endmodule