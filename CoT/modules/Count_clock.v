module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    // Counting logic for seconds
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ss <= 8'b00000000; // Initialize seconds to 00
        end else if (ena) begin
            if (ss[3:0] == 4'b1001) begin
                ss[3:0] <= 4'b0000;
                if (ss[7:4] == 4'b0101) begin
                    ss[7:4] <= 4'b0000;
                end else begin
                    ss[7:4] <= ss[7:4] + 1;
                end
            end else begin
                ss[3:0] <= ss[3:0] + 1;
            end
        end
    end

    // Counting logic for minutes
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mm <= 8'b00000000; // Initialize minutes to 00
        end else if (ena && ss == 8'b00000000) begin
            if (mm[3:0] == 4'b1001) begin
                mm[3:0] <= 4'b0000;
                if (mm[7:4] == 4'b0101) begin
                    mm[7:4] <= 4'b0000;
                end else begin
                    mm[7:4] <= mm[7:4] + 1;
                end
            end else begin
                mm[3:0] <= mm[3:0] + 1;
            end
        end
    end

    // Counting logic for hours and AM/PM
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hh <= 8'b00010010; // Initialize hours to 12
            pm <= 1'b0;        // Initialize to AM
        end else if (ena && ss == 8'b00000000 && mm == 8'b00000000) begin
            if (hh == 8'b00010010) begin // Special case for 12
                if (pm) begin
                    hh <= 8'b00000001;
                end else begin
                    hh <= 8'b00000001;
                end
                pm <= ~pm; // Toggle AM/PM
            end else if (hh[3:0] == 4'b1001) begin
                hh[3:0] <= 4'b0000;
                hh[7:4] <= hh[7:4] + 1;
            end else begin
                hh[3:0] <= hh[3:0] + 1;
            end
        end
    end

endmodule