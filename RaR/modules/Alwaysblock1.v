module top_module(
    input a, 
    input b,
    output wire out_assign,       // Output signal using assign statement
    output reg out_alwaysblock    // Output signal using always block
);

    // Implement AND gate using assign statement
    assign out_assign = a & b;

    // Implement AND gate using a combinational always block
    always @(*) begin
        out_alwaysblock = a & b;
    end

endmodule