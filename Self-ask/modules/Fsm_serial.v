module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
); 
    // State encoding
    typedef enum logic [2:0] {
        IDLE = 3'd0,
        START_BIT = 3'd1,
        DATA_BITS = 3'd2,
        STOP_BIT = 3'd3,
        ERROR = 3'd4
    } state_t;
  
    state_t state, next_state;
    reg [2:0] bit_count;
  
    always_ff @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 3'd0;
        end 
        else begin
            state <= next_state;
            if (state == DATA_BITS)
                bit_count <= bit_count + 1;
            else if (state != DATA_BITS)
                bit_count <= 3'd0;
        end
    end
  
    always_comb begin
        done = 0;
        next_state = state;
        case (state)
            IDLE: begin
                if (in == 0)
                    next_state = START_BIT; // Detect start bit
            end
            
            START_BIT: begin
                next_state = DATA_BITS; // Move to data bits
            end
            
            DATA_BITS: begin
                if (bit_count == 3'd7) // After 8 data bits
                    next_state = STOP_BIT;
            end
            
            STOP_BIT: begin
                if (in == 1) begin
                    done = 1;
                    next_state = IDLE;
                end 
                else begin
                    next_state = ERROR; // Error if stop bit not correct
                end
            end
            
            ERROR: begin
                if (in == 1)
                    next_state = IDLE;
            end
        endcase
    end
    
endmodule