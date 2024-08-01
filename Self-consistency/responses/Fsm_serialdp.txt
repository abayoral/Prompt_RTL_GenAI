module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); 
    reg [3:0] state, next_state;
    reg [7:0] data;
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg stop_bit, parity_bit;
    wire parity_odd;

    // State encoding
    localparam IDLE    = 4'd0;
    localparam START   = 4'd1;
    localparam DATA    = 4'd2;
    localparam PARITY  = 4'd3;
    localparam STOP    = 4'd4;

    parity par_mod (
        .clk(clk),
        .reset(reset | (state == IDLE && next_state == START)),
        .in(in),
        .odd(parity_odd)
    );

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            done <= 0;
        end else begin
            state <= next_state;
            if (state == DATA) bit_count <= bit_count + 1;
            else if (state == START) bit_count <= 0;
            if (state == STOP && next_state != STOP) done <= 1;
            if (state != STOP) done <= 0;
        end
    end

    always @(*) begin
        next_state = state;
        case(state)
            IDLE:
                if (in == 0) next_state = START;
            START:
                if (in == 0) next_state = DATA;
            DATA:
                if (bit_count == 8) next_state = PARITY;
            PARITY:
                if (bit_count == 9) next_state = STOP;
            STOP: begin
                if (in == 1) begin
                    if (parity_odd) next_state = IDLE;
                    else next_state = IDLE;
                end
            end
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            shift_reg <= 0;
            out_byte <= 0;
        end else if (state == DATA) begin
            shift_reg <= {in, shift_reg[7:1]};
        end else if (state == PARITY) begin
            parity_bit <= in;
        end else if (state == STOP && next_state == IDLE) begin
            if (parity_odd && (in == 1)) begin
                out_byte <= shift_reg;
            end
        end
    end
endmodule