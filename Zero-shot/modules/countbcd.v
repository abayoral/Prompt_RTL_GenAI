module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // One's digit counter
    reg [3:0] ones;
    always @(posedge clk or posedge reset) begin
        if (reset)
            ones <= 0;
            else if (ones == 4'b1001)
                ones <= 0;
            else
                ones <= ones + 1;
    end
   
    // Ten's digit counter
    reg [3:0] tens;
    always @(posedge clk or posedge reset) begin
        if (reset)
            tens <= 0;
        else if (ones == 4'b1001)  // Increment tens when ones reach 9
            if (tens == 4'b1001)
                tens <= 0;
            else
                tens <= tens + 1;
    end
   
    // Hundred's digit counter
    reg [3:0] hundreds;
    always @(posedge clk or posedge reset) begin
        if (reset)
            hundreds <= 0;
        else if (tens == 4'b1001)  // Increment hundreds when tens reach 9
            if (hundreds == 4'b1001)
                hundreds <= 0;
            else
                hundreds <= hundreds + 1;
    end
   
    // Thousand's digit counter
    reg [3:0] thousands;
    always @(posedge clk or posedge reset) begin
        if (reset)
            thousands <= 0;
        else if (hundreds == 4'b1001)  // Increment thousands when hundreds reach 9
            if (thousands == 4'b1001)
                thousands <= 0;
            else
                thousands <= thousands + 1;
    end
   
    // Enable signals
    assign ena[1] = (ones == 4'b1001);
    assign ena[2] = (tens == 4'b1001);
    assign ena[3] = (hundreds == 4'b1001);

    // Output
    assign q = {thousands, hundreds, tens, ones};
   
endmodule