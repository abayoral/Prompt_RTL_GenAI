module top_module (
    input wire clk,
    input wire in,
    input wire reset,
    output reg [7:0] out_byte,
    output reg done
);

    // FSM states
    typedef enum reg [2:0] {
        IDLE,
        RECEIVE_DATA,
        RECEIVE_PARITY,
        CHECK_STOP_BIT
    } fsm_state_t;
    
    fsm_state_t state, next_state;

    // Bit counters and data storage
    reg [2:0] bit_counter;
    reg [7:0] data_byte;
    reg received_parity;
    wire odd_parity_calc;

    // Parity Calculation Module
    assign odd_parity_calc = ^data_byte;

    // FSM State Transition
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_counter <= 0;
            data_byte <= 0;
            received_parity <= 0;
            done <= 0;
        end else begin
            state <= next_state;
        end
    end

    // Next State Logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (in == 0) // Detect start bit
                    next_state = RECEIVE_DATA;
            end
            RECEIVE_DATA: begin
                if (bit_counter == 3'd7)
                    next_state = RECEIVE_PARITY;
            end
            RECEIVE_PARITY: begin
                next_state = CHECK_STOP_BIT;
            end
            CHECK_STOP_BIT: begin
                next_state = IDLE;
            end
        endcase
    end

    // FSM Outputs and Data Reception Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out_byte <= 0;
            received_parity <= 0;
            data_byte <= 0;
            bit_counter <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    bit_counter <= 0;
                    done <= 0;
                end
                RECEIVE_DATA: begin
                    data_byte[bit_counter] <= in; // Shift in data bits
                    bit_counter <= bit_counter + 1;
                end
                RECEIVE_PARITY: begin
                    received_parity <= in; // Capture parity bit
                end
                CHECK_STOP_BIT: begin
                    if (in == 1 && (received_parity == odd_parity_calc)) begin
                        out_byte <= data_byte;
                        done <= 1;
                    end else begin
                        done <= 0; // Parity or stop bit error
                    end
                end
            endcase
        end
    end

endmodule