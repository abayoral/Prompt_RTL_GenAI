Imagine you’re leading a project as a senior FPGA Design Engineer where you must develop one of the essential Verilog modules for a state-of-the-art hardware product. In this project, you are required to design a collection of counters that function as a 12-hour clock complete with an AM/PM indicator. The specifications are as follows:

• The clock operates using a fast-running clock input (clk) where an enable signal (ena) indicates when the clock should tick forward—in this instance, it should increment once every second.

• Additionally, there is a reset input that, whenever asserted, will immediately reset the clock to 12:00 AM. This reset functionality takes priority over the enable signal, even if the enable is active.

• The clock’s time should be represented using three pairs of Binary-Coded Decimal (BCD) digits:
  – The hours (hh) should be encoded over two BCD digits, following the 12-hour format (values ranging from 01 to 12).
  – The minutes (mm) and seconds (ss) should also be encoded over two BCD digits each, both ranging from 00 to 59.
  – The AM/PM status is conveyed by a single output bit (pm), where a value of 0 represents AM and a value of 1 represents PM.

• Special attention should be paid to the rollover conditions:
  – When the clock reaches 11:59:59 PM, it should reset to 12:00:00 AM.
  – In the case of 12:59:59 PM, the clock should advance to 01:00:00 PM.
  – Note that there is no 00:00:00 state, so your design should avoid generating this invalid time.

The top-level module is defined as follows:

module top_module(
  input clk,
  input reset,
  input ena,
  output pm,
  output [7:0] hh,
  output [7:0] mm,
  output [7:0] ss); 

Each output signal corresponds to the BCD representation or the AM/PM indicator described. Your task is to write the necessary Verilog code to implement this module design strictly adhering to these constraints. No solution or specific code example is needed here—focus purely on understanding and clarifying the requirements before implementation.