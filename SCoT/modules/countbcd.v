module top_module (
        input wire clk,
        input wire reset,
        output wire [3:0] ena,
        output wire [15:0] q
    );
        // Counter for each digit
        reg [3:0] ones = 0, tens = 0, hundreds = 0, thousands = 0;
        
        // Carry flags for each digit
        wire carry_ones, carry_tens, carry_hundreds;

        // Increment or reset each digit
        always @(posedge clk or posedge reset) begin
            if (reset)
                ones <= 0;
            else if (carry_ones)
                ones <= ones + 1;
        end

        assign carry_ones = (ones == 4'd9);

        always @(posedge clk or posedge reset) begin
            if (reset)
                tens <= 0;
            else if (ena[1])
                tens <= tens + 1;
        end

        assign carry_tens = (tens == 4'd9);

        always @(posedge clk or posedge reset) begin
            if (reset)
                hundreds <= 0;
            else if (ena[2])
                hundreds <= hundreds + 1;
        end

        assign carry_hundreds = (hundreds == 4'd9);

        always @(posedge clk or posedge reset) begin
            if (reset)
                thousands <= 0;
            else if (ena[3])
                thousands <= thousands + 1;
        end

        // Generate enable signals
        assign ena = {carry_hundreds, carry_tens, carry_ones};

        // Concatenate output counts
        assign q = {thousands, hundreds, tens, ones};
    endmodule