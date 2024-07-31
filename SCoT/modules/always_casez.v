module top_module(
    input wire [7:0] in,
    output reg [2:0] pos
);

    // Priority encoder logic: Find the least significant high bit in the input vector
    always @(*) begin
        pos = 3'b000;  // Initialize position to 0 by default
        if (in[0]) pos = 3'b000;
        else if (in[1]) pos = 3'b001;
        else if (in[2]) pos = 3'b010;
        else if (in[3]) pos = 3'b011;
        else if (in[4]) pos = 3'b100;
        else if (in[5]) pos = 3'b101;
        else if (in[6]) pos = 3'b110;
        else if (in[7]) pos = 3'b111;
    end

endmodule