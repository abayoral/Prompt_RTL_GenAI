module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

    // Combinational logic to decode the scancode and determine which arrow key is pressed
    always @(*) begin
        // Initialize all outputs to zero
        left = 1'b0;
        down = 1'b0;
        right = 1'b0;
        up = 1'b0;
        
        // Decode the scancode and assert the corresponding output
        case (scancode)
            16'hE06B: left = 1'b1;    // Left arrow
            16'hE072: down = 1'b1;    // Down arrow
            16'hE074: right = 1'b1;   // Right arrow
            16'hE075: up = 1'b1;      // Up arrow
            default: ; // Keep all output signals low
        endcase
    end

endmodule