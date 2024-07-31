module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:0] ones, tens, hundreds, thousands;
    reg [3:1] enable;

    assign q = {thousands, hundreds, tens, ones};
    assign ena = enable;

    // Ones digit
    always @(posedge clk) begin
        if (reset) begin
            ones <= 4'b0000;
        end else if (ones == 4'd9) begin
            ones <= 4'b0000;
        end else begin
            ones <= ones + 1'b1;
        end
    end

    // Debugging tens digit enable signal
    always @(posedge clk) begin
        if (reset) begin
            enable[1] <= 1'b0;
        end else if (ones == 4'd9) begin
            enable[1] <= 1'b1;
        end else begin
            enable[1] <= 1'b0;
        end
    end

    // Tens digit
    always @(posedge clk) begin
        if (reset) begin
            tens <= 4'b0000;
        end else if (enable[1] & ones == 4'd9) begin
            if (tens == 4'd9) begin
                tens <= 4'b0000;
            end else begin
                tens <= tens + 1'b1;
            end
        end
    end

    // Debugging hundreds digit enable signal
    always @(posedge clk) begin
        if (reset) begin
            enable[2] <= 1'b0;
        end else if (tens == 4'd9 & ones == 4'd9) begin
            enable[2] <= 1'b1;
        end else begin
            enable[2] <= 1'b0;
        end
    end

    // Hundreds digit
    always @(posedge clk) begin
        if (reset) begin
            hundreds <= 4'b0000;
        end else if (enable[2] & tens == 4'd9 & ones == 4'd9) begin
            if (hundreds == 4'd9) begin
                hundreds <= 4'b0000;
            end else begin
                hundreds <= hundreds + 1'b1;
            end
        end
    end

    // Debugging thousands digit enable signal
    always @(posedge clk) begin
        if (reset) begin
            enable[3] <= 1'b0;
        end else if (hundreds == 4'd9 & tens == 4'd9 & ones == 4'd9) begin
            enable[3] <= 1'b1;
        end else begin
            enable[3] <= 1'b0;
        end
    end

    // Thousands digit
    always @(posedge clk) begin
        if (reset) begin
            thousands <= 4'b0000;
        end else if (enable[3] & hundreds == 4'd9 & tens == 4'd9 & ones == 4'd9) begin
            if (thousands == 4'd9) begin
                thousands <= 4'b0000;
            end else begin
                thousands <= thousands + 1'b1;
            end
        end
    end

endmodule