module top_module(
    input clk,              // Fast-running clock signal
    input reset,            // Reset signal to reset the clock to 12:00 AM
    input ena,              // Enable signal that pulses once per second 
    output reg pm,          // AM/PM indicator (0 for AM, 1 for PM)
    output reg [7:0] hh,    // Hours in BCD (01-12)
    output reg [7:0] mm,    // Minutes in BCD (00-59)
    output reg [7:0] ss);   // Seconds in BCD (00-59)

    // Initialize the clock to 12:00:00 AM
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
            pm <= 0;
        end else if (ena) begin
            // Increment seconds
            if (ss == 8'h59) begin
                ss <= 8'h00;
                
                // Increment minutes
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    
                    // Increment hours
                    if (hh == 8'h12) begin
                        hh <= 8'h01;
                        pm <= ~pm;  // Toggle AM/PM
                    end else if (hh[3:0] == 4'h9) begin
                        hh[3:0] <= 0;
                        hh[7:4] <= hh[7:4] + 1;
                    end else begin
                        hh <= hh + 8'h01;
                    end
                end else if (mm[3:0] == 4'h9) begin
                    mm[3:0] <= 0;
                    mm[7:4] <= mm[7:4] + 1;
                end else begin
                    mm <= mm + 8'h01;
                end

            end else if (ss[3:0] == 4'h9) begin
                ss[3:0] <= 0;
                ss[7:4] <= ss[7:4] + 1;
            end else begin
                ss <= ss + 8'h01;
            end
        end
    end
endmodule