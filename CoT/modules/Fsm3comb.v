module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out
); 
    // State Parameters
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        case (state)
            A: next_state = (in == 0) ? A : B;
            B: next_state = (in == 0) ? C : B;
            C: next_state = (in == 0) ? A : D;
            D: next_state = (in == 0) ? C : B;
            default: next_state = A; // Default case to handle unexpected values
        endcase
    end

    // Output logic: out = f(state) for a Moore state machine
    always @(*) begin
        case (state)
            A: out = 0;
            B: out = 0;
            C: out = 0;
            D: out = 1;
            default: out = 0; // Default case to handle unexpected values
        endcase
    end
endmodule