# Project 002 – DE10-Lite Hardware Demonstration

## Overview

This folder contains the physical hardware demonstration for **Project 002 – FPGA 4-Bit Up Counter**.

The video demonstrates the completed digital counter after the design was compiled in Intel Quartus Prime Lite and programmed onto the Terasic DE10-Lite FPGA Development Board.

---

# Hardware Demonstration

## Video File

[`DE10-Lite-4-Bit-Up-Counter-Demo.mp4`](DE10-Lite-4-Bit-Up-Counter-Demo.mp4)

## Watch the Demonstration

[View DE10-Lite 4-Bit Up Counter Demo](DE10-Lite-4-Bit-Up-Counter-Demo.mp4)

---

# Hardware Platform

The project was implemented using:

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Target Device: 10M50DAF484C6GES
Programming Interface: USB-Blaster
Programming Mode: JTAG
```

---

# Counter Signals

The implemented counter uses:

```text
Inputs:
CLK
CLRN

Outputs:
QA
QB
QC
QD
```

The outputs represent the current binary count:

```text
QD QC QB QA
```

---

# Hardware Implementation Process

## Step 1 – Complete the Digital Design

The 4-bit up counter was first constructed using the Quartus Block Diagram/Schematic Editor.

The design uses four sequential flip-flop stages.

---

## Step 2 – Verify the Counter Through Simulation

Before physical implementation, the counter was tested using the Quartus Simulation Waveform Editor.

The simulation verified:

- Clock operation
- Clear/reset behavior
- Counter state transitions
- Binary output sequence

---

## Step 3 – Assign Physical FPGA Pins

Quartus Pin Planner was used to connect the logical design signals to physical FPGA pins.

The assigned signals include:

```text
CLK
CLRN
QA
QB
QC
QD
```

---

## Step 4 – Compile the FPGA Design

The project was compiled for the MAX 10 FPGA.

Quartus reported a successful full compilation with zero errors.

---

## Step 5 – Connect the DE10-Lite

The DE10-Lite development board was connected to the computer using the USB-Blaster programming interface.

---

## Step 6 – Configure Quartus Programmer

Quartus Programmer was configured using:

```text
Hardware: USB-Blaster
Mode: JTAG
Target: Intel MAX 10 FPGA
```

---

## Step 7 – Program the FPGA

The compiled design was transferred to the FPGA.

After programming, the digital counter became active on the physical DE10-Lite hardware.

---

## Step 8 – Verify Hardware Operation

The implemented counter was tested on the board to verify that the physical FPGA behavior corresponded to the simulated digital design.

The hardware demonstration video documents this final stage.

---

# FPGA Implementation Workflow

```text
4-Bit Counter Design
        |
        v
Functional Simulation
        |
        v
Waveform Verification
        |
        v
FPGA Pin Assignment
        |
        v
Successful Compilation
        |
        v
USB-Blaster Connection
        |
        v
JTAG Programming
        |
        v
DE10-Lite FPGA
        |
        v
Physical Hardware Verification
```

---

# Skills Demonstrated

The hardware implementation demonstrates practical experience with:

- FPGA Development
- Sequential Digital Logic
- Binary Counters
- Flip-Flops
- Clocked Circuits
- Intel MAX 10 FPGA
- Terasic DE10-Lite
- FPGA Pin Mapping
- Quartus Programmer
- USB-Blaster
- JTAG Programming
- Hardware Testing
- Hardware/Software Integration
- Design Verification
- Troubleshooting

---

# Related Project Sections

Return to the complete project overview:

[Project 002 Main README](../README.md)

View the Quartus source files:

[Quartus Source Files](../Quartus/)

View the development screenshots:

[Project Screenshots](../Screenshots/)

---

# Purpose of This Folder

The purpose of this folder is to provide evidence of the final physical implementation of the 4-bit up counter.

The hardware demonstration complements the Quartus source files and simulation screenshots by showing that the digital design progressed beyond software simulation and was implemented and tested on a physical FPGA development board.
