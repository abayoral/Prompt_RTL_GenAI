// Case statements are often preferred over a series of if-else conditions when handling multiple cases, as they can enhance readability and efficiency, especially when there is a large number of cases to consider. In this exercise, you are required to implement a 6-to-1 multiplexer in Verilog. The multiplexer will select its output based on a 3-bit selector input (`sel`). Depending on the value of `sel` (ranging from 0 to 5), the corresponding 4-bit data input (`data0` to `data5`) should be routed to the output (`out`). If `sel` takes on any value outside the range of 0 to 5, the output should default to 0. Additionally, take care to design the circuit such that no unintended latches are inferred.

// Please implement the module according to the Verilog 2001 syntax standard, with the given inputs and outputs.

// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    // This always block should define the combinational logic for the multiplexer.
    always @(*) begin 
        // Use a case statement to determine the output based on the value of 'sel'.
        case(...)
            // Include cases for sel = 0 to sel = 5 to select the appropriate data input.
            // Provide a default case to ensure 'out' is 0 for any sel value outside the range of 0 to 5.
        endcase
    end

endmodule