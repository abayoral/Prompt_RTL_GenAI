module top_module(
    input wire [3:0] in,   // 4-bit input
    output reg [1:0] pos   // 2-bit output representing position of the highest-order active bit
);
    always @(*) begin
        // Default output to zero
        pos = 2'b00;
        
        // Check highest-order bit first, moving to the lowest-order bit
        if (in[3])
            pos = 2'b11;
        else if (in[2])
            pos = 2'b10;
        else if (in[1])
            pos = 2'b01;
        else if (in[0])
            pos = 2'b00;
    end
endmodule