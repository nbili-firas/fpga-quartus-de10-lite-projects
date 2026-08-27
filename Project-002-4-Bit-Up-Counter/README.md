# Project 002 – FPGA 4-Bit Up Counter

## Project Overview

This project demonstrates the design, simulation, compilation, FPGA programming, and hardware implementation of a **4-bit binary up counter** using **Intel Quartus Prime Lite** and the **Terasic DE10-Lite FPGA Development Board**.

The counter was implemented as a sequential digital circuit using four flip-flop stages. A clock signal advances the counter through its binary sequence, while the clear input provides reset control.

The four counter outputs are:

- `QA`
- `QB`
- `QC`
- `QD`

Together, these outputs represent the current 4-bit binary count.

The project follows the complete FPGA development workflow from schematic design and functional simulation through pin assignment, compilation, FPGA programming, and physical hardware verification.

---

## Project Objectives

The objectives of this project were to:

- Design a 4-bit binary up counter.
- Apply sequential digital logic concepts.
- Implement the counter using flip-flop stages.
- Configure clock and clear/reset inputs.
- Generate four binary counter outputs.
- Build the design using the Quartus Block Diagram/Schematic Editor.
- Simulate the counter using the Quartus Simulation Waveform Editor.
- Verify the expected binary counting sequence.
- Assign FPGA pins using Quartus Pin Planner.
- Compile the design for the Intel MAX 10 FPGA.
- Program the DE10-Lite board using USB-Blaster and JTAG.
- Verify the counter on physical FPGA hardware.
- Document the complete FPGA development process.

---

## Software and Hardware

### Software

- Intel Quartus Prime Lite
- Quartus Block Diagram/Schematic Editor
- Quartus Simulation Waveform Editor
- Quartus Pin Planner
- Quartus Programmer

### Hardware

- Terasic DE10-Lite FPGA Development Board
- Intel MAX 10 FPGA
- USB-Blaster programming interface
- JTAG programming mode

### Target FPGA

`10M50DAF484C6GES`

---

# Design Inputs and Outputs

The counter uses two inputs and four outputs.

| Signal | Direction | Purpose |
|---|---|---|
| `CLK` | Input | Clock signal used to advance the counter |
| `CLRN` | Input | Clear/reset control |
| `QA` | Output | Least significant counter bit |
| `QB` | Output | Counter bit 1 |
| `QC` | Output | Counter bit 2 |
| `QD` | Output | Most significant counter bit |

The four outputs form the binary value:

```text
QD QC QB QA
```

---

# Counter Architecture

The design uses four sequential flip-flop stages to create a 4-bit binary counter.

The output stages operate at progressively lower frequencies.

```text
Clock
  |
  v
+--------+
| Stage 0|----> QA
+--------+
    |
    v
+--------+
| Stage 1|----> QB
+--------+
    |
    v
+--------+
| Stage 2|----> QC
+--------+
    |
    v
+--------+
| Stage 3|----> QD
+--------+
```

The resulting outputs represent a binary counting sequence.

Example:

```text
QD QC QB QA

0  0  0  0
0  0  0  1
0  0  1  0
0  0  1  1
0  1  0  0
0  1  0  1
0  1  1  0
0  1  1  1
1  0  0  0
...
```

---

# Development Process

## Step 1 – Create the Quartus Project

A new Quartus Prime Lite project was created for the 4-bit up counter.

The project was configured for:

```text
FPGA Family: MAX 10
Device: 10M50DAF484C6GES
Top-Level Entity: FourBitUPCounter
```

The primary project configuration files are:

- `FourBitUPCounter.qpf`
- `FourBitUPCounter.qsf`

---

## Step 2 – Build the Counter Schematic

The counter circuit was constructed using the Quartus Block Diagram/Schematic Editor.

The primary schematic file is:

`FourBitUPCounter.bdf`

The schematic contains:

- Clock input
- Clear/reset input
- Four flip-flop stages
- Feedback connections
- Inversion logic
- Four counter outputs

The outputs are labeled:

```text
QA
QB
QC
QD
```

### Counter Schematic

