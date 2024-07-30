module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done
);

    // State definitions
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        BYTE1 = 2'b01,
        BYTE2 = 2'b10,
        DONE = 2'b11
    } state_t;

    state_t state, next_state;

    // State transition logic (combinational)
    always_comb begin
        case (state)
            IDLE: if (in[3] == 1'b1) next_state = BYTE1;
                  else next_state = IDLE;
            BYTE1: next_state = BYTE2;
            BYTE2: next_state = DONE;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // State flip-flops (sequential)
    always_ff @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Output logic
    assign done = (state == DONE);

endmodule