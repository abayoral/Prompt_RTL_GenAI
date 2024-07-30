module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q 
);

always @(posedge clk) begin
    if (load) begin
        q <= data;
    end else begin
        integer i;
        reg [511:0] next_q;
        
        // Update cells according to Rule 90
        for (i = 0; i < 512; i = i + 1) begin
            if (i == 0) begin
                next_q[i] = q[1]; // Handle boundary condition for the first cell
            end
            else if (i == 511) begin
                next_q[i] = q[510]; // Handle boundary condition for the last cell
            end
            else begin
                next_q[i] = q[i-1] ^ q[i+1]; // Rule 90: XOR of neighbors
            end
        end
        
        q <= next_q;
    end
end

endmodule