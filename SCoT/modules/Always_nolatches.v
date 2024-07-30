module top_module (
    input wire [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

    // Combinational logic to detect arrow keys based on scancode
    always @(*) begin
        // Initialize all outputs to 0
        left = 0;
        down = 0;
        right = 0;
        up = 0;

        // Check the scancode and set the appropriate output to 1
        case (scancode)
            16'he06b: left = 1;  // Left arrow
            16'he072: down = 1;  // Down arrow
            16'he074: right = 1; // Right arrow
            16'he075: up = 1;    // Up arrow
            default: ;           // For any other scancode, all outputs remain 0
        endcase
    end
endmodule