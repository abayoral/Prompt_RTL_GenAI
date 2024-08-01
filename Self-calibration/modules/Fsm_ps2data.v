module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done);

    // States in the FSM
    typedef enum reg [1:0] {
        IDLE,
        BYTE1,
        BYTE2,
        BYTE3
    } state_t;
    state_t state, next_state;

    // Datapath to store incoming bytes
    reg [7:0] byte1, byte2, byte3;

    // FSM state transition
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // FSM next state logic
    always @(*) begin
        case (state)
            IDLE: 
                if (in[3] == 1'b1)
                    next_state = BYTE1;
                else
                    next_state = IDLE;
            BYTE1: next_state = BYTE2;
            BYTE2: next_state = BYTE3;
            BYTE3: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Datapath to capture incoming bytes and set done signal
    always @(posedge clk) begin
        if (reset) begin
            byte1 <= 8'd0;
            byte2 <= 8'd0;
            byte3 <= 8'd0;
            out_bytes <= 24'd0;
            done <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    byte1 <= 8'd0;
                    byte2 <= 8'd0;
                    byte3 <= 8'd0;
                    done <= 1'b0;
                end
                BYTE1: begin
                    byte1 <= in;
                    done <= 1'b0;
                end
                BYTE2: begin
                    byte2 <= in;
                    done <= 1'b0;
                end
                BYTE3: begin
                    byte3 <= in;
                    out_bytes <= {byte1, byte2, byte3};
                    done <= 1'b1;
                end
                default: begin
                    out_bytes <= 24'd0;
                    done <= 1'b0;
                end
            endcase
        end
    end
endmodule