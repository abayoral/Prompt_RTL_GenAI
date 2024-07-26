module top_module (
    input wire clk,
    input wire reset,
    output wire [3:1] ena,
    output wire [15:0] q);

    // Define 4 separate counters for each digit
    reg [3:0] cnt_ones, cnt_tens, cnt_hundreds, cnt_thousands;
    
    // Enable signals
    assign ena[1] = (cnt_ones == 4'b1001);
    assign ena[2] = (cnt_tens == 4'b1001);
    assign ena[3] = (cnt_hundreds == 4'b1001);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset counters to zero
            cnt_ones      <= 4'b0000;
            cnt_tens      <= 4'b0000;
            cnt_hundreds  <= 4'b0000;
            cnt_thousands <= 4'b0000;
        end else begin
            // Increment the ones digit
            cnt_ones <= cnt_ones + 4'b0001;
          
            // Increment the tens digit when ones digit is 9
            if(ena[1]) 
                cnt_tens <= cnt_tens + 4'b0001;

            // Increment hundreds digit when tens digit is 9
            if(ena[2]) 
                cnt_hundreds <= cnt_hundreds + 4'b0001;

            // Increment thousands digit when hundreds digit is 9
            if(ena[3]) 
                cnt_thousands <= cnt_thousands + 4'b0001;
        end
    end

    // Combine all counters into a 16-bit output
    assign q = {cnt_thousands, cnt_hundreds, cnt_tens, cnt_ones};
endmodule