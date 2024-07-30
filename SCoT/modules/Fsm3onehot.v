module top_module (
    input wire in,
    input wire [3:0] state, // One-hot encoded current state
    output wire [3:0] next_state, // One-hot encoded next state
    output wire out // Output based on current state
);
    // Next state logic based on the given state transition table
    assign next_state[0] = (state[0] && (in == 0)) || (state[2] && (in == 0)); // next_state[A]
    assign next_state[1] = (state[0] && (in == 1)) || (state[3] && (in == 1)); // next_state[B]
    assign next_state[2] = (state[1] && (in == 0)) || (state[3] && (in == 0)); // next_state[C]
    assign next_state[3] = (state[2] && (in == 1)); // next_state[D]

    // Output logic: out is 1 if the current state is D, otherwise 0
    assign out = state[3];

endmodule