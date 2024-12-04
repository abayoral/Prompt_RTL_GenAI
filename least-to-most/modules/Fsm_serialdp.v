module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
);

    // States for the FSM
    typedef enum reg [2:0] {
        IDLE,
        START,
        DATA,
        PARITY,
        STOP,
        WAIT_FOR_STOP
    } state_t;

    state_t state, next_state;
    reg [3:0] bit_count;
    reg [7:0] data_buffer;
    wire odd;

    // Instantiate the parity checker module
    parity p1 (
        .clk(clk),
        .reset(reset | (state == IDLE)), // Reset on global reset or when entering IDLE
        .in(in),
        .odd(odd)
    );

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            data_buffer <= 8'b0;
            out_byte <= 8'b0;
            done <= 0;
        end else begin
            state <= next_state;

            if (state == DATA) begin
                data_buffer <= {in, data_buffer[7:1]};
            end

            if (state == STOP) begin
                out_byte <= data_buffer;
            end
        end
    end

    always @(*) begin
        next_state = state;
        done = 0;
        
        case (state)
            IDLE: begin
                if (in == 0)
                    next_state = START;
            end

            START: begin
                if (bit_count == 0)
                    next_state = DATA;
            end

            DATA: begin
                if (bit_count == 8)
                    next_state = PARITY;
            end

            PARITY: begin
                if (odd == 1 && in == 1)  // both parity must be odd and start receiving stop bit
                    next_state = STOP;
                else if (odd == 0 || in == 0)
                    next_state = WAIT_FOR_STOP;
            end

            STOP: begin
                if (in == 1) begin // Stop bit correct
                    done = 1;
                    next_state = IDLE;
                end else
                    next_state = WAIT_FOR_STOP;
            end

            WAIT_FOR_STOP: begin
                if (in == 1)
                    next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk) begin
        if (reset || state == IDLE || state == START) begin
            bit_count <= 0;
        end else if ((state == DATA) || (state == PARITY)) begin
            bit_count <= bit_count + 1;
        end
    end

endmodule