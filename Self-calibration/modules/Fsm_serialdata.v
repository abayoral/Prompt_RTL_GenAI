module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    // State encoding
    typedef enum logic[2:0] {
        IDLE,
        START,
        DATA,
        STOP,
        DONE
    } state_t;
    
    // State registers
    state_t state, next_state;
    
    // Datapath registers
    reg [7:0] data_shift_reg;
    reg [2:0] bit_counter;
    reg done_reg;
    reg [7:0] out_byte_reg;

    // Assign outputs
    assign out_byte = out_byte_reg;
    assign done = done_reg;

    // State transition logic
    always_ff @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            data_shift_reg <= 8'b0;
            bit_counter <= 3'b0;
            done_reg <= 1'b0;
        end else begin
            state <= next_state;

            // Datapath operations
            case (state)
                START: data_shift_reg <= 8'b0; // Clear the shift register on new start bit detection
                DATA: data_shift_reg <= {in, data_shift_reg[7:1]}; // Shift in new bit
                DONE: out_byte_reg <= data_shift_reg; // Capture the byte when done
            endcase
            
            if (state == DATA) begin
                bit_counter <= bit_counter + 3'd1;
            end else begin
                bit_counter <= 3'b0;
            end

            if ((state == DONE) || (state == STOP && next_state == DONE)) begin
                done_reg <= 1'b1;
            end else begin
                done_reg <= 1'b0;
            end
        end
    end

    // Next state logic
    always_comb begin
        next_state = state;
        case (state)
            IDLE:   if (~in) next_state = START;  // Look for start bit (in = 0)
            START:  next_state = DATA;            // Move to data receiving state
            DATA:   if (bit_counter == 3'd7) next_state = STOP; // Check if all 8 data bits received
            STOP:   next_state = in ? DONE : IDLE;  // Check for stop bit (in = 1)
            DONE:   next_state = IDLE;            // Go back to IDLE after byte received
            default: next_state = IDLE;
        endcase
    end

endmodule