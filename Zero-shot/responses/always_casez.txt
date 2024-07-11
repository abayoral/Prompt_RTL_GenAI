module top_module (
    input [7:0] in,
    output reg [2:0] pos 
);
    
    always @* begin
        case (in)
            8'b1: pos = 3'b0;
            8'b10: pos = 3'b1;
            8'b100: pos = 3'b2;
            8'b1000: pos = 3'b3;
            8'b10000: pos = 3'b4;
            8'b100000: pos = 3'b5;
            8'b1000000: pos = 3'b6;
            8'b10000000: pos = 3'b7;
            default: pos = 3'b0;
        endcase
    end

endmodule