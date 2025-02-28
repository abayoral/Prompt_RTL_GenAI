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
        begin
            // Set the inputs
            a = ain;
            b = bin;
            // Reset the DUT for one clock cycle
            reset = 1;
            @(posedge clk);
            // Remove reset 
            #1 reset = 0;

            while (rdy == 0) begin
                @(posedge clk); // Wait for one clock cycle
            end
            
            total_tests = total_tests + 1; // Increment test count

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

        // Get all inputs from file: 1st line has number of inputs
        fp = $fopen(`TESTFILE, "r");
        s = $fscanf(fp, "%d\n", numtests);
        
        // Sequences of values pumped through DUT 
        for (i = 0; i < numtests; i = i + 1) begin
            s = $fscanf(fp, "%d %d\n", a, b);
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
