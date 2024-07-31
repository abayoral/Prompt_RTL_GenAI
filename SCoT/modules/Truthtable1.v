module top_module (
    input wire x3,
    input wire x2,
    input wire x1,
    output wire f
);
    // Intermediate signals representing each row condition
    wire row_2_condition, row_3_condition, row_5_condition, row_7_condition;
    
    // Conditions for each specified row in the truth table
    assign row_2_condition = ~x3 & x2 & ~x1; // row 2: x3=0, x2=1, x1=0
    assign row_3_condition = ~x3 & x2 & x1;  // row 3: x3=0, x2=1, x1=1
    assign row_5_condition = x3 & ~x2 & x1;  // row 5: x3=1, x2=0, x1=1
    assign row_7_condition = x3 & x2 & x1;   // row 7: x3=1, x2=1, x1=1

    // Output f is true if any of the row conditions are true
    assign f = row_2_condition | row_3_condition | row_5_condition | row_7_condition;
    
endmodule