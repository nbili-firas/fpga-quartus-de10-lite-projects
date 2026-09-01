# Project 007 – DE10-Lite LFSR Random Scrolling Display Hardware Demonstration

## Overview

This folder contains the physical hardware demonstration for **Project 007 – FPGA LFSR Random Scrolling Display**.

The completed design was implemented on the **Terasic DE10-Lite FPGA Development Board** using the Intel MAX 10 FPGA.

The system generates pseudo-random hexadecimal values using a Linear Feedback Shift Register and automatically scrolls the resulting display data across the FPGA's 7-segment display system.

---

# Hardware Demonstration Video

## File

```text
DE10-Lite-LFSR-Random-Scrolling-Display-Demo.mp4
```

## Watch the Demonstration

[View DE10-Lite LFSR Random Scrolling Display Demo](DE10-Lite-LFSR-Random-Scrolling-Display-Demo.mp4)

---

# Hardware Platform

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
Programming Interface: USB-Blaster
Programming Mode: JTAG
```

---

# Hardware Objective

The physical implementation demonstrates a system that:

1. Generates pseudo-random digital values.
2. Converts those values into hexadecimal characters.
3. Sequentially controls display positions.
4. Scrolls the resulting data across the 7-segment displays.
5. Continues operating automatically using the FPGA clock.

---

# Random Number Generation

The hardware uses a Linear Feedback Shift Register.

The LFSR produces a four-bit pseudo-random value.

```text
LFSR
 |
 v
D[3..0]
```

The state changes automatically when the system is enabled and clocked.

---

# Hexadecimal Display

The four-bit LFSR value is sent to:

```text
Display.vhd
```

The display driver supports:

```text
0
1
2
3
4
5
6
7
8
9
A
b
C
d
E
F
```

The module converts the four-bit value into:

```text
S[6..0]
```

for the 7-segment display.

---

# Johnson Counter

The Johnson counter controls the sequence in which the display positions are enabled.

Conceptually:

```text
Clock
 |
 v
Johnson Counter
 |
 +--> Position 1
 +--> Position 2
 +--> Position 3
 +--> Position 4
```

This provides the sequential display behavior required for scrolling.

---

# Automatic Clocking

Unlike the earlier manually clocked scrolling-display project, this design uses the DE10-Lite onboard clock.

A clock divider reduces the high-frequency FPGA clock to a rate appropriate for visible scrolling.

The resulting process runs automatically after the system is enabled.

---

# Enable Control

The practical hardware implementation uses:

```text
SW4
```

as the enable input.

When SW4 is enabled, the FPGA system begins or continues the scrolling sequence.

---

# Hardware Signal Flow

```text
DE10-Lite Clock
       |
       v
 Clock Divider
       |
       v
  Slow Clock
       |
       +----------------+
       |                |
       v                v
     LFSR          Johnson Counter
       |                |
       v                |
    D[3..0]             |
       |                |
       v                |
 Display.vhd            |
       |                |
       v                v
    S[6..0]      Position Enable
       |                |
       +--------+-------+
                |
                v
        7-Segment Displays
                |
                v
       Random Scrolling Data
```

---

# Hardware Operation

The physical sequence follows:

```text
Program FPGA
     |
     v
Enable with SW4
     |
     v
Clock Divider Runs
     |
     v
LFSR Generates Value
     |
     v
Display.vhd Decodes Value
     |
     v
Johnson Counter Selects Position
     |
     v
Character Appears on Display
     |
     v
Display Position Advances
     |
     v
Random Data Scrolls
     |
     v
Process Repeats
```

---

# Pseudo-Random Sequence

The LFSR does not generate a simple sequence such as:

```text
0
1
2
3
4
5
...
```

Instead, feedback produces a sequence such as:

```text
15
14
12
8
1
2
5
3
15
7
...
```

This provides changing hexadecimal display data for the scrolling system.

---

# Hardware Verification

The demonstration video verifies:

- LFSR operation
- Pseudo-random state generation
- Hexadecimal display decoding
- Automatic clocking
- Sequential display enabling
- Johnson counter operation
- FPGA display control
- Continuous scrolling behavior
- Physical DE10-Lite implementation

---

# Complete Hardware Workflow

```text
LFSR Design
      |
      v
Pseudo-Random Output
      |
      v
Display Decoder
      |
      v
Hexadecimal Character
      |
      v
Johnson Sequencer
      |
      v
Display Position Control
      |
      v
Clock Divider
      |
      v
Automatic Scrolling
      |
      v
Quartus Compilation
      |
      v
USB-Blaster / JTAG
      |
      v
MAX 10 FPGA
      |
      v
DE10-Lite Displays
      |
      v
Physical Verification
```

---

# Skills Demonstrated

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA Clocking
- FPGA Digital Outputs
- Switch Input
- 7-Segment Display Control
- USB-Blaster
- JTAG Programming

## Sequential Logic

- Linear Feedback Shift Registers
- Johnson Counters
- Shift Registers
- Clock Division
- Enable Logic
- Sequential Display Control

## VHDL

- Hexadecimal Decoder
- 7-Segment Display Driver
- HDL-Based Combinational Logic
- FPGA Module Integration

## Verification

- Functional Simulation
- Waveform Analysis
- Pseudo-Random Sequence Verification
- State-Sequence Verification
- Hardware Testing
- Physical Validation

## Engineering

- Modular System Design
- Hierarchical FPGA Integration
- Troubleshooting
- Testing and Validation
- Hardware/Software Integration

---

# What the Hardware Demonstration Proves

The video demonstrates that the final project progressed through the complete engineering process:

```text
Digital Logic Design
        |
        v
Subsystem Simulation
        |
        v
HDL Development
        |
        v
Hierarchical Integration
        |
        v
Final Compilation
        |
        v
FPGA Pin Mapping
        |
        v
JTAG Programming
        |
        v
Physical FPGA Operation
```

The project is therefore not limited to schematic design or simulation; the complete system was implemented and tested on a physical FPGA development board.

---

# Related Project Sections

Main project:

```text
../README.md
```

Quartus source:

```text
../Quartus/
```

Development screenshots:

```text
../Screenshots/
```

---

# Conclusion

The DE10-Lite hardware demonstration confirms the operation of the Project 007 pseudo-random scrolling-display system.

By combining a Linear Feedback Shift Register, VHDL hexadecimal display decoder, Johnson counter, clock divider, and physical 7-segment displays, the project demonstrates a complete sequential FPGA application integrating pseudo-random data generation with automatic display control.
