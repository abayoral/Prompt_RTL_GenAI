module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 

    // Internal intermediate signals for convenience
    wire [3:0] hh_ones, hh_tens;
    wire [3:0] mm_ones, mm_tens;
    wire [3:0] ss_ones, ss_tens;
    
    assign hh_ones = hh[3:0];
    assign hh_tens = hh[7:4];
    assign mm_ones = mm[3:0];
    assign mm_tens = mm[7:4];
    assign ss_ones = ss[3:0];
    assign ss_tens = ss[7:4];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset to 12:00:00 AM
            hh <= 8'b0001_0010;  // 12 in BCD
            mm <= 8'b0000_0000;  // 00 in BCD
            ss <= 8'b0000_0000;  // 00 in BCD
            pm <= 0;             // AM
        end
        else if (ena) begin
            // Increment seconds
            if (ss_ones == 4'd9) begin
                if (ss_tens == 4'd5) begin
                    ss <= 8'b0000_0000;  // Reset seconds to 00 and increment minutes
                    if (mm_ones == 4'd9) begin
                        if (mm_tens == 4'd5) begin
                            mm <= 8'b0000_0000;  // Reset minutes to 00 and increment hours
                            if (hh_ones == 4'd9 || (hh_ones == 4'd2 && hh_tens == 4'd1)) begin
                                // Advance PM/AM and reset hours as needed
                                hh <= 8'b0001_0001;  // 01 in BCD
                                pm <= ~pm;            // Toggle AM/PM
                            end else if (hh_ones == 4'd2 && hh_tens == 4'd0) begin
                                hh <= 8'b0011_0010;  // 12 in BCD
                            end else begin
                                hh <= hh + 1;
                            end
                        end else begin
                            mm <= {mm_tens + 1, 4'b0000};
                        end
                    end else begin
                        mm <= {mm_tens, mm_ones + 1};
                    end
                end else begin
                    ss <= {ss_tens + 1, 4'b0000};
                end
            end else begin
                ss <= {ss_tens, ss_ones + 1};
            end
        end
    end

endmodule