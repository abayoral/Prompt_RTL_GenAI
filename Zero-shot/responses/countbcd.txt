module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [15:0] counter;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 16'h0000; // Reset the count
            ena <= 3'b000;
        end
        else begin
            if (counter[3:0] == 4'hA) begin    // If ones digit reaches 10
                counter[3:0] <= 4'h0;  // Reset ones digit
                ena[1] <= 1'b1;    // Enable tens digit to increment
            end
            
            if (counter[7:4] == 4'hA && ena[1] == 1'b1) begin   // If tens digit reaches 10 and enabled
                counter[7:4] <= 4'h0;  // Reset tens digit
                ena[2] <= 1'b1;    // Enable hundreds digit to increment
            end
            
            if (counter[11:8] == 4'hA && ena[2] == 1'b1) begin  // If hundreds digit reaches 10 and enabled
                counter[11:8] <= 4'h0;  // Reset hundreds digit
                ena[3] <= 1'b1;    // Enable thousands digit to increment
            end

            if (counter[15:12] == 4'hA && ena[3] == 1'b1)    // If thousands digit reaches 10 and enabled
                counter[15:12] <= 4'h0;  // Reset thousands digit
            
            counter <= counter + 1;  // Increment the counter
        end
    end

    assign q = counter;  // Assign counter to output q

endmodule