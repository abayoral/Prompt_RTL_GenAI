module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); 

    // Define state parameters with one-hot encoding
    parameter A=4'b0001, B=4'b0010, C=4'b0100, D=4'b1000;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state = (state == A && in == 0) ? A :
                        (state == A && in == 1) ? B :
                        (state == B && in == 0) ? C :
                        (state == B && in == 1) ? B :
                        (state == C && in == 0) ? A :
                        (state == C && in == 1) ? D :
                        (state == D && in == 0) ? C :
                        (state == D && in == 1) ? B : 4'b0000;

    // Output logic: 
    assign out = (state == D);

endmodule