UART Transmitter and Receiver using Verilog HDL

📌 Project Description

UART (Universal Asynchronous Receiver/Transmitter) is a serial communication protocol used to transmit and receive data between digital systems.

This project implements a basic UART Transmitter and UART Receiver using Verilog HDL.

The transmitter converts parallel 8-bit data into a serial data stream, while the receiver converts the serial data back into 8-bit parallel data.

UART Configuration

- Data bits: 8
- Start bits: 1
- Stop bits: 1
- Parity: None
- Data format: 8N1

---

🎯 Objective

To design and simulate a UART Transmitter and Receiver using Verilog HDL and verify that transmitted data is correctly received.

---

🔧 UART Frame Format

Idle    Start       Data Bits                  Stop
 1        0       D0 D1 D2 D3 D4 D5 D6 D7       1

UART transmits the least significant bit (LSB) first.

---

🏗️ Block Diagram

                 UART SYSTEM

        ┌──────────────────┐
        │ UART Transmitter │
        │                  │
Data ──►│   Parallel →     │──── TX ────┐
        │   Serial         │             │
        └──────────────────┘             │
                                         ▼
                                ┌────────────────┐
                                │ UART Receiver  │
                                │                │
                                │ Serial →       │───► Received Data
                                │ Parallel       │
                                └────────────────┘

---

📥 Transmitter Inputs

Signal| Description
clk| System clock
reset| Reset signal
tx_start| Starts transmission
tx_data[7:0]| 8-bit data to transmit

Transmitter Outputs

Signal| Description
tx| Serial output
tx_busy| Indicates transmission is in progress

---

📤 Receiver Inputs

Signal| Description
clk| System clock
reset| Reset signal
rx| Serial input

Receiver Outputs

Signal| Description
rx_data[7:0]| Received 8-bit data
rx_done| Indicates successful reception

---

🧪 Testbench

The testbench performs the following operations:

1. Generates the system clock.
2. Resets the UART.
3. Loads hexadecimal value "41".
4. Starts transmission.
5. Connects the transmitter output to the receiver input.
6. Waits for the receiver to complete.
7. Compares transmitted and received data.
8. Displays PASS or FAIL.

---

📊 Test Data

The testbench transmits:

Hexadecimal : 41
ASCII       : A
Binary      : 01000001

UART transmits the data bits LSB first:

D0 D1 D2 D3 D4 D5 D6 D7
 1  0  0  0  0  0  1  0

---

🖥️ Expected Console Output

--------------------------------
UART Simulation Result
--------------------------------
Transmitted Data : 41
Received Data    : 41
Received ASCII   : A
STATUS           : PASS
--------------------------------

---

📈 Simulation

The testbench generates a waveform file:

waveform.vcd

The waveform can be viewed using GTKWave.

Important signals to observe:

- "clk"
- "reset"
- "tx_start"
- "tx_data"
- "tx"
- "tx_busy"
- "rx_data"
- "rx_done"

Save the waveform screenshot as:

simulation/waveform.png

---

▶️ How to Run the Simulation

Step 1: Compile

Using Icarus Verilog:

iverilog -o uart_sim uart_tx.v uart_rx.v uart_tb.v

Step 2: Run

vvp uart_sim

Step 3: View Waveform

gtkwave waveform.vcd

---

🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- GitHub

---

📚 Applications of UART

UART is commonly used in:

- Microcontroller communication
- Embedded systems
- Serial terminals
- GPS modules
- Bluetooth modules
- FPGA communication
- Debugging interfaces
- Computer-to-device communication

---

⭐ Key Learning Outcomes

This project demonstrates:

- Serial communication
- Parallel-to-serial conversion
- Serial-to-parallel conversion
- UART frame structure
- Verilog state/control logic
- Testbench development
- Waveform analysis
- GitHub project organization

---

👩‍💻 Author

JAINY INDHU

Electronics and Communication Engineering