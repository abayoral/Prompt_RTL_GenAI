module top_module(
    input wire clk,
    input wire reset,
    input wire [7:0] in,
    output reg [23:0] out_bytes,
    output reg done
);

    // State encoding
    typedef enum reg [1:0] {
        IDLE   = 2'b00,
        BYTE1  = 2'b01,
        BYTE2  = 2'b10,
        BYTE3  = 2'b11
    } state_t;

    // State variable
    state_t current_state, next_state;
    
    // Temporary storage for bytes
    reg [7:0] byte1, byte2, byte3;

    // Sequential logic for the state transitions and capturing bytes
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            byte1 <= 8'b0;
            byte2 <= 8'b0;
            byte3 <= 8'b0;
            out_bytes <= 24'b0;
            done <= 1'b0;
        end else begin
            current_state <= next_state;

            case (next_state)
                BYTE1: byte1 <= in;
                BYTE2: byte2 <= in;
                BYTE3: begin
                    byte3 <= in;
                    out_bytes <= {byte1, byte2, in};  // Concatenate the 3 bytes
                end
                default: begin
                    byte1 <= byte1;
                    byte2 <= byte2;
                    byte3 <= byte3;
                end
            endcase
        end
    end

    // Combinational logic for the next state and done signal
    always @(*) begin
        next_state = current_state;
        done = 1'b0;

        case (current_state)
            IDLE: begin
                if (in[3] == 1'b1)  // Check if bit[3] of incoming byte is 1
                    next_state = BYTE1;
            end
            BYTE1: begin
                next_state = BYTE2;
            end
            BYTE2: begin
                next_state = BYTE3;
            end
            BYTE3: begin
                done = 1'b1;
                next_state = IDLE;  // Return to IDLE state to capture next message
            end
        endcase
    end

endmodule