module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    // Declare an internal register to store the previous values of the input signal
    reg [7:0] prev_in;

    always @(posedge clk) begin
        // If there's an edge (change) in the input signal from the previous cycle,
        // set the corresponding output bit high.
        anyedge <= (in ^ prev_in);

        // Store the current state of the input signal for comparison in the next cycle.
        prev_in <= in;
    end 

endmodule