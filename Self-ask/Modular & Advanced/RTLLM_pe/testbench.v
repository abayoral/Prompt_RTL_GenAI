`timescale 1ns / 1ps

module test54();

    reg clk;
    reg rst;
    reg [31:0] a, b;
    wire [31:0] c;

    pe dut(clk, rst, a, b, c);

    integer error = 0;
    integer total_tests = 0; // Counter for total test cases

    initial begin
        a = 0;
        b = 0;
        clk = 0;
        rst = 1;
        #5;
        clk = 1;
        #5;
        clk = 0;
        rst = 0;
        #5;

        // Test case 1
        total_tests = total_tests + 1;
        a = 1;
        b = 1;
        #5;
        clk = 1;
        #5;
        clk = 0;

        // Test case 2
        total_tests = total_tests + 1;
        a = 2;
        b = 2;
        #5;
        clk = 1;
        #5;
        clk = 0;

        // Test case 3
        total_tests = total_tests + 1;
        a = 3;
        b = 3;
        #5;
        clk = 1;
        #5;
        clk = 0;

        // Final check
        total_tests = total_tests + 1;
        if (c == 32'h0000000e) begin
            $display("===========Your Design Passed===========");
        end else begin
            error = error + 1;
            $display("===========Error===========");
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
