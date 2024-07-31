module top_module(
    input wire clk,
    input wire reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 
    wire feedback;

    // Feedback calculation using XOR of the tap positions
    assign feedback = q[31] ^ q[21] ^ q[1] ^ q[0];

    // Always block for synchronous logic
    always @(posedge clk) begin
        if (reset) 
            q <= 32'h1; // Synchronous reset to 32'h1
        else 
            q <= {q[30:0], feedback}; // Shift left and insert the feedback bit
    end
endmodule