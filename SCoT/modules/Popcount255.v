module top_module (
    input wire [254:0] in,
    output reg [7:0] out
);
    integer i;
    
    // Always block to calculate the population count
    always @(*) begin
        // Initialize the output count to zero
        out = 8'b00000000;
        
        // Loop over each bit in the input vector
        for (i = 0; i < 255; i = i + 1) begin
            if (in[i] == 1'b1) begin
                out = out + 1;
            end
        end
    end
endmodule