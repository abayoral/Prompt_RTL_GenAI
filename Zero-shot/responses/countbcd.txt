module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);
  
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            ena <= 3'b000; 
            q <= 16'b0000000000000000;
        end 
        else 
        begin
            q[3:0] = q[3:0] + 1;  
            if(q[3:0] == 10) 
            begin
                q[3:0] <= 4'b0000;
                ena[1] <= 1'b1;
                q[7:4] = q[7:4] + 1;  
                if(q[7:4] == 10) 
                begin
                    q[7:4] <= 4'b0000;
                    ena[2] <= 1'b1;
                    q[11:8] = q[11:8] + 1;  
                    if(q[11:8] == 10) 
                    begin
                        q[11:8] <= 4'b0000;
                        ena[3] <= 1'b1;
                        q[15:12] = q[15:12] + 1;  
                        if(q[15:12] == 10) 
                            q[15:12] <= 4'b0000;
                    end
                end
            end
        end
    end
endmodule