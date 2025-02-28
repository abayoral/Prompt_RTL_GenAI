Imagine you're a senior Digital Design Engineer at a top-tier hardware design firm, and you're responsible for developing a crucial Verilog module for a next-generation computer hardware product. This module plays a pivotal role in the overall system performance and, by extension, in maintaining your company's esteemed reputation in the industry.

Your task is to architect a finite state machine (FSM) that controls a shift register by enabling it for an exact duration of four clock cycles under specific conditions. Specifically, the FSM must be designed so that upon any reset, the output signal (shift_ena) is asserted for exactly four sequential clock cycles. After these four cycles, the shift_ena signal should remain deasserted (i.e., held at 0) indefinitely—until another reset occurs.

Key Points to Consider:
• The FSM operates synchronously, and the reset input is synchronous as well.
• Upon reset, the FSM should automatically initiate the four-cycle activation of the shift register.
• After the four-cycle period, shift_ena must remain inactive (logic 0) even if the clock continues to run, and only a subsequent reset can restart the process.
• Your design should be encapsulated within the provided Verilog module template.

With these points in mind, your challenge is to design an FSM that reliably meets these timing and control requirements. Please clarify your approach and reasoning for the design without including any actual solutions or code implementations.