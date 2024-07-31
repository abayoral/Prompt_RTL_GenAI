module top_module (
    input wire clk,
    input wire [7:0] in,
    output reg [7:0] anyedge
);

    // Register to store the previous state of 'in'
    reg [7:0] prev_in;
    
    // Always block to detect edges
    always @(posedge clk) begin
        // Compare each bit of 'in' with the previous state to detect 0 to 1 transitions
        anyedge <= (~prev_in & in);  // Detect 0 to 1 transitions
        // Update the previous state
        prev_in <= in;
    end

endmodule