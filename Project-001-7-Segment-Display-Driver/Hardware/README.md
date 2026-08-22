# Project 001 – DE10-Lite FPGA Hardware Implementation

## Overview    

This folder documents the physical hardware implementation and testing of the **FPGA 7-Segment Display Driver** developed in Project 001.

After the VHDL design was created, simulated, verified, assigned to physical FPGA pins, and compiled in Intel Quartus Prime Lite, the completed design was programmed onto the **Terasic DE10-Lite FPGA Development Board**.

The hardware demonstration provides evidence that the FPGA design progressed beyond software simulation and was tested on a physical FPGA development platform.

---

# Hardware Used

## Development Board

**Terasic DE10-Lite FPGA Development Board**

The DE10-Lite is based on the Intel MAX 10 FPGA family and provides on-board hardware resources that can be used for digital-logic development and testing.

For this project, the board provided the physical platform for implementing and testing the 7-segment display-driver design.

---

# FPGA Device

The Quartus project targets the following Intel MAX 10 FPGA device:

`10M50DAF484C6GES`

The FPGA configuration was developed and compiled in Quartus Prime Lite before being transferred to the board.

---

# Hardware Interface

The project uses physical DE10-Lite resources to interact with the FPGA design.

The logical FPGA signals are:

| Signal | Direction | Purpose |
|---|---|---|
| `D[3..0]` | Input | Provides the digital input value |
| `EN` | Input | Controls the display-enable condition |
| `S[6..0]` | Output | Controls the seven display segments |

These logical signals were mapped to physical FPGA pins using Quartus Pin Planner.

---

# Hardware Signal Flow

The hardware implementation can be represented as:

```text
DE10-Lite Input Switches
          |
          v
       D[3..0]
          |
          +──────────────┐
                         |
EN Input ────────────────┤
                         v
                    ┌─────────┐
                    │   SSD   │
                    │  VHDL   │
                    └────┬────┘
                         |
                         v
                     S[6..0]
                         |
                         v
               7-Segment Display
```

The FPGA processes the input signals according to the VHDL display-driver logic and produces the corresponding seven output signals.

---

# Hardware Implementation Process

## Step 1 – Complete the FPGA Design

The display-driver logic was first developed using VHDL.

The primary source file is:

`SSD.vhd`

The design was then incorporated into the top-level Quartus schematic.

---

## Step 2 – Verify the Design Through Simulation

Before programming the FPGA, the design was tested using the Quartus waveform simulation environment.

The primary signals evaluated were:

- `D[3..0]`
- `EN`
- `S[6..0]`

Functional simulation provided an opportunity to verify the digital logic before physical implementation.

---

## Step 3 – Assign Physical FPGA Pins

Quartus Pin Planner was used to map the logical FPGA signals to physical pins associated with the DE10-Lite board.

This step connected the software-defined design to the physical:

- Input controls
- Enable signal
- 7-segment display outputs

The pin assignments are stored in the Quartus project configuration.

---

## Step 4 – Compile the Project

The completed design was compiled for the Intel MAX 10 FPGA.

Compilation processed the VHDL logic, top-level schematic, FPGA configuration, and physical pin assignments.

Successful compilation prepared the design for FPGA programming.

---

## Step 5 – Connect the DE10-Lite Board

The DE10-Lite development board was connected to the computer through the USB programming interface.

Quartus Programmer was configured to communicate with the board.

### Programming Configuration

```text
Hardware: USB-Blaster
Mode: JTAG
Target: Intel MAX 10 FPGA
Board: Terasic DE10-Lite
```

---

## Step 6 – Program the FPGA

The compiled FPGA design was transferred from Quartus Prime Lite to the DE10-Lite board.

The programming path was:

```text
Quartus Prime Lite
       |
       v
Quartus Programmer
       |
       v
USB-Blaster
       |
       v
JTAG
       |
       v
Intel MAX 10 FPGA
       |
       v
DE10-Lite
```

Successful programming established that the FPGA board could receive and execute the compiled digital design.

---

# Physical Hardware Testing

## Step 7 – Apply Input Conditions

After programming the FPGA, the physical board controls were used to apply different digital input conditions.

