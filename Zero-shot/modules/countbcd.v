module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);
    
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            q <= 16'b0;
            ena <= 3'b0;
        end
        else
        begin
            if (q[3:0] == 4'b1001)
            begin
                ena[1] <= 1'b1;
                q[3:0] <= 4'b0000;
                if (q[7:4] == 4'b1001)
                begin
                    ena[2] <= 1'b1;
                    q[7:4] <= 4'b0000;
                    if (q[11:8] == 4'b1001)
                    begin
                        ena[3] <= 1'b1;
                        q[11:8] <= 4'b0000;
                    end
                    else
                    begin
                        q[11:8] <= q[11:8] + 1'b1;
                        ena[3] <= 1'b0;
                    end
                end
                else
                begin
                    q[7:4] <= q[7:4] + 1'b1;
                    ena[2] <= 1'b0;
                end
            end
            else
            begin
                q[3:0] <= q[3:0] + 1'b1;
                ena[1] <= 1'b0;
            end
        end
    end

endmodule