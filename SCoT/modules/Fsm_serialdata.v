module top_module (
    input wire clk,
    input wire reset,
    input wire in,
    output reg [7:0] out_byte,
    output reg done
);

    // FSM State declarations
    typedef enum reg [2:0] {
        IDLE,   // Waiting for start bit
        START,  // Detected start bit, begin reading byte
        DATA,   // Reading data bits
        STOP    // Verifying stop bit and finalizing
    } state_t;
    
    state_t current_state, next_state;
    
    reg [2:0] bit_counter; // Counter for 8 data bits
    reg [7:0] shift_reg;   // Shift register to collect bits

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            bit_counter <= 0;
            shift_reg <= 0;
        end else begin
            current_state <= next_state;
            if (current_state == DATA) begin
                shift_reg <= { in, shift_reg[7:1] }; // Shift in the new data bit
                bit_counter <= bit_counter + 1;
            end else if (current_state == IDLE || current_state == STOP) begin
                bit_counter <= 0;
            end
        end
    end

    // Next state logic
    always @(*) begin
        next_state = current_state; // Default to the current state
        done = 0;

        case (current_state)
            IDLE: if (in == 0)        // Detect start bit (0)
                      next_state = START;
            START: next_state = DATA; // Move to data reception
            DATA: if (bit_counter == 3'd7)
                      next_state = STOP;
            STOP: if (in == 1)        // Verify stop bit (1)
                      next_state = IDLE;
                  else
                      next_state = IDLE; // If stop bit is incorrect, restart (could be a RESET state instead)
        endcase
        
        // Assert done and load out_byte in STOP state when stop bit is valid
        if (current_state == STOP && in == 1) begin
            out_byte = shift_reg;
            done = 1;
        end
    end
endmodule