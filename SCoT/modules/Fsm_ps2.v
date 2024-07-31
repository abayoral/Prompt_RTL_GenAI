module top_module (
    input wire clk,
    input wire reset,
    input wire [7:0] in,
    output reg done
);
    // State declarations
    typedef enum reg [1:0] {
        IDLE  = 2'b00,  // Waiting for the start of a message
        BYTE1 = 2'b01,  // First byte of the message detected
        BYTE2 = 2'b10,  // Second byte of the message
        BYTE3 = 2'b11   // Third byte of the message
    } state_t;
    
    // Current state and next state registers
    reg [1:0] current_state, next_state;
    
    // State transition logic (combinational)
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (in[3] == 1'b1) begin
                    next_state = BYTE1;
                end else begin
                    next_state = IDLE;
                end
                done = 1'b0;
            end
            
            BYTE1: begin
                next_state = BYTE2;
                done = 1'b0;
            end
            
            BYTE2: begin
                next_state = BYTE3;
                done = 1'b0;
            end
            
            BYTE3: begin
                next_state = IDLE;
                done = 1'b1;  // Assert 'done' when in BYTE3
            end
            
            default: begin
                next_state = IDLE;
                done = 1'b0;
            end
        endcase
    end
    
    // State flip-flops (sequential logic)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end
    
endmodule