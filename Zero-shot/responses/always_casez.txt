module top_module (
    input [7:0] in,
    output reg [2:0] pos );

    always @(*) begin

        // Start with position set as zero
        pos[2:0] = 3'd0;

        // Check each bit to find first 1
        for (index=0; index < 8; index=index+1) begin
            if(in[index] == 1) begin
                pos[2:0] = index;
                break;
            end
        end
    end
endmodule