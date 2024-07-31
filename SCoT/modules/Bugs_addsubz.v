module top_module (
    input wire do_sub,           // Control signal to determine operation
    input wire [7:0] a,          // 8-bit input operand a
    input wire [7:0] b,          // 8-bit input operand b
    output reg [7:0] out,        // 8-bit result of the operation
    output reg result_is_zero    // Flag indicating if the result is zero
);

    always @(*) begin
        // Perform the addition or subtraction based on do_sub
        if (do_sub)
            out = a - b;
        else
            out = a + b;

        // Set the result_is_zero flag
        if (out == 8'b00000000)
            result_is_zero = 1'b1;
        else
            result_is_zero = 1'b0;
    end
endmodule