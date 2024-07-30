module top_module (
    input wire clk,
    input wire reset,
    output reg [3:1] ena,
    output reg [15:0] q
);
    // Define intermediate carry signals
    wire carry0, carry1, carry2;

    // Always block for the lowest 4 bits (ones digit)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q[3:0] <= 4'b0000;
        end else if (q[3:0] == 4'b1001) begin
            q[3:0] <= 4'b0000;
            carry0 <= 1'b1;
        end else begin
            q[3:0] <= q[3:0] + 1;
            carry0 <= 1'b0;
        end
    end

    // Always block for the next 4 bits (tens digit)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q[7:4] <= 4'b0000;
            ena[1] <= 1'b0;
        end else if (carry0) begin
            if (q[7:4] == 4'b1001) begin
                q[7:4] <= 4'b0000;
                ena[1] <= 1'b1;
                carry1 <= 1'b1;
            end else begin
                q[7:4] <= q[7:4] + 1;
                ena[1] <= 1'b1;
                carry1 <= 1'b0;
            end
        end else begin
            ena[1] <= 1'b0;
            carry1 <= 1'b0;
        end
    end

    // Always block for the next 4 bits (hundreds digit)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q[11:8] <= 4'b0000;
            ena[2] <= 1'b0;
        end else if (carry1) begin
            if (q[11:8] == 4'b1001) begin
                q[11:8] <= 4'b0000;
                ena[2] <= 1'b1;
                carry2 <= 1'b1;
            end else begin
                q[11:8] <= q[11:8] + 1;
                ena[2] <= 1'b1;
                carry2 <= 1'b0;
            end
        end else begin
            ena[2] <= 1'b0;
            carry2 <= 1'b0;
        end
    end

    // Always block for the next 4 bits (thousands digit)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q[15:12] <= 4'b0000;
            ena[3] <= 1'b0;
        end else if (carry2) begin
            if (q[15:12] == 4'b1001) begin
                q[15:12] <= 4'b0000;
                ena[3] <= 1'b1;
            end else begin
                q[15:12] <= q[15:12] + 1;
                ena[3] <= 1'b1;
            end
        end else begin
            ena[3] <= 1'b0;
        end
    end
endmodule