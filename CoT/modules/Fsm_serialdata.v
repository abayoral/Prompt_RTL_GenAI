module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
);

    // State declarations
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        START = 2'b01,
        RECEIVE = 2'b10,
        STOP = 2'b11
    } state_t;
    
    state_t state, next_state;
    
    reg [7:0] data_reg;
    reg [2:0] bit_count;  // To count the received bits
    
    // FSM and control logic
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            out_byte <= 8'd0;
            done <= 0;
            data_reg <= 8'd0;
            bit_count <= 3'd0;
        end else begin
            state <= next_state;

            // Output and intermediate signal updates
            case (state)
                IDLE: begin
                    done <= 0;
                    if (in == 0)  // Detected start bit
                        next_state <= START;
                    else
                        next_state <= IDLE;
                end

                START: begin
                    bit_count <= 3'd0;
                    data_reg <= 8'd0;
                    next_state <= RECEIVE;
                end

                RECEIVE: begin
                    data_reg[bit_count] <= in;
                    bit_count <= bit_count + 1;

                    if (bit_count == 3'd7)  // All 8 bits received
                        next_state <= STOP;
                    else
                        next_state <= RECEIVE;
                end

                STOP: begin
                    if (in == 1) begin  // Stop bit is correct
                        out_byte <= data_reg;
                        done <= 1;
                        next_state <= IDLE;
                    end else begin  // Stop bit is incorrect, wait for next stop bit
                        next_state <= STOP;
                    end
                end
            endcase
        end
    end

endmodule