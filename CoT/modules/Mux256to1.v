module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out 
);

    // Multiplexer logic: Select the bit from 'in' based on 'sel'
    assign out = in[sel];

endmodule