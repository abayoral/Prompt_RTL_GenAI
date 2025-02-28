`timescale 1ns / 1ps
module testb_div_even;
    // Inputs
    reg clk;
    reg rst_n;
    // Outputs
    wire clk_div;
 
    // Instantiate the Unit Under Test (UUT)
    freq_divbyeven uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .clk_div(clk_div)
    );
    
    always #5 clk = ~clk;
    
    integer error = 0;
    integer total_tests = 0; // Counter for total test cases
    integer expected_value = 0;
    integer i;

    initial begin
        // Initialize Inputs
        clk = 1;
        rst_n = 0;
        #10 rst_n = 1;
        #100;

        $finish;
    end

    initial begin
        // $monitor("clk=%d, clk_div=%d",clk,clk_div);
        #5;
        for (i = 1; i < 20; i = i + 1) begin
            total_tests = total_tests + 1; // Increment test count

            if (clk_div !== expected_value) begin
                error = error + 1; 
                $display("Failed at %d: clk=%d, clk_div=%d (expected %d)", i, clk, clk_div, expected_value);
            end

            if (i < 6) expected_value = 0; // First five pairs
            else if (i < 12) expected_value = 1; // Next five pairs
            else if (i < 18) expected_value = 0; // Next five pairs
            else expected_value = 1; // Last five pairs
            #5;
        end

        // Final test result summary
        $display("=========== Test Summary ===========");
        $display("Total Tests Run: %d", total_tests);
        $display("Total Failures: %d", error);

        if (error == 0) begin
            $display("=========== Your Design Passed ===========");
        end else begin
            $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
        end
    end
endmodule
