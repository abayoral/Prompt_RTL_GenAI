module top_module(
    input wire a,
    input wire b,
    input wire sel_b1,
    input wire sel_b2,
    output wire out_assign,
    output reg out_always
); 

    // Multiplexer logic using assign statements
    assign out_assign = (sel_b1 && sel_b2) ? b : a;

    // Multiplexer logic using an always block and if statement
    always @(*) begin
        if (sel_b1 && sel_b2)
            out_always = b;
        else
            out_always = a;
    end

endmodule