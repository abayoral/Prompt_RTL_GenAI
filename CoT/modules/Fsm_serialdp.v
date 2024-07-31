module top_module (
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); 
    // FSM states
    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        PARITY,
        STOP,
        DONE
    } state_t;
    state_t state, next_state;

    // Using a shift register to store incoming bits
    reg [8:0] shift_reg;
    reg [3:0] bit_counter;
    wire odd_parity;

    // Parity module
    parity parity_module (
        .clk(clk),
        .reset(state == IDLE || state == DONE),
        .in(in),
        .odd(odd_parity)
    );

    // FSM transition logic
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            shift_reg <= 9'b0;
            bit_counter <= 0;
            done <= 0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        // Default next state and outputs
        next_state = state;
        done = 0;
        case(state)
            IDLE: begin
                if (in == 0) // Detect start bit
                    next_state = START;
            end
            START: begin
                next_state = DATA;
                bit_counter = 0;
            end
            DATA: begin
                if (bit_counter < 8) begin
                    next_state = DATA;
                end else begin
                    next_state = PARITY;
                end
            end
            PARITY: begin
                next_state = STOP;
            end
            STOP: begin
                if (in == 1) begin // Stop bit should be 1
                    if (odd_parity) begin
                        next_state = DONE;
                        done = 1;
                    end else begin
                        next_state = IDLE;
                    end 
                end else begin // Wait for correct stop bit
                    next_state = IDLE;
                end
            end
            DONE: begin
                out_byte = shift_reg[7:0];
                done = 1;
                next_state = IDLE;
            end
        endcase
    end

    // Shift register and bit counter
    always @(posedge clk) begin
        if (reset) begin
            shift_reg <= 9'b0;
            bit_counter <= 0;
        end else begin
            if (state == DATA) begin
                shift_reg <= {in, shift_reg[8:1]};
                bit_counter <= bit_counter + 1;
            end else if (state == PARITY) begin
                shift_reg[8] <= in; // Parity bit
            end
        end
    end

endmodule