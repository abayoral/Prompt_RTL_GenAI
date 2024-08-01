module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); 

    // State encoding
    typedef enum reg [1:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;

    state_t state, next_state;
    
    reg [7:0] data_shift_reg;
    reg [2:0] bit_count;

    // State transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                done = 0;
                if (in == 0) // Detect start bit
                    next_state = START;
                else
                    next_state = IDLE;
            end
            START: begin
                done = 0;
                next_state = DATA;
            end
            DATA: begin
                done = 0;
                if (bit_count == 3'd7)
                    next_state = STOP;
                else
                    next_state = DATA;
            end
            STOP: begin
                if (in == 1) begin // Detect stop bit
                    done = 1;
                    next_state = IDLE;
                end else begin
                    done = 0;
                    next_state = STOP;
                end
            end
            default: begin
                done = 0;
                next_state = IDLE;
            end
        endcase
    end

    // Data path
    always @(posedge clk) begin
        if (reset) begin
            data_shift_reg <= 8'b0;
            bit_count <= 3'b0;
            out_byte <= 8'b0;
        end else if (state == DATA) begin
            data_shift_reg <= {in, data_shift_reg[7:1]}; // Shift in the incoming serial bit
            bit_count <= bit_count + 1;
        end else if (state == STOP && in == 1) begin
            out_byte <= data_shift_reg; // Load the received byte to output
            bit_count <= 3'b0;
        end else begin
            bit_count <= bit_count; // Maintain bit count
        end
    end
    
    // Set done signal
    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
        end else if (next_state == IDLE && state == STOP) begin
            done <= 1;
        end else begin
            done <= 0;
        end
    end

endmodule