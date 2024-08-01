module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 

    // Helper function to increment BCD
    function [7:0] increment_bcd;
        input [7:0] bcd_value;
        begin
            if (bcd_value[3:0] == 4'd9) begin
                if (bcd_value[7:4] == 4'd9)
                    increment_bcd = 8'h00;
                else
                    increment_bcd = {bcd_value[7:4] + 4'd1, 4'd0};
            end else
                increment_bcd = bcd_value + 1;
        end
    endfunction

    // Resetting the clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pm <= 0;
            hh <= 8'h12;  // 12:00 AM
            mm <= 8'h00;
            ss <= 8'h00;
        end else if (ena) begin
            // Increment the seconds
            if (ss == 8'h59) begin
                ss <= 8'h00;
                // Increment the minutes
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    // Increment the hours
                    if (hh == 8'h12) begin
                        hh <= 8'h01;
                        pm <= ~pm;  // Toggle AM/PM
                    end else if (hh == 8'h11) begin
                        hh <= 8'h12;
                    end else begin
                        hh[3:0] <= hh[3:0] + 1;
                        if (hh[3:0] == 4'd9) begin
                            hh[3:0] <= 4'd0;
                            hh[7:4] <= hh[7:4] + 1;
                        end
                    end
                end else begin
                    mm <= increment_bcd(mm);
                end
            end else begin
                ss <= increment_bcd(ss);
            end
        end
    end

endmodule