You are working with a finite state machine (FSM) designed to recognize correctly received bytes from a given stream of bits within a serial communication protocol. The primary function of this FSM is to detect the structure of a byte by identifying the start bit, sequentially collecting the subsequent 8 data bits, and then verifying the presence and correctness of the stop bit. Should the stop bit fail to appear when it is expected, the FSM is required to disregard the data and continue monitoring the stream until a valid stop bit is observed, enabling it to begin the process anew for the next byte.

Given this context, your task is to extend the existing FSM by incorporating a data path that effectively outputs the bytes that have been correctly received. The output, referred to as `out_byte`, must be valid (i.e., it should accurately represent the received 8 data bits) when a signal, `done`, is high (set to 1). When `done` is not active (when its value is not 1), the `out_byte` value is considered irrelevant or a "don't-care" state, meaning that its value does not impact the correctness of the system.

Furthermore, it's important to note a specific characteristic of the protocol: the serial communication protocol in use transmits data starting with the least significant bit (LSB) first. This detail is crucial for correctly handling the incoming sequence of bits, as the received bits need to be shifted in one at a time before they are inspected or used.

In light of the above requirements and context, the implementation should be structured such that it accounts for synchronous operations, driven by a clock (`clk`) as well as a synchronous reset (`reset`). The FSM logic will handle the state transitions based on the incoming serial bitstream (`in`), while the data path will ensure the proper collection and output of the received byte when the FSM has confirmed the byte's validity.

It's also suggested to build upon or integrate aspects of a predefined module named `Fsm_serial`, which likely encapsulates the FSM logic for detecting the start, data, and stop bits. The new component to be added must effectively manage the shifting and parallel reading of data bits to satisfy the output requirements.