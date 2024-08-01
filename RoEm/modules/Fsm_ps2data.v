module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done
);

    typedef enum reg [1:0] {IDLE, BYTE1, BYTE2, BYTE3} state_t;
    state_t state, next_state;
    
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            out_bytes <= 24'b0;
            done <= 1'b0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        done = 1'b0;
        case (state)
            IDLE: begin
                if (in[3] == 1'b1) begin
                    next_state = BYTE1;
                end
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
    
    always @(posedge clk) begin
        if (reset) begin
            out_bytes <= 24'b0;
        end else begin
            case (state)
                BYTE1: begin
                    out_bytes[23:16] <= in;
                end
                BYTE2: begin
                    out_bytes[15:8] <= in;
                end
                BYTE3: begin
                    out_bytes[7:0] <= in;
                end
            endcase
        end
    end

endmodule