module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); 

    // FSM state definitions
    typedef enum logic [1:0] {
        IDLE    = 2'b00,
        START   = 2'b01,
        DATA    = 2'b10,
        STOP    = 2'b11
    } state_t;
    
    state_t state, next_state;
    reg [2:0] bit_count;
    reg [7:0] shift_reg;

    // State transition logic
    always_ff @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Datapath logic and state transition conditions
    always_ff @(posedge clk) begin
        if (reset) begin
            out_byte <= 8'b0;
            done <= 1'b0;
            bit_count <= 3'b0;
            shift_reg <= 8'b0;
        end else begin
            case(state)
                IDLE: begin
                    done <= 1'b0;  // clear done flag
                    if (in == 1'b0) begin   // Start bit detected
                        next_state <= START;
                    end else begin
                        next_state <= IDLE;
                    end
                end
                
                START: begin
                    if (in == 1'b0) begin   // Confirm it's still the start bit
                        next_state <= DATA;
                        bit_count <= 3'b0;
                    end else begin
                        next_state <= IDLE; // False start
                    end
                end
                
                DATA: begin
                    shift_reg <= {in, shift_reg[7:1]}; // LSB first reception
                    if (bit_count == 3'd7) begin   // All 8 bits received
                        next_state <= STOP;
                    end else begin
                        bit_count <= bit_count + 3'b1;
                    end
                end
                
                STOP: begin
                    if (in == 1'b1) begin   // Stop bit detected
                        out_byte <= shift_reg;
                        done <= 1'b1; // Indicate byte received
                        next_state <= IDLE;
                    end else begin
                        next_state <= IDLE; // Invalid stop bit, reset and look for next start
                    end
                end
                
                default: next_state <= IDLE;
            endcase
        end
    end
endmodule