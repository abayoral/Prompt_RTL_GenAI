module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);

    reg [15:0] q_reg, q_next;
    wire ones_carry, tens_carry, hundreds_carry;

    // Output assignments
    assign q = q_reg;
    assign ena[1] = ones_carry;
    assign ena[2] = tens_carry;
    assign ena[3] = hundreds_ccarry;

    // Increment and carry logic
    always @(*) begin
        // Default next state assignment
        q_next = q_reg;
        
        // Reset condition
        if (reset) begin
            q_next = 16'h0000;
        end else begin
            // Ones digit (q[3:0])
            if (q_reg[3:0] == 4'd9) begin
                q_next[3:0] = 4'd0;
            end else begin
                q_next[3:0] = q_reg[3:0] + 4'd1;
            end
            
            // Tens digit enable and increment (q[7:4])
            if (q_reg[3:0] == 4'd9) begin
                if (q_reg[7:4] == 4'd9) begin
                    q_next[7:4] = 4'd0;
                end else begin
                    q_next[7:4] = q_reg[7:4] + 4'd1;
                end
            end
            
            // Hundreds digit enable and increment (q[11:8])
            if (q_reg[7:4] == 4'd9 && q_reg[3:0] == 4'd9) begin
                if (q_reg[11:8] == 4'd9) begin
                    q_next[11:8] = 4'd0;
                end else begin
                    q_next[11:8] = q_reg[11:8] + 4'd1;
                end
            end
            
            // Thousands digit enable and increment (q[15:12])
            if (q_reg[11:8] == 4'd9 && q_reg[7:4] == 4'd9 && q_reg[3:0] == 4'd9) begin
                if (q_reg[15:12] == 4'd9) begin
                    q_next[15:12] = 4'd0;
                end else begin
                    q_next[15:12] = q_reg[15:12] + 4'd1;
                end
            end
        end
    end

    // Carry signals
    assign ones_carry = (q_reg[3:0] == 4'd9);
    assign tens_carry = (q_reg[3:0] == 4'd9) && (q_reg[7:4] == 4'd9);
    assign hundreds_carry = (q_reg[7:4] == 4'd9) && (q_reg[3:0] == 4'd9) && (q_reg[11:8] == 4'd9);

    // Sequential logic for state updates
    always @(posedge clk) begin
        if (reset) begin
            q_reg <= 16'h0000;
        end else begin
            q_reg <= q_next;
        end
    end

endmodule