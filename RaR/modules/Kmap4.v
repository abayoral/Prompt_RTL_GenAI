module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
); 
    assign out = (~d & b) | (d & ~b);
endmodule