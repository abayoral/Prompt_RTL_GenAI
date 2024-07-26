module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    // Insert your code here
    assign out = in[sel];
     
endmodule