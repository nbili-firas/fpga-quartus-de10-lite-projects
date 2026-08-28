# Project 003 – DE10-Lite 1.49 Hz Clock Hardware Demonstration

## Overview

This folder documents the physical FPGA implementation of **Project 003 – 1.49 Hz Clock Divider**.

The completed Quartus design was programmed onto the **Terasic DE10-Lite FPGA Development Board** and tested using the board's physical LED outputs.

The hardware demonstration provides evidence that the 25-bit counter operates as a real FPGA frequency divider rather than only as a software design.

---

# Hardware Platform

The project uses:

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
System Clock: 50 MHz
Programming Interface: USB-Blaster
Programming Mode: JTAG
```

---

# Hardware Demonstration Video

## File

[`DE10-Lite-1.49Hz-Clock-Demo.mp4`](DE10-Lite-1.49Hz-Clock-Demo.mp4)

## Watch the Demonstration

[View DE10-Lite 1.49 Hz Clock Demo](DE10-Lite-1.49Hz-Clock-Demo.mp4)

---

# Hardware Objective

The hardware implementation demonstrates how a high-frequency FPGA clock can be divided into slower observable signals.

The DE10-Lite provides a:

**50 MHz**

system clock.

The 25-bit binary counter divides this clock into progressively lower-frequency outputs.

The most significant bit:

`q[24]`

produces approximately:

**1.49 Hz**

---

# Frequency Division

The frequency relationship is:

```text
50 MHz
  |
  v
25-Bit Binary Counter
  |
  +---- q[24] ≈ 1.49 Hz
  |
  +---- q[23] ≈ 2.98 Hz
  |
  +---- q[22] ≈ 5.96 Hz
  |
  +---- q[21] ≈ 11.92 Hz
  |
  +---- q[20] ≈ 23.84 Hz
```

Each lower-order counter bit changes approximately twice as fast as the bit above it.

---

# Physical FPGA Connections

The relevant Quartus assignments are:

| Signal | FPGA Pin |
|---|---|
| `CLK` | `PIN_P11` |
| `q[24]` | `PIN_A8` |
| `q[23]` | `PIN_A9` |
| `q[22]` | `PIN_A10` |
| `q[21]` | `PIN_B10` |
| `q[20]` | `PIN_D13` |

The counter outputs were mapped to physical DE10-Lite output resources so their different rates could be observed.

---

# Hardware Implementation Process

## Step 1 – Create the 25-Bit Counter

The counter was generated using Quartus IP Catalog.

The configuration used:

```text
IP: LPM_COUNTER
Width: 25 bits
Direction: Up
Output: q[24..0]
```

---

## Step 2 – Build the Top-Level FPGA Design

The generated counter was placed in:

`Project6.bdf`

The 50 MHz clock input was connected to the counter, and the 25-bit output bus was exposed as:

`q[24..0]`

---

## Step 3 – Configure FPGA Pins

The input clock and selected counter outputs were mapped to physical MAX 10 FPGA pins.

This connected the logical design to actual DE10-Lite hardware.

---

## Step 4 – Compile the Design

The project was compiled in Quartus Prime Lite.

Successful compilation prepared the design for FPGA programming.

---

## Step 5 – Connect the DE10-Lite

The development board was connected using the USB-Blaster interface.

---

## Step 6 – Configure Quartus Programmer

Programming used:

```text
Hardware: USB-Blaster
Mode: JTAG
Target: Intel MAX 10 FPGA
```

---

## Step 7 – Program the FPGA

The compiled Project6 design was transferred to the DE10-Lite FPGA.

---

## Step 8 – Observe the Output Frequencies

The selected counter outputs were observed on the physical board.

The outputs demonstrate the binary frequency-divider relationship.

The slowest selected output:

`q[24]`

operates at approximately:

**1.49 Hz**

while each following selected bit changes progressively faster.

---

# Why Hardware Testing Matters

The slowest counter outputs are difficult to demonstrate meaningfully in a very short nanosecond-scale simulation window.

Physical FPGA implementation makes these low-frequency signals directly observable.

This provides practical verification of the relationship:

```text
High-Frequency FPGA Clock
          |
          v
Binary Counter
          |
          v
Frequency Division
          |
          v
Human-Observable LED Outputs
```

---

# Complete Hardware Workflow

```text
50 MHz DE10-Lite Clock
        |
        v
25-Bit Counter
        |
        v
Quartus Pin Mapping
        |
        v
Project Compilation
        |
        v
USB-Blaster / JTAG
        |
        v
MAX 10 FPGA
        |
        v
Counter Outputs
        |
        v
DE10-Lite LEDs
        |
        v
Physical Frequency Verification
```

---

# Skills Demonstrated

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA Clock Inputs
- FPGA Digital Outputs
- LED Output Mapping
- FPGA Programming
- Hardware Testing

## Digital Logic

- Binary Counters
- Frequency Division
- Sequential Logic
- Clock Signals
- Multi-Bit Counters
- Digital Timing

## Quartus

- IP Catalog
- LPM_COUNTER
- Pin Assignment
- Compilation
- Quartus Programmer
- USB-Blaster
- JTAG

## Engineering

- Frequency Calculation
- Hardware/Software Integration
- Testing
- Design Verification
- Troubleshooting
- Digital-System Analysis

---

# Related Project Sections

Return to the complete project overview:

[Project 003 Main README](../README.md)

View the Quartus source files:

[Quartus Source Files](../Quartus/)

View development screenshots:

[Project Screenshots](../Screenshots/)

---

# Purpose of This Folder

This folder provides evidence of the physical DE10-Lite implementation of the Project 003 frequency-divider design.

The hardware demonstration complements the Quartus project files by showing that the 25-bit counter was programmed onto a physical FPGA and used to derive low-frequency outputs from the board's 50 MHz system clock.
