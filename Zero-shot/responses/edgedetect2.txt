module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    reg [7:0] prev_in; //Declaring a register to store the value of 'in' in the previous clock edge

    always @(posedge clk) //On every positive edge of the clock
    begin
        anyedge <= (in & ~prev_in); //Bitwise AND operation between 'in' and the complement of 'prev_in'. The output bit is set if there is a transition from 0 to 1
        prev_in <= in; //storing the value of 'in' to 'prev_in' for the next clock edge
    end

endmodule