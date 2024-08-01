module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done
);

    // State enumeration
    typedef enum logic [1:0] {
        IDLE,       // Waiting for the first byte with bit[3] = 1
        BYTE1,      // Received the first byte
        BYTE2,      // Received the second byte
        BYTE3       // Received the third byte
    } state_t;
    
    state_t state, next_state;

    // Registers to hold received bytes
    reg [7:0] byte1, byte2, byte3;
    
    // FSM next state logic
    always @(*) begin
        case(state)
            IDLE:   if (in[3]) next_state = BYTE1; else next_state = IDLE;
            BYTE1:  next_state = BYTE2;
            BYTE2:  next_state = BYTE3;
            BYTE3:  next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // FSM state transition and output logic
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            byte1 <= 0;
            byte2 <= 0;
            byte3 <= 0;
            done <= 0;
        end else begin
            state <= next_state;
        end
        
        // Datapath to store the incoming bytes and generate out_bytes
        done <= 0;
        case(state)
            IDLE: begin
                if (in[3]) begin
                    byte1 <= in;
                end
            end
            BYTE1: begin
                byte2 <= in;
            end
            BYTE2: begin
                byte3 <= in;
            end
            BYTE3: begin
                out_bytes <= {byte1, byte2, byte3};
                done <= 1;
            end
        endcase
    end

endmodule