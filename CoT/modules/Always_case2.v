module top_module (
    input [3:0] in,
    output reg [1:0] pos
);
    // Priority encoder logic: Determine the position of the highest '1' bit in the input
    always @(*) begin
        if (in[3]) 
            pos = 2'd3;
        else if (in[2])
            pos = 2'd2;
        else if (in[1])
            pos = 2'd1;
        else if (in[0])
            pos = 2'd0;
        else
            pos = 2'd0; // Output zero if no bits are high
    end
endmodule