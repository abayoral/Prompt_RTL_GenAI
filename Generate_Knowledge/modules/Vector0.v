module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0
); 

    // Assign the input vector to the output vector
    assign outv = vec;
    
    // Split the input vector into individual bits and assign to outputs
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

endmodule