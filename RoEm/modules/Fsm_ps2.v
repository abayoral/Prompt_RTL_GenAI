module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg done); //

    // State encoding
    typedef enum logic [1:0] {
        IDLE = 2'b00,   // Waiting for the first byte with in[3]=1
        BYTE1 = 2'b01,  // Received first byte, waiting for second byte
        BYTE2 = 2'b10,  // Received second byte, waiting for third byte
        DONE = 2'b11    // Successfully received three bytes, signaling done
    } state_t;

    state_t state, next_state;

    // State transition logic (combinational)
    always_comb begin
        next_state = state;  // Default state is to remain unchanged
        done = 1'b0;         // Default done is 0

        case (state)
            IDLE: begin
                if (in[3] == 1'b1)
                    next_state = BYTE1;
            end

            BYTE1: begin
                next_state = BYTE2;
            end

            BYTE2: begin
                next_state = DONE;
            end

            DONE: begin
                done = 1'b1; // Assert done for one cycle
                if (in[3] == 1'b1)
                    next_state = BYTE1;
                else
                    next_state = IDLE;
            end

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

endmodule