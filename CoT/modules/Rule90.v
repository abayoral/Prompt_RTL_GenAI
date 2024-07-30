module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 

    integer i;

    always @(posedge clk) begin
        if (load) begin
            // Load the input data into q
            q <= data;
        end else begin
            // Temporary array to store the next state
            reg [511:0] next_q;

            // Apply Rule 90
            for (i = 1; i < 511; i = i + 1) begin
                next_q[i] = q[i-1] ^ q[i+1];
            end

            // Handle boundary cells
            next_q[0] = q[1];  // Left boundary (q[-1] is 0)
            next_q[511] = q[510];  // Right boundary (q[512] is 0)

            // Update q with the next state
            q <= next_q;
        end
    end

endmodule