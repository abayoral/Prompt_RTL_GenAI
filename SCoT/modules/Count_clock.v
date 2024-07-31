module top_module (
    input wire clk,
    input wire reset,
    input wire ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);
    // Intermediate registers for BCD representation
    reg [3:0] seconds_ones;
    reg [2:0] seconds_tens;
    reg [3:0] minutes_ones;
    reg [2:0] minutes_tens;
    reg [3:0] hours_ones;
    reg [1:0] hours_tens;

    // Always block for the clock and reset logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the time to 12:00:00 AM
            seconds_ones <= 4'd0;
            seconds_tens <= 3'd0;
            minutes_ones <= 4'd0;
            minutes_tens <= 3'd0;
            hours_ones <= 4'd2;  // 12 in BCD has ones place as 2 and tens place as 1
            hours_tens <= 2'd1;
            pm <= 1'b0;         // 0 represents AM, 1 represents PM
        end else if (ena) begin
            // Increment seconds
            if (seconds_ones == 4'd9) begin
                seconds_ones <= 4'd0;
                if (seconds_tens == 3'd5) begin
                    seconds_tens <= 3'd0;
                    
                    // Increment minutes
                    if (minutes_ones == 4'd9) begin
                        minutes_ones <= 4'd0;
                        if (minutes_tens == 3'd5) begin
                            minutes_tens <= 3'd0;

                            // Increment hours
                            if (hours_ones == 4'd9) begin
                                hours_ones <= 4'd0;
                                hours_tens <= ~hours_tens;
                                if (hours_tens == 2'd1) begin
                                    // Switch from 11 to 12
                                    hours_ones <= 4'd2;
                                    hours_tens <= 2'd1;
                                    pm <= ~pm;  // Toggle AM/PM
                                end
                            end else if ((hours_tens == 2'd0) && (hours_ones == 4'd2)) begin
                                // Special case transition from 12 to 1
                                hours_ones <= 4'd1;
                                hours_tens <= 2'd0;
                                pm <= ~pm;  // Toggle AM/PM
                            end else begin
                                hours_ones <= hours_ones + 1;
                            end
                        end else begin
                            minutes_tens <= minutes_tens + 1;
                        end
                    end else begin
                        minutes_ones <= minutes_ones + 1;
                    end
                end else begin
                    seconds_tens <= seconds_tens + 1;
                end
            end else begin
                seconds_ones <= seconds_ones + 1;
            end
        end
    end

    // Assign BCD values to the outputs
    always @(*) begin
        mm = {minutes_tens, minutes_ones}; 
        ss = {seconds_tens, seconds_ones};
        hh = {hours_tens, hours_ones};
    end  
endmodule