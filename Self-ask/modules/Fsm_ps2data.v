module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done
);

    typedef enum reg [1:0] {IDLE, BYTE1, BYTE2, BYTE3} state_t;
    state_t current_state, next_state;

    reg [23:0] byte_buffer;

    // FSM state transitions
    always @(posedge clk) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // FSM next state logic and outputs
    always @(*) begin
        // Default outputs
        done = 0;
        next_state = current_state;
        
        case (current_state)
            IDLE: begin
                if (in[3]) // bit[3] is 1
                    next_state = BYTE1;
            end
            BYTE1: begin
                next_state = BYTE2;
            end
            BYTE2: begin
                next_state = BYTE3;
            end
            BYTE3: begin
                done = 1; // Signal receipt of a complete message
                next_state = IDLE; // Reset FSM to look for new message
            end
        endcase
    end

    // Datapath to store incoming bytes
    always @(posedge clk) begin
        if (reset) begin
            byte_buffer <= 24'b0;
        end else begin
            case (next_state)
                BYTE1: byte_buffer[23:16] <= in; // Store first byte
                BYTE2: byte_buffer[15:8] <= in;  // Store second byte
                BYTE3: byte_buffer[7:0] <= in;   // Store third byte
            endcase
        end
    end

    // Output message
    always @(posedge clk) begin
        if (done)
            out_bytes <= byte_buffer;
        else
            out_bytes <= 24'b0; // Don't care
    end
    
endmodule