The 4-bit input:

`D[3..0]`

provides the value processed by the SSD logic.

The enable signal:

`EN`

controls the display-enable behavior.

---

## Step 8 – Observe the 7-Segment Display

The physical 7-segment display was observed while changing the FPGA inputs.

The output:

`S[6..0]`

controls the individual display segments according to the implemented VHDL logic.

This allowed the simulated FPGA behavior to be compared with the actual hardware response.

---

# Hardware Verification

The hardware test represents the final verification stage of the project.

The complete verification process consisted of two major levels:

## Software Verification

```text
VHDL
  |
  v
Quartus Simulation
  |
  v
Waveform Analysis
  |
  v
Expected Digital Output
```

## Hardware Verification

```text
Compiled FPGA Design
        |
        v
DE10-Lite Programming
        |
        v
Physical Input Testing
        |
        v
7-Segment Display Response
        |
        v
Hardware Verification
```

Using both simulation and physical testing provided stronger validation than relying on either method alone.

---

# Hardware Demonstration Video

## File

`DE10-Lite-7-Segment-Demo.mp4`

The demonstration video documents the FPGA design operating on the physical DE10-Lite development board.

### Watch the Demonstration

[View DE10-Lite 7-Segment Display Hardware Demo](DE10-Lite-7-Segment-Demo.mp4)

The video provides visual evidence of the physical implementation and testing stage of the project.

---

# Complete Project Workflow

The hardware demonstration represents the final stage of the complete FPGA engineering workflow:

```text
Digital Design Requirements
          |
          v
     VHDL Development
          |
          v
     SSD Symbol Creation
          |
          v
   Top-Level Schematic
          |
          v
   Functional Simulation
          |
          v
    Waveform Verification
          |
          v
      Pin Assignment
          |
          v
       Compilation
          |
          v
   Quartus Programmer
          |
          v
  USB-Blaster / JTAG
          |
          v
    DE10-Lite FPGA
          |
          v
Physical Hardware Testing
          |
          v
7-Segment Display Verification
```

---

# Skills Demonstrated

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA Development
- FPGA Programming
- Digital Input/Output
- Physical Pin Mapping
- 7-Segment Display Control
- Hardware Testing

## FPGA Programming

- USB-Blaster
- JTAG
- Quartus Programmer
- FPGA Device Configuration
- Hardware Implementation

## Digital Design

- VHDL
- Digital Logic
- 4-Bit Input Processing
- Enable Logic
- 7-Bit Segment Control
- 7-Segment Display Driver

## Verification

- Functional Simulation
- Waveform Analysis
- Hardware Verification
- Expected-versus-Actual Comparison
- Testing and Validation
- Troubleshooting

## Engineering

- Hardware/Software Integration
- Digital-System Implementation
- Systematic Testing
- Problem Solving
- Technical Documentation

---

# What the Hardware Demonstration Shows

The hardware demonstration is an important part of this project because it provides evidence that the design was not limited to a software simulation.

The project progressed from:

**VHDL source code → simulation → FPGA configuration → physical hardware implementation**

This demonstrates practical experience working with both FPGA development software and physical digital hardware.

---

# Related Project Files

## Main Project

[Project 001 Main README](../README.md)

## Quartus Source Files

[Quartus Source Files](../Quartus/)

This folder contains the VHDL source, Quartus project configuration, schematic, symbol, and simulation waveform.

## Development Screenshots

[Project Screenshots](../Screenshots/)

This folder documents the Quartus design, simulation, Pin Planner, compilation, and programming process.

## Supporting Documentation

[Project Documentation](../Documentation/)

This folder contains supporting laboratory documentation for Project 001.

---

# Purpose of This Folder

This folder documents the physical implementation and testing of the FPGA 7-segment display-driver project.

The DE10-Lite demonstration complements the VHDL source code, Quartus project files, and simulation results by showing the design operating on physical FPGA hardware.

Together, these artifacts demonstrate practical experience with **FPGA design, VHDL, Quartus Prime Lite, simulation, pin assignment, JTAG programming, DE10-Lite hardware, and digital-system verification**.
