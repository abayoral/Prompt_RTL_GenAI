module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done);

    // State Definitions
    typedef enum logic [1:0] {
        IDLE,
        BYTE1,
        BYTE2,
        BYTE3
    } state_t;
    
    state_t current_state, next_state;
    
    // Datapath registers
    reg [23:0] message;
    
    // State Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    // FSM Logic
    always_comb begin
        next_state = current_state;
        done = 1'b0;
        case (current_state)
            IDLE: begin
                if (in[3])
                    next_state = BYTE1;
            end
            BYTE1: begin
                next_state = BYTE2;
            end
            BYTE2: begin
                next_state = BYTE3;
            end
            BYTE3: begin
                next_state = IDLE;
                done = 1'b1;
            end
        endcase
    end
    
    // Datapath to capture the incoming bytes
    always_ff @(posedge clk) begin
        if (reset) begin
            message <= 24'h0;
            out_bytes <= 24'h0;
        end else begin
            case (current_state)
                IDLE: begin
                    // Do nothing
                end
                BYTE1: begin
                    message[23:16] <= in;
                end
                BYTE2: begin
                    message[15:8] <= in;
                end
                BYTE3: begin
                    message[7:0] <= in;
                end
            endcase
            if (done)
                out_bytes <= message;
        end
    end
endmodule