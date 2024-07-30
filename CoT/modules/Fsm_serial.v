module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
);
    // States
    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        STOP,
        DONE
    } state_t;
    
    state_t state, next_state;
    reg [3:0] bit_count; // To count the data bits

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (~in) // Start bit detected
                    next_state = START;
                else
                    next_state = IDLE;
            end
            START: next_state = DATA;
            DATA: begin
                if (bit_count == 4'd8)
                    next_state = STOP;
                else
                    next_state = DATA;
            end
            STOP: begin
                if (in) // Stop bit must be 1
                    next_state = DONE;
                else
                    next_state = IDLE; // Wait until a stop bit is detected
            end
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output and Data bit counting logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            done <= 1'b0;
            bit_count <= 4'd0;
        end else begin
            done <= 1'b0;
            case (state)
                IDLE: bit_count <= 4'd0;
                START: bit_count <= 4'd0;
                DATA: bit_count <= bit_count + 1;
                STOP: ; // No change in bit_count
                DONE: done <= 1'b1; // Indicate a byte has been received
                default: ;
            endcase
        end
    end
endmodule