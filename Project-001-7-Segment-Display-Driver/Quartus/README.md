# Project 001 – Quartus Prime Lite Source Files

## Overview

This folder contains the Intel Quartus Prime Lite source files used to develop, simulate, configure, and implement the FPGA 7-segment display driver for Project 001.

The design was developed using **VHDL** and implemented on the **Terasic DE10-Lite FPGA Development Board**.

The Quartus portion of the project demonstrates the complete digital-design workflow from HDL development through FPGA programming.

---

# Software and Target Hardware

## Software

- Intel Quartus Prime Lite
- VHDL
- Quartus Block Diagram/Schematic Editor
- Quartus Simulation Waveform Editor
- Quartus Pin Planner
- Quartus Programmer

## Target Hardware

- Terasic DE10-Lite FPGA Development Board
- Intel MAX 10 FPGA
- Device: `10M50DAF484C6GES`
- USB-Blaster programming interface
- JTAG programming mode

---

# Source Files

The following files make up the documented Quartus project:

| File | Purpose |
|---|---|
| [`Project3.qpf`](Project3.qpf) | Main Quartus project file |
| [`Project3.qsf`](Project3.qsf) | Quartus settings, device configuration, and pin assignments |
| [`Project3.bdf`](Project3.bdf) | Top-level Block Diagram/Schematic |
| [`SSD.vhd`](SSD.vhd) | VHDL source for the 7-segment display driver |
| [`SSD.bsf`](SSD.bsf) | Block Symbol File generated for the SSD module |
| [`Waveform.vwf`](Waveform.vwf) | Simulation waveform and test-vector file |
| [`DE10_LITE_Golden_Top.v`](DE10_LITE_Golden_Top.v) | DE10-Lite Verilog reference/top-level source included with the project |

---

# Design Interface

The 7-segment display module uses three primary signal groups:

| Signal | Direction | Width | Function |
|---|---|---:|---|
| `D[3..0]` | Input | 4 bits | Supplies the digital value to the display driver |
| `EN` | Input | 1 bit | Controls whether the display output is enabled |
| `S[6..0]` | Output | 7 bits | Controls the seven segments of the display |

The signal flow can be represented as:

```text
D[3..0] ─────┐
              │
              ▼
          ┌─────────┐
EN ──────►│   SSD   │──────► S[6..0]
          └─────────┘
```

---

# Development Process

## Step 1 – Create the Quartus Project

A new FPGA project was created in Intel Quartus Prime Lite.

The project was configured for the FPGA device used by the DE10-Lite development board.

The primary Quartus project files are:

- `Project3.qpf`
- `Project3.qsf`

These files preserve the project configuration and FPGA implementation settings.

---

## Step 2 – Develop the VHDL Display Driver

The 7-segment display logic was implemented in:

[`SSD.vhd`](SSD.vhd)

The VHDL module defines:

```vhdl
D  : IN std_logic_vector(3 downto 0);
EN : IN std_logic;
S  : OUT std_logic_vector(6 downto 0);
```

### Input `D`

`D[3..0]` provides the 4-bit digital input to the display-driver logic.

### Enable `EN`

`EN` provides display-enable control.

### Output `S`

`S[6..0]` produces the seven digital signals required to control the individual segments of the 7-segment display.

---

## Step 3 – Generate the SSD Symbol

After developing the VHDL module, a graphical symbol was generated from the design.

The generated symbol is stored as:

[`SSD.bsf`](SSD.bsf)

This allowed the VHDL module to be placed as a reusable component in the Quartus Block Diagram/Schematic Editor.

---

## Step 4 – Create the Top-Level Block Diagram

The top-level graphical design is stored in:

[`Project3.bdf`](Project3.bdf)

The `SSD` symbol was placed in the design and connected to:

```text
D[3..0]  → SSD data input
EN       → SSD enable input
S[6..0]  → SSD segment output
```

This stage integrated the VHDL module into the top-level FPGA design.

---

# Functional Simulation

## Step 5 – Create the Waveform File

The simulation test configuration is stored in:

[`Waveform.vwf`](Waveform.vwf)

The waveform was configured around the principal design signals:

