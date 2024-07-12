module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // Define internal wire and reg variables
    wire [3:0] counter[3:0];
    wire [3:1] carry;
    reg [3:0] q_temp [3:0];
    reg [3:1] ena_temp;
    
    // Loop to create the 4 decade counters 
    generate
        genvar i;
        for(i=0; i<4; i=i+1)
        begin: decade_counter
            always @(posedge clk or posedge reset)
            begin
                if (reset)
                    q_temp[i] <= 4'b0000;
                else if ((i == 0) || (ena_temp[i]))
                begin
                    if (q_temp[i] == 4'b1001)
                    begin
                        q_temp[i] <= 4'b0000;
                        ena_temp[i+1] <= 1'b1;
                    end
                    else
                    begin
                        q_temp[i] <= q_temp[i] + 1'b1;
                        ena_temp[i+1] <= 1'b0;
                    end
                end
            end
        end
    endgenerate

    // Assign output signals to the internal signals
    assign q = {q_temp[3], q_temp[2], q_temp[1], q_temp[0]};
    assign ena = ena_temp[3:1];

endmodule