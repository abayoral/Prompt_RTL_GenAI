module top_module (
    input wire clk,
    input wire [7:0] in,
    output reg [7:0] anyedge
);
    // Register to store the previous state of the input
    reg [7:0] prev_in;

    // Detect edge transitions and update the output
    always @(posedge clk) begin
        // Compare the current input with the previous input
        anyedge <= (in & ~prev_in); // Detect 0 to 1 transitions

        // Update prev_in with the current input for the next comparison
        prev_in <= in;
    end
endmodule