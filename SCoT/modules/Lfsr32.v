module top_module (
    input wire clk,       // Clock input
    input wire reset,     // Synchronous reset input
    output reg [31:0] q   // 32-bit LFSR output
);
    // Internal register to hold the state of the LFSR
    reg [31:0] lfsr;

    // Always block for sequential logic
    always @(posedge clk) begin
        if (reset) begin
            // Initialize LFSR to 1 on reset
            lfsr <= 32'h1;
        end else begin
            // Calculate feedback by XORing the tapped bits
            // Taps: 32, 22, 2, 1 (these correspond to indices 31, 21, 1, and 0 in zero-based indexing)
            wire feedback = lfsr[0] ^ lfsr[1] ^ lfsr[21] ^ lfsr[31];
            
            // Shift register left and insert feedback bit into LSB
            lfsr <= {lfsr[30:0], feedback};
        end
    end

    // Assign the internal LFSR state to the output
    assign q = lfsr;

endmodule