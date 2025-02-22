As a senior FPGA Design Engineer at a prominent hardware design company, your task involves developing a critical digital component—a Verilog module—integral to the functionality of a cutting-edge product. Your responsibility is to engineer a system of counters implemented in Verilog that emulates a 12-hour clock, which is an essential feature for the product and contributes significantly to the reputation and competitiveness of your company in the high-tech industry.

The clock you are designing must be able to run on a fast clock signal, denoted as `clk`, and must increment its displayed time by one second whenever there is a pulse on the `ena` (enable) signal. The clock must also feature a reset functionality, activated by a `reset` signal, which sets the clock back to 12:00 AM, irrespective of whether the enable signal is active. This reset capability has higher priority over the enable signal, meaning the clock must reset as soon as the reset signal is received, without waiting for any enable condition.

The outputs of your module include a PM indicator (`pm`) and three separate time parameters—hours (`hh`), minutes (`mm`), and seconds (`ss`)—each represented as two BCD (Binary-Coded Decimal) digits. Being a 12-hour clock, the hour value (`hh`) should cycle between 01 and 12, while the minute (`mm`) and the second (`ss`) counters should both cycle between 00 and 59. An important aspect to consider is the correct handling of the transition period between AM and PM—for instance, transitioning from 11:59:59 PM to 12:00:00 AM, as well as from 12:59:59 PM to 01:00:00 PM, ensuring there is no representation of the time as 00:00:00.

Developing this module demands not only a robust understanding of digital logic design and BCD representation but also careful attention to detail in handling corner cases associated with time counting and format transitions.