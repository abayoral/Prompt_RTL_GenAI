`timescale 1ns/1ns
`define width 8
`define TESTFILE "test_data.dat"

module booth4_mul_tb ();
    reg signed [`width-1:0] a, b;
    reg             clk, reset;

    wire signed [2*`width-1:0] p;
    wire           rdy;

    integer total_tests, error;
    integer i, s, fp, numtests;

    wire signed [2*`width-1:0] ans = a * b;

    multi_booth_8bit dut( 
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .p(p),
        .rdy(rdy)
    );

    // Set up 10ns clock
    always #5 clk = ~clk;

    task apply_and_check;
        input [`width-1:0] ain;
        input [`width-1:0] bin;
        integer timeout;
        begin
            // Set the inputs
            a = ain;
            b = bin;
            // Reset the DUT for two clock cycles
            reset = 1;
            repeat (2) @(posedge clk);
            reset = 0;
            
            // Wait for rdy with timeout
            timeout = 1000; // Timeout limit (adjustable)
            while (rdy == 0 && timeout > 0) begin
                @(posedge clk);
                timeout = timeout - 1;
            end
            
            if (timeout == 0) begin
                $display("ERROR: Timeout waiting for rdy signal");
                $finish;
            end
            
            total_tests = total_tests + 1;
            
            if (p !== ans) begin
                error = error + 1;
                $display("Test failed: A = %d, B = %d, Expected Product = %d, Got = %d", a, b, ans, p);
            end
        end
    endtask // apply_and_check

    initial begin
        clk = 1;
        total_tests = 0;
        error = 0;

        // Open test file
        fp = $fopen(`TESTFILE, "r");
        if (fp == 0) begin
            $display("ERROR: Could not open test file %s", `TESTFILE);
            $finish;
        end
        
        s = $fscanf(fp, "%d\n", numtests);
        if (s != 1) begin
            $display("ERROR: Failed to read number of test cases");
            $finish;
        end
        $display("Number of test cases: %d", numtests);

        // Run test cases
        for (i = 0; i < numtests; i = i + 1) begin
            s = $fscanf(fp, "%d %d\n", a, b);
            if (s != 2) begin
                $display("ERROR: Failed to read test case %d", i);
                $finish;
            end
            apply_and_check(a, b);
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

        $finish;
    end
endmodule