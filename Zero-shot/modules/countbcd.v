module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // One-digit decade counter
    reg [3:0] digit;
    always @(posedge clk or posedge reset)
      if (reset)
        digit <= 0;
      else if (digit == 4'd9)
        digit <= 0;
      else
        digit <= digit + 1;

    // Four digit BCD counter
    reg [15:0] bcd;
    always @(posedge clk or posedge reset)
      if (reset)
        bcd <= 0;
      else if (bcd == 16'd9999)
        bcd <= 0;
      else
        bcd <= bcd + 1;

    assign q = bcd;

    // Enable signals for upper three digits
    assign ena[3] = (digit == 4'd9) && ((bcd[7:4] & 4'd9) == 4'd9) && ((bcd[11:8] & 4'd9) == 4'd9);
    assign ena[2] = (digit == 4'd9) && ((bcd[7:4] & 4'd9) == 4'd9);
    assign ena[1] = (digit == 4'd9);

endmodule