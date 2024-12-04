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
        RECEIVE,
        STOP
    } state_t;

    state_t current_state, next_state;
    
    reg [2:0] bit_count; // Counter to keep track of the number of received bits
    reg [7:0] shift_reg; // Shift register to store the received bits
    
    // FSM Next State Logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (in == 1'b0) // Start bit detected (0)
                    next_state = START;
                else
                    next_state = IDLE;
            end
            START: begin
                next_state = RECEIVE;
            end
            RECEIVE: begin
                if (bit_count == 3'd7)
                    next_state = STOP;
                else
                    next_state = RECEIVE;
            end
            STOP: begin
                if (in == 1'b1) // Stop bit detected (1)
                    next_state = IDLE;
                else
                    next_state = STOP; // Wait for a valid stop bit
            end
            default: next_state = IDLE;
        endcase
    end
    
    // FSM State Register and Output Logic
    always @(posedge clk) begin
        if (reset) begin
            current_state <= IDLE;
            bit_count <= 3'd0;
            shift_reg <= 8'd0;
            done <= 1'b0;
        end
        else begin
            current_state <= next_state;
            case (current_state)
                IDLE: begin
                    done <= 1'b0;
                    bit_count <= 3'd0;
                end
                START: begin
                    bit_count <= 3'd0;
                end
                RECEIVE: begin
                    shift_reg <= {in, shift_reg[7:1]}; // Shift in the incoming bit
                    bit_count <= bit_count + 3'd1;
                end
                STOP: begin
                    if (in == 1'b1) begin
                        out_byte <= shift_reg; // Transfer the received byte to the output
                        done <= 1'b1;
                    end
                    else begin
                        done <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule