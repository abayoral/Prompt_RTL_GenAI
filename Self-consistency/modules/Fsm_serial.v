module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
); 

    // State encoding
    typedef enum logic [3:0] {
        IDLE     = 4'b0000,
        START    = 4'b0001,
        BIT0     = 4'b0010,
        BIT1     = 4'b0011,
        BIT2     = 4'b0100,
        BIT3     = 4'b0101,
        BIT4     = 4'b0110,
        BIT5     = 4'b0111,
        BIT6     = 4'b1000,
        BIT7     = 4'b1001,
        STOP     = 4'b1010,
        DONE     = 4'b1011
    } state_t;

    state_t state, next_state;
    reg [2:0] bit_count;

    // State transition
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 3'b0;
        end
        else begin
            state <= next_state;
            if (next_state == BIT0 || next_state == BIT1 ||
                next_state == BIT2 || next_state == BIT3 ||
                next_state == BIT4 || next_state == BIT5 ||
                next_state == BIT6 || next_state == BIT7) begin
                bit_count <= bit_count + 1;
            end
            else begin
                bit_count <= 0;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                done = 0;
                if (in == 0)
                    next_state = START;
                else
                    next_state = IDLE;
            end
            START: begin
                done = 0;
                next_state = BIT0;
            end
            BIT0: begin
                done = 0;
                if (bit_count < 7)
                    next_state = BIT0 + bit_count + 1;
                else
                    next_state = STOP;
            end
            STOP: begin
                done = 0;
                if (in == 1)
                    next_state = DONE;
                else
                    next_state = IDLE;
            end
            DONE: begin
                done = 1;
                next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
                done = 0;
            end
        endcase
    end

endmodule