module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // Define 4-digit BCD (Binary-Coded-Decimal) Counter
    reg [3:0] digit [3:0];

    // For next digit enable
    assign ena = {digit[2][3], digit[1][3], digit[0][3]};

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            digit[0] <= 4'b0000;
            digit[1] <= 4'b0000;
            digit[2] <= 4'b0000;
            digit[3] <= 4'b0000;
        end else begin
            if (digit[0] == 4'd9) begin
                digit[0] <= 4'b0000;
                if (digit[1] == 4'd9) begin
                    digit[1] <= 4'b0000;
                    if (digit[2] == 4'd9) begin
                        digit[2] <= 4'b0000;
                        if (digit[3] == 4'd9) begin
                            digit[3] <= 4'b0000;
                        end else begin
                            digit[3] <= digit[3] + 4'b0001;
                        end
                    end else begin
                        digit[2] <= digit[2] + 4'b0001;
                    end
                end else begin
                    digit[1] <= digit[1] + 4'b0001;
                end
            end else begin
                digit[0] <= digit[0] + 4'b0001;
            end
        end
    end

    // Form 16-bit BCD number
    assign q = {digit[3], digit[2], digit[1], digit[0]};

endmodule