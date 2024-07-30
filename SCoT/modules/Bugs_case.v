module top_module(
    input wire [7:0] code,
    output reg [3:0] out,
    output reg valid
);

    // Trigger the always block on any change in the input code
    always @(code) begin
        // Default values
        out = 4'b0000;
        valid = 1'b0;

        case (code)
            8'h45: begin out = 4'd0; valid = 1'b1; end // Scan code for 0
            8'h16: begin out = 4'd1; valid = 1'b1; end // Scan code for 1
            8'h1E: begin out = 4'd2; valid = 1'b1; end // Scan code for 2
            8'h26: begin out = 4'd3; valid = 1'b1; end // Scan code for 3
            8'h25: begin out = 4'd4; valid = 1'b1; end // Scan code for 4
            8'h2E: begin out = 4'd5; valid = 1'b1; end // Scan code for 5
            8'h36: begin out = 4'd6; valid = 1'b1; end // Scan code for 6
            8'h3D: begin out = 4'd7; valid = 1'b1; end // Scan code for 7
            8'h3E: begin out = 4'd8; valid = 1'b1; end // Scan code for 8
            8'h46: begin out = 4'd9; valid = 1'b1; end // Scan code for 9
            default: begin out = 4'b0000; valid = 1'b0; end // Invalid scan code
        endcase
    end
endmodule