module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out);

    // State encoding
    parameter A = 4'b0001;
    parameter B = 4'b0010;
    parameter C = 4'b0100;
    parameter D = 4'b1000;

    // State transition logic
    assign next_state[A] = (state == A && in == 0) || (state == C && in == 0);
    assign next_state[B] = (state == A && in == 1) || (state == B && in == 1) || (state == D && in == 1);
    assign next_state[C] = (state == B && in == 0) || (state == D && in == 0);
    assign next_state[D] = (state == C && in == 1);

    // Output logic
    assign out = (state == D);

endmodule