```text
D[3..0]
EN
S[6..0]
```

---

## Step 6 – Apply Test Inputs

Different values were applied to the `D[3..0]` input during the simulation.

The enable signal was also controlled so the design could be evaluated under enabled and disabled conditions.

This allowed the expected display behavior to be checked before hardware implementation.

---

## Step 7 – Analyze the Output

The resulting `S[6..0]` waveform was examined and compared with the applied input conditions.

This simulation stage was important because it allowed the digital logic to be tested before programming the physical FPGA.

The verification process followed:

```text
Input Test Vector
       |
       v
    D[3..0]
       +
      EN
       |
       v
   SSD VHDL Logic
       |
       v
    S[6..0]
       |
       v
Waveform Verification
```

---

# FPGA Pin Assignments

## Step 8 – Open Pin Planner

After simulation, Quartus Pin Planner was used to connect logical design signals to physical FPGA pins.

The project pin assignments are stored as part of:

[`Project3.qsf`](Project3.qsf)

The physical assignments allow the FPGA design to communicate with DE10-Lite board components.

---

## Step 9 – Map Inputs and Outputs

The digital inputs and display outputs were mapped to appropriate DE10-Lite FPGA pins.

This connected the logical design to physical hardware resources such as:

- On-board switches
- 7-segment display segments

Pin assignment is the bridge between the HDL design and the physical development board.

---

# Compilation

## Step 10 – Compile the Design

After completing the VHDL design, top-level schematic, and pin assignments, the Quartus project was compiled.

Compilation checks and processes the design for implementation on the selected FPGA.

The process verifies areas including:

- HDL syntax
- Signal connectivity
- FPGA device compatibility
- Pin assignments
- Logic implementation

Compilation errors or configuration problems must be corrected before hardware programming.

---

# FPGA Programming

## Step 11 – Connect the DE10-Lite

The DE10-Lite development board was connected to the computer through the USB-Blaster interface.

Quartus Programmer was configured to communicate with the board.

### Programming Configuration

```text
Hardware: USB-Blaster
Mode:     JTAG
Device:   Intel MAX 10 FPGA
```

---

## Step 12 – Program the FPGA

The compiled design was transferred to the FPGA using Quartus Programmer.

A successful programming operation confirmed communication between the computer, USB-Blaster interface, and FPGA.

---

# Hardware Verification

After programming, the design was tested on the physical DE10-Lite board.

The board inputs were changed and the corresponding 7-segment display behavior was observed.

This provided final hardware-level verification of the FPGA design.

---

# Complete Quartus Workflow

```text
Project Creation
       |
       v
VHDL Development
   SSD.vhd
       |
       v
Symbol Generation
   SSD.bsf
       |
       v
Top-Level Design
 Project3.bdf
       |
       v
Simulation Setup
 Waveform.vwf
       |
       v
Functional Verification
       |
       v
Pin Assignment
 Project3.qsf
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
Intel MAX 10 FPGA
       |
       v
DE10-Lite Hardware Test
```

---

# Skills Demonstrated

## HDL and FPGA Development

- VHDL
- FPGA Design
- Digital Logic Design
- 7-Segment Display Control
- Combinational Logic
- Digital I/O

## Quartus Prime Lite

- Project Configuration
- Block Diagram/Schematic Editor
- VHDL Integration
- Symbol Generation
- Waveform Simulation
- Functional Verification
- Pin Planner
- Pin Assignment
- Compilation
- Quartus Programmer

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- USB-Blaster
- JTAG
- Hardware Programming
- FPGA I/O Mapping
- Hardware Testing

## Engineering

- Design Verification
- Troubleshooting
- Testing and Validation
- Hardware/Software Integration
- Digital-System Development
- Technical Documentation

---

# Purpose of This Folder

This folder preserves the primary source and configuration files used to develop Project 001.

Together, these files document the progression from VHDL source code to a simulated, compiled, and physically implemented FPGA design.

For screenshots of the development and verification process, see:

[**Project Screenshots**](../Screenshots/)

For the physical DE10-Lite demonstration, see:

[**Hardware Demonstration**](../Hardware/)

For the complete project overview, return to:

[**Project 001 README**](../README.md)
