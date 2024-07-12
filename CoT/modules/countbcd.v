module top_module (
    input wire clk,
    input wire reset,
    output wire [3:1] ena,
    output reg [15:0] q
);
    reg [3:0] count [0:3];
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'b0000000000000000;
        else begin
            if (ena[1]) count[1] <= count[1] + 1;
            if (ena[2]) count[2] <= count[2] + 1;
            if (ena[3]) count[3] <= count[3] + 1;
        end
    end
    
    assign q[3:0] = count[0];
    assign q[7:4] = count[1];
    assign q[11:8] = count[2];
    assign q[15:12] = count[3];
endmodule