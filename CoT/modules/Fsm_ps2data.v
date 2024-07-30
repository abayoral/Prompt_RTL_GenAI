module top_module (
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done
);
    // Define states
    typedef enum reg [1:0] {
        IDLE = 2'b00,
        BYTE1 = 2'b01,
        BYTE2 = 2'b10,
        DONE = 2'b11
    } state_t;

    state_t state, next_state;
    reg [7:0] byte1, byte2, byte3;

    // State transition logic
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        done = 0;
        next_state = state;

        case (state)
            IDLE: begin
                if (in[3]) // Bit 3 of the first byte should be 1
                    next_state = BYTE1;
            end
            BYTE1: begin
                next_state = BYTE2;
            end
            BYTE2: begin
                next_state = DONE;
            end
            DONE: begin
                done = 1;
                next_state = IDLE; // Go back to IDLE after done
            end
        endcase
    end

    // Datapath logic to capture bytes
    always @(posedge clk) begin
        if (reset) begin
            byte1 <= 0;
            byte2 <= 0;
            byte3 <= 0;
        end
        else begin
            case (next_state)
                BYTE1: byte1 <= in;
                BYTE2: byte2 <= in;
                DONE: byte3 <= in;
            endcase
        end
    end

    // Output assignment
    always @(*) begin
        if (state == DONE) begin
            out_bytes = {byte1, byte2, byte3};
        end
        else begin
            out_bytes = 24'b0; // Don't-care output (can be optimized depending on use-case)
        end
    end

endmodule