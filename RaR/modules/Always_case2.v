module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always @(*) begin
        casez(in)
            4'b1???: pos = 2'b11; // Highest priority
            4'b01??: pos = 2'b10;
            4'b001?: pos = 2'b01;
            4'b0001: pos = 2'b00; // Lowest priority
            default: pos = 2'b00; // No bits set
        endcase
    end
endmodule