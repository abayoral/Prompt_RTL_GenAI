module clkgenerator_tb;

    reg clk_tb; // Clock signal from the testbench
    reg res = 1'b0;
    integer error = 0;
    integer total_tests = 0; // Counter for total test cases

    // Instantiate the clkgenerator module
    clkgenerator clkgenerator_inst (
        .clk(clk_tb)
    );

    initial begin
        // Simulate for a certain number of clock cycles
        repeat (20) begin // Simulate 20 clock cycles
            total_tests = total_tests + 1; // Increment total test count
            #5; // Time delay between clock cycles
            error = (res == clk_tb) ? error : error + 1;
            res = res + 1;
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

        // Finish simulation
        $finish;
    end

endmodule
