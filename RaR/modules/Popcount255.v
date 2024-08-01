module top_module(
    input [254:0] in,
    output reg [7:0] out
    );
    
    integer i;
    
    always @(*) begin
        out = 8'd0; // Initialize the output to zero
        // Iterate through each bit of the input vector
        for (i = 0; i < 255; i = i + 1) begin
            out = out + in[i]; // Increment the output count if the bit is '1'
        end
    end
    
endmodule