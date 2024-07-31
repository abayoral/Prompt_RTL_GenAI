module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:0] digit [3:0]; // Four BCD digits
    
    assign q = {digit[3], digit[2], digit[1], digit[0]};
    assign ena = {digit[3]!=4'd9, digit[2]!=4'd9, digit[1]!=4'd9}; // Enable signal when digit is not 9, as it's BCD Counter

    always @(posedge clk or posedge reset) begin
        if(reset) begin
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
                        end else
                            digit[3] <= digit[3] + 1'b1;
                    end else
                        digit[2] <= digit[2] + 1'b1;
                end else
                    digit[1] <= digit[1] + 1'b1;
            end else 
                digit[0] <= digit[0] + 1'b1;
        end
    end
endmodule