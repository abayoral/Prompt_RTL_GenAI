module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    
    reg [3:0] ones, tens, hundreds, thousands;
   
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            ones <= 4'b0000;
            tens <= 4'b0000;
            hundreds <= 4'b0000;
            thousands <= 4'b0000;
        end
        else 
        begin
            if (ones == 4'b1001)
            begin
                ones <= 4'b0000;
                ena[1] <= 1'b1;
                if (tens == 4'b1001)
                begin
                    tens <= 4'b0000;
                    ena[2] <= 1'b1;
                    if (hundreds == 4'b1001)
                    begin
                        hundreds <= 4'b0000;
                        ena[3] <= 1'b1;
                        if (thousands == 4'b1001)
                            thousands <= 4'b0000;
                        else
                            thousands <= thousands + 1;
                    end
                    else
                        hundreds <= hundreds + 1;
                end
                else
                    tens <= tens + 1;
            end
            else
            begin
                ones <= ones + 1;
                ena[1] <= 1'b0;
            end
        end
    end

    assign q = {thousands, hundreds, tens, ones};

endmodule