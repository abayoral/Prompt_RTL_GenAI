module top_module (
    input wire clk,
    input wire reset,
    output wire [3:1] ena,
    output reg [15:0] q
);

    // Intermediate signals for each BCD digit
    reg [3:0] ones;
    reg [3:0] tens;
    reg [3:0] hundreds;
    reg [3:0] thousands;

    // Calculate enable signals for tens, hundreds, and thousands digit
    assign ena[1] = (ones == 4'd9);
    assign ena[2] = (tens == 4'd9) && (ones == 4'd9);
    assign ena[3] = (hundreds == 4'd9) && (tens == 4'd9) && (ones == 4'd9);

    // Always block to handle the counting
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ones <= 4'd0;
            tens <= 4'd0;
            hundreds <= 4'd0;
            thousands <= 4'd0;
        end else begin
            // Handle ones digit
            if (ones == 4'd9)
                ones <= 4'd0;
            else
                ones <= ones + 1;

            // Handle tens digit
            if (ena[1]) begin
                if (tens == 4'd9)
                    tens <= 4'd0;
                else
                    tens <= tens + 1;
            end

            // Handle hundreds digit
            if (ena[2]) begin
                if (hundreds == 4'd9)
                    hundreds <= 4'd0;
                else
                    hundreds <= hundreds + 1;
            end

            // Handle thousands digit
            if (ena[3]) begin
                if (thousands == 4'd9)
                    thousands <= 4'd0;
                else
                    thousands <= thousands + 1;
            end
        end
    end

    // Combine all BCD digits into the output q
    always @(*) begin
        q[3:0] = ones;
        q[7:4] = tens;
        q[11:8] = hundreds;
        q[15:12] = thousands;
    end

endmodule