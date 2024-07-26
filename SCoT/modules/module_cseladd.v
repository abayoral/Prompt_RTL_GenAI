module top_module(
        input wire [31:0] A,
        input wire [31:0] B,
        output wire [31:0] Sum
    );
        wire [15:0] cin;
        wire [15:0] add1_sum, add2_sum, add3_sum, add2_cout, add3_cout, out;

        // declare adder instances
        my_16bit_adder adder1 (.A(A[15:0]), .B(B[15:0]), .sum(add1_sum), .cout(cin));
        my_16bit_adder adder2 (.A(A[31:16]), .B(B[31:16]), .sum(add2_sum), .cout(add2_cout));
        my_16bit_adder adder3 (.A(A[31:16] + 16'b0000000000000001), .B(B[31:16]), .sum(add3_sum), .cout(add3_cout));

        // declare mux instance
        mux mux1 (.A(add2_sum), .B(add3_sum), .sel(cin), .out(out));

        assign Sum = {out, add1_sum};
    endmodule