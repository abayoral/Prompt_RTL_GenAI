module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output reg out );

    // Whenever there's change in input or selection, evaluate and assign selected bit to output
    always @ (in or sel) begin
        out = in[sel];
    end

endmodule