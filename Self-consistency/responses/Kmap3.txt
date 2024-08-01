module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
); 
    assign out = (~a & d & ~c) | ((a | ~d) & b & ~c) | (a & b & c);
endmodule