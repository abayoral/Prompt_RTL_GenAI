module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
   
    // State Declaration
    typedef enum logic [2:0] {
        IDLE, START, DATA, STOP, DONE
    } state_t;
    
    state_t state, next_state;
    logic [2:0] bit_count;
    logic done_reg;
    
    // State Transition Logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            done_reg <= 0;
        end else begin
            state <= next_state;
            if (state == DATA)
                bit_count <= bit_count + 1;
            else if (state != DATA)
                bit_count <= 0;
            
            if (state == DONE)
                done_reg <= 1;
            else
                done_reg <= 0;
        end
    end
    
    // Next State Logic
    always_comb begin
        done = done_reg;
        next_state = state;
        case (state)
            IDLE: begin
                if (in == 0)
                    next_state = START;
            end
            START: begin
                next_state = DATA;
            end
            DATA: begin
                if (bit_count == 7)
                    next_state = STOP;
            end
            STOP: begin
                if (in == 1)
                    next_state = DONE;
                else if (in == 0)
                    next_state = IDLE;
            end
            DONE: begin
                if (in == 1)
                    next_state = IDLE;
            end
        endcase
    end
    
endmodule