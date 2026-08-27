# Project 002 – FPGA 4-Bit Up Counter

## Project Overview

This project demonstrates the design, simulation, compilation, and FPGA implementation of a **4-bit binary up counter** using **Intel Quartus Prime Lite** and the **Terasic DE10-Lite FPGA Development Board**.

The counter was constructed using four D-type flip-flops arranged to generate a 4-bit binary counting sequence.

The design includes:

- Clock input
- Active-low clear/reset input
- Four flip-flop stages
- Four binary outputs
- Functional waveform simulation
- FPGA pin assignments
- Successful Quartus compilation
- USB-Blaster/JTAG programming
- Physical DE10-Lite testing

The project demonstrates the complete FPGA development workflow from digital schematic design through hardware verification.

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

The 4-bit counter uses the following signals:

| Signal | Direction | Purpose |
|---|---|---|
| `CLK` | Input | Provides the clock signal that advances the counter |
| `CLRN` | Input | Clears/resets the counter |
| `QA` | Output | Least significant counter bit |
| `QB` | Output | Counter bit 1 |
| `QC` | Output | Counter bit 2 |
| `QD` | Output | Most significant counter bit |

---

# Counter Architecture

The counter is built using four D flip-flop stages.

The four outputs represent a 4-bit binary value:

```text
QD QC QB QA
