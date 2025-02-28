Please create a set of digital counters designed for a 12-hour clock format that includes an AM/PM indicator. These counters will be driven by a fast-running `clk` signal. The clock should increment once per second, as indicated by a pulse on the `ena` (enable) signal.

When a `reset` signal is received, the clock should be reset to 12:00 AM, regardless of the current state or the enable signal. The `pm` output will indicate whether the time is AM or PM (`pm` = 0 for AM, `pm` = 1 for PM). The time is represented using Binary-Coded Decimal (BCD) format:

- `hh` represents the hours in the range 01-12 using two BCD digits.
- `mm` represents the minutes in the range 00-59 using two BCD digits.
- `ss` represents the seconds in the range 00-59 using two BCD digits.

Key points to consider:
- The `reset` signal has higher priority than the `enable` signal. This means that when `reset` is active, it will immediately reset the time to 12:00 AM regardless of whether `ena` is active or not.
- The transition from 11:59:59 PM should correctly advance to 12:00:00 AM.
- The transition from 12:59:59 PM should correctly advance to 01:00:00 PM.
- There should be no representation for 00:00:00 in this 12-hour clock format.

Your implementation should be encapsulated within a Verilog module as described below:

```verilog
module top_module(
    input clk,              // Fast-running clock signal
    input reset,            // Reset signal to reset the clock to 12:00 AM
    input ena,              // Enable signal that pulses once per second 
    output reg pm,          // AM/PM indicator (0 for AM, 1 for PM)
    output reg [7:0] hh,    // Hours in BCD (01-12)
    output reg [7:0] mm,    // Minutes in BCD (00-59)
    output reg [7:0] ss);   // Seconds in BCD (00-59)

    // Please insert your logic implementation here

endmodule
```