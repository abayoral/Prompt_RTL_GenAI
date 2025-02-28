As a senior Digital Design Engineer at a prominent hardware design company, you are currently faced with the critical task of developing a Verilog module that plays a crucial role in a next-generation product. The successful implementation of this module is essential not only for the functionality of the product itself but also for upholding your company's esteemed reputation within the highly competitive computer hardware industry.

In the context of serial communication protocols, particularly the traditional ones, data transmission typically involves the inclusion of specific bits that help define the structure of the transmitted information. For instance, each data byte is usually framed by a start bit, followed by a series of data bits, and concluding with a stop bit. A widely adopted format consists of one start bit (0), eight data bits, and one stop bit (1), while the line rests at logic 1 during idle periods when no data is being sent.

Considering these guidelines, your objective is to design a finite state machine (FSM) capable of accurately detecting when bytes have been received correctly from a continuous stream of bits. The essential function of this FSM involves identifying the start bit, correctly waiting for the transmission of all eight data bits, and thereafter verifying the presence of a correct stop bit. Importantly, if the expected stop bit does not appear following the data bits, the FSM must not proceed to the reception of the next byte until it successfully identifies a valid stop bit in the stream.

In light of the requirements and specifications outlined, could you please provide a clear, detailed design for such a finite state machine in the context of the Verilog module? Specifically, how would you structure the FSM to ensure accurate byte identification and robust handling of bit reception, including error management for the absence of the expected stop bit? 

Here is a starting point of the Verilog module for your design:

```verilog
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    // Insert your code here

endmodule
```

Your insights and elaborations on the design strategy, including the state definitions and transitions, would be highly valuable in ensuring the successful implementation of this critical component.