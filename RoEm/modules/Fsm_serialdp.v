module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); //
    
    // State machine states
    typedef enum reg [3:0] {
        IDLE,
        START,
        DATA,
        PARITY,
        STOP,
        DONE,
        ERROR
    } state_t;

    state_t current_state, next_state;
    reg [3:0] bit_count;        // Counts bits received (0-9 for start, 8 data, parity)
    reg [7:0] byte_data;        // Store the 8-bit data received
    reg stop_bit;               // Store the stop bit
    reg parity_check;           // To verify the received parity bit
    wire calculated_parity;     // Output from the parity module

    // Parity module instantiation
    parity u_parity (
        .clk(clk),
        .reset(reset | (current_state == IDLE)), // Reset parity when in IDLE state
        .in(in),
        .odd(calculated_parity)
    );

    // State transition logic
    always @(posedge clk) begin
        if (reset) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // State machine
    always @(*) begin
        next_state = current_state; // Default to the same state
        done = 1'b0;
        case (current_state)
            IDLE: begin
                if (in == 1'b0)  // Start bit detected
                    next_state = START;
            end
            START: begin
                next_state = DATA;
            end
            DATA: begin
                if (bit_count == 8) // Last data bit
                    next_state = PARITY;
            end
            PARITY: begin
                next_state = STOP;
            end
            STOP: begin
                if (in == 1'b1)  // Stop bit detected
                    next_state = calculated_parity ? DONE : ERROR;
                else
                    next_state = ERROR;
            end
            DONE: begin
                done = 1'b1;      // Byte received correctly
                next_state = IDLE;
            end
            ERROR: begin
                next_state = IDLE; // Wait for the next valid start bit
            end
        endcase
    end

    // Datapath operations
    always @(posedge clk) begin
        if (reset) begin
            bit_count <= 4'b0;
            out_byte <= 8'b0;
            byte_data <= 8'b0;
            stop_bit <= 1'b0;
        end else begin
            case (current_state)
                IDLE: begin
                    bit_count <= 4'b0;
                    byte_data <= 8'b0;
                end
                START: begin
                    if (bit_count < 4'b1001) bit_count <= bit_count + 1'b1; // Increment bit count
                end
                DATA: begin
                    if (bit_count < 4'b1001) begin
                        byte_data[bit_count] <= in;
                        bit_count <= bit_count + 1'b1;
                    end
                    if (bit_count == 8'd7) begin
                        out_byte <= {in, byte_data[7:1]}; // Capture the whole byte
                    end
                end
                PARITY: begin
                    parity_check <= in;
                end
                STOP: begin
                    stop_bit <= in;
                end
                DONE: begin
                    done <= 1'b1;
                end
                ERROR: begin
                    done <= 1'b0;
                end
            endcase
        end
    end

endmodule