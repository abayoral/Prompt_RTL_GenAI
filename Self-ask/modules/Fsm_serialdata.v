module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);

    // State encoding
    typedef enum logic [2:0] {
        IDLE     = 3'b000,
        START    = 3'b001,
        RECEIVE  = 3'b010,
        STOP     = 3'b011,
        ERROR    = 3'b100
    } state_t;
    
    state_t state, next_state;

    reg [7:0] data;
    reg [3:0] bit_counter;  // need 4 bits to count from 0 to 8
    reg done_reg, done_next;
    reg [7:0] out_byte_reg, out_byte_next;

    // State transition logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state and output logic
    always_comb begin
        next_state = state;
        done_next = 0;
        out_byte_next = out_byte_reg;

        case (state)
            IDLE: begin
                if (in == 0) begin
                    next_state = START;
                end
            end
            START: begin
                if (in == 1) begin
                    next_state = RECEIVE;
                    bit_counter = 0;
                    data = 0;
                end
            end
            RECEIVE: begin
                data[bit_counter] = in;

                if (bit_counter == 7) begin
                    next_state = STOP;
                    bit_counter = 0;
                end else begin
                    bit_counter = bit_counter + 1;
                end
            end
            STOP: begin
                if (in == 1) begin
                    next_state = IDLE;
                    out_byte_next = data;
                    done_next = 1;
                end else begin
                    next_state = ERROR;
                end
            end
            ERROR: begin
                if (in == 1) begin
                    next_state = IDLE;
                end
            end
        endcase
    end

    // Output logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            done_reg <= 0;
            out_byte_reg <= 8'b0;
        end else begin
            done_reg <= done_next;
            out_byte_reg <= out_byte_next;
        end
    end

    assign done = done_reg;
    assign out_byte = done_reg ? out_byte_reg : 8'bz;  // Tri-state bus: output valid data only when done is high

endmodule