![4-Bit Up Counter Schematic](Screenshots/Picture1.png)

---

## Step 3 – Compile the Initial Design

After completing the schematic, the design was compiled using Quartus Prime Lite.

Compilation checks the design for implementation errors and prepares the project for simulation and FPGA programming.

The project compiled successfully with:

```text
Full Compilation: Successful
Errors: 0
```

### Compilation Report

![Quartus Compilation Report](Screenshots/Picture2.png)

The Flow Summary shows:

```text
Flow Status: Successful
Family: MAX 10
Device: 10M50DAF484C6GES
Total Logic Elements: 8
Total Registers: 4
Total Pins: 6
```

---

# Functional Simulation

## Step 4 – Create the Simulation Waveform

A simulation waveform was created using the Quartus Simulation Waveform Editor.

The waveform file is:

`Waveform.vwf`

The following signals were added:

```text
CLK
CLRN
QA
QB
QC
QD
```

The initial waveform configuration is documented below.

![Initial Simulation Waveform](Screenshots/Picture3.png)

---

## Step 5 – Configure the Clock and Clear Inputs

A periodic clock waveform was applied to `CLK`.

The `CLRN` signal was configured to allow the counter to operate from a known cleared state.

The clock provides the transitions required for the sequential circuit to advance through its binary states.

---

## Step 6 – Run the Functional Simulation

The functional simulation was executed to verify the behavior of the counter.

### Simulation Result

![4-Bit Up Counter Simulation](Screenshots/Picture4.png)

The waveform demonstrates the expected relationship between the outputs:

```text
QA = fastest-changing output
QB = lower-frequency output
QC = lower-frequency output
QD = slowest-changing output
```

Each output changes at approximately half the frequency of the preceding counter stage.

This produces the expected 4-bit binary counting sequence.

---

# Reset Operation

The `CLRN` input provides clear/reset control for the counter.

When the clear condition is asserted, the flip-flop outputs return to the cleared state:

```text
QD QC QB QA
0  0  0  0
```

Normal counting resumes when the counter is released from the clear condition and clock transitions are applied.

---

# FPGA Pin Assignment

## Step 7 – Assign Physical FPGA Pins

After simulation verification, Quartus Pin Planner was used to connect the logical design signals to physical FPGA pins on the DE10-Lite board.

The project uses six FPGA signals:

```text
CLK
CLRN
QA
QB
QC
QD
```

The assignments shown in the project are:

| Signal | FPGA Pin |
|---|---|
| `CLK` | `PIN_B8` |
| `CLRN` | `PIN_C11` |
| `QA` | `PIN_A8` |
| `QB` | `PIN_A9` |
| `QC` | `PIN_A10` |
| `QD` | `PIN_B10` |

### Quartus Pin Planner

![Quartus Pin Planner](Screenshots/Picture5.png)

Pin assignment connects the logical FPGA design to the physical input and output resources used on the DE10-Lite board.

---

# FPGA Programming

## Step 8 – Prepare the DE10-Lite Board

The DE10-Lite FPGA development board was connected to the computer using the USB-Blaster interface.

Quartus Programmer was configured using:

```text
Hardware: USB-Blaster
Mode: JTAG
Device Family: MAX 10
```

---

## Step 9 – Load the Compiled FPGA Design

The compiled FPGA programming file was loaded into Quartus Programmer.

The target device detected by Quartus corresponds to the Intel MAX 10 FPGA installed on the DE10-Lite board.

### Quartus Programmer

![Quartus Programmer](Screenshots/Picture6.png)

---

## Step 10 – Program the FPGA

The design was transferred from Quartus Programmer to the DE10-Lite FPGA through the USB-Blaster/JTAG interface.

This stage moves the counter from software-based simulation to actual FPGA hardware.

---

# Hardware Verification

## Step 11 – Test the Counter on the DE10-Lite

After programming the FPGA, the counter was tested using the physical DE10-Lite development board.

The four counter outputs represent the current binary count.

The hardware demonstration provides physical verification that the digital design operates after FPGA implementation.

[View DE10-Lite 4-Bit Up Counter Hardware Demo](Hardware/DE10-Lite-4-Bit-Up-Counter-Demo.mp4)

---

# Complete FPGA Development Workflow

```text
Project Requirements
        |
        v
Sequential Logic Design
        |
        v
Quartus Project Creation
        |
        v
4-Bit Counter Schematic
        |
        v
Design Compilation
        |
        v
Waveform Development
        |
        v
Functional Simulation
        |
        v
Binary Sequence Verification
        |
        v
FPGA Pin Assignment
        |
        v
Final Compilation
        |
        v
USB-Blaster / JTAG Programming
        |
        v
DE10-Lite Hardware Testing
        |
        v
Final Verification
```

---

# Project Results

The project successfully implemented and verified a 4-bit binary up counter.

The completed project demonstrates:

- Sequential digital logic
- Four flip-flop counter stages
- Clock-controlled state transitions
- Clear/reset functionality
- Four-bit binary output
- Functional waveform simulation
- Binary counting verification
- FPGA pin mapping
- Successful Quartus compilation
- USB-Blaster/JTAG programming
- DE10-Lite hardware implementation

---

# Project Files

## Quartus Source Files

The Quartus source files are located in:

[Quartus Source Files](Quartus/)

The folder contains:

| File | Purpose |
|---|---|
| `FourBitUPCounter.qpf` | Quartus project file |
| `FourBitUPCounter.qsf` | Quartus settings and FPGA assignments |
| `FourBitUPCounter.bdf` | 4-bit counter schematic |
| `FourBitUPCounter.bsf` | Quartus symbol file |
| `Waveform.vwf` | Simulation waveform |
| `DE10_LITE_Golden_Top.v` | DE10-Lite reference/top-level Verilog file |

---

## Project Screenshots

Design, simulation, compilation, pin-assignment, and programming screenshots are located in:

[Project Screenshots](Screenshots/)

---

## Hardware Demonstration

The physical DE10-Lite demonstration is located in:

[Hardware Demonstration](Hardware/)

Direct video:

[Watch DE10-Lite 4-Bit Up Counter Demo](Hardware/DE10-Lite-4-Bit-Up-Counter-Demo.mp4)

---

# Skills Demonstrated

## FPGA and Digital Logic

- FPGA Development
- Digital Logic Design
- Sequential Logic
- Binary Counters
- Flip-Flops
- Clocked Digital Circuits
- Reset Logic
- Digital State Sequencing

## Quartus Prime Lite

- Quartus Project Development
- Block Diagram/Schematic Editor
- Functional Simulation
- Simulation Waveform Editor
- Pin Planner
- FPGA Device Configuration
- Compilation
- Flow Summary Analysis
- Quartus Programmer

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA Pin Mapping
- USB-Blaster
- JTAG Programming
- Physical Hardware Testing

## Engineering

- Sequential Circuit Design
- Digital-System Analysis
- Timing Analysis
- Simulation
- Design Verification
- Troubleshooting
- Testing and Validation
- Hardware/Software Integration
- Technical Documentation

---

# What I Learned

This project strengthened my understanding of sequential digital logic and FPGA-based counter implementation.

I gained practical experience constructing a multi-stage binary counter, applying clock and reset signals, observing the relationship between flip-flop outputs, and verifying the expected binary sequence through functional simulation.

The project also provided experience using Quartus Prime Lite for schematic development, waveform simulation, pin assignment, compilation, and FPGA programming.

Implementing the design on the DE10-Lite reinforced the importance of verifying a digital circuit through simulation before moving to physical hardware.

---

# Conclusion

Project 002 demonstrates the complete design and implementation of a 4-bit binary up counter using Intel Quartus Prime Lite and the Terasic DE10-Lite FPGA development board.

The project progressed from sequential circuit design through schematic development, compilation, functional simulation, waveform verification, FPGA pin assignment, JTAG programming, and physical hardware testing.

The completed project provides practical evidence of experience with **sequential logic, binary counters, flip-flops, FPGA development, functional simulation, pin assignment, FPGA programming, and hardware verification**.
