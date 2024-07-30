module top_module (
    input wire [99:0] in,
    output reg [99:0] out
);
    integer i;

    // Combinational logic to reverse the bits of the input vector
    always @* begin
        for (i = 0; i < 100; i = i + 1) begin
            out[i] = in[99 - i];
        end
    end
endmodule