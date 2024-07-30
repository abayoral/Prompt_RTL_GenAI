module top_module (
    input wire clk,
    input wire slowena,
    input wire reset,
    output reg [3:0] q
);

    // Decade counter logic: Reset q when reset is high, increment q if slowena is high and q is less than 9, otherwise wrap q to 0
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000; // Reset the counter to 0
        end 
        else if (slowena) begin
            if (q < 4'b1001) begin
                q <= q + 1; // Increment the counter if it's less than 9
            end 
            else begin
                q <= 4'b0000; // Wrap the counter back to 0 if it reaches 9
            end
        end
    end
endmodule