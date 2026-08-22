# Project 001 – FPGA 7-Segment Display Driver Screenshots

## Overview

This folder contains screenshots documenting the design, simulation, pin assignment, compilation, and FPGA programming stages of Project 001.

The screenshots provide visual evidence of the complete Quartus Prime Lite workflow used to implement the VHDL 7-segment display driver on the DE10-Lite FPGA Development Board.

---

# Screenshot 1 – Top-Level Quartus Schematic

## File

`Picture1.png`

![Top-Level Quartus Schematic](Picture1.png)

## Description

This screenshot shows the top-level Block Diagram/Schematic developed in Quartus Prime Lite.

The design includes:

- `D[3..0]` 4-bit input
- `EN` enable input
- `SSD` display-driver symbol
- `S[6..0]` 7-bit output

The `SSD` block represents the VHDL display-driver module generated as a Quartus symbol.

### Design Flow

```text
D[3..0] ─────┐
              │
              ▼
          ┌─────────┐
EN ──────►│   SSD   │──────► S[6..0]
          └─────────┘
---

Screenshot 2 – Waveform Test Setup
File

Picture2.png

Description

This screenshot documents the Quartus waveform configuration used to test the 7-segment display driver.

The simulation includes:

D[3..0]
EN
S[6..0]

Different input values were applied across the simulation timeline so the corresponding output patterns could be evaluated.

This stage was used to prepare the design for functional verification before hardware implementation.

Screenshot 3 – Functional Simulation Results
File

Picture3.png

Description

This screenshot shows the waveform simulation results for the FPGA display-driver design.

The output S[6..0] changes in response to the applied D[3..0] and EN input conditions.

The simulation was used to verify that the VHDL logic produced the expected segment-control patterns before programming the physical FPGA.

Verification Process
Apply a digital input value.
Set the enable condition.
Run the simulation.
Observe S[6..0].
Compare the output with the expected 7-segment pattern.
Screenshot 4 – Pin Planner
File

Picture4.png

Description

This screenshot shows the Quartus Prime Lite Pin Planner used to connect the logical FPGA signals to physical pins on the DE10-Lite board.

The pin-assignment stage maps the design to real hardware resources such as:

On-board switches
Enable input
7-segment display segment connections

Pin mapping is a critical step because it connects the logical HDL design with the physical FPGA package and development board.

Screenshot 5 – Quartus Compilation / Device Configuration
File

Picture5.png

Description

This screenshot documents the Quartus project during the implementation and compilation stage.

The project targets the Intel MAX 10 FPGA on the DE10-Lite board.

The compilation stage processes the digital design and verifies:

VHDL syntax
Top-level connectivity
Device configuration
Pin assignments
FPGA implementation requirements

Successful completion of this stage prepares the design for programming onto the physical FPGA.

Screenshot 6 – Quartus Programmer
File

Picture6.png

Description

This screenshot shows Quartus Programmer being used to transfer the compiled design to the DE10-Lite board.

The programming configuration includes:

USB-Blaster hardware interface
JTAG programming mode
Intel MAX 10 FPGA target

This stage represents the transition from software-based design and simulation to physical FPGA implementation.

FPGA Development Workflow

The screenshots collectively document the following development process:

VHDL Development
       |
       v
Quartus Symbol Generation
       |
       v
Top-Level Schematic
       |
       v
Waveform Test Setup
       |
       v
Functional Simulation
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
DE10-Lite FPGA Hardware
Screenshot Summary
Screenshot	Demonstration
Picture1.png	Top-level Quartus schematic
Picture2.png	Waveform test setup
Picture3.png	Functional simulation results
Picture4.png	FPGA pin assignments
Picture5.png	Compilation / device configuration stage
Picture6.png	USB-Blaster / JTAG FPGA programming
Skills Demonstrated

The screenshots provide visual evidence of experience with:

Quartus Prime Lite
VHDL integration
FPGA schematic design
Block Diagram/Schematic Editor
Simulation waveform development
Functional verification
Pin Planner
FPGA pin assignments
Compilation
Quartus Programmer
USB-Blaster
JTAG
DE10-Lite
Intel MAX 10 FPGA
Digital-system verification
Hardware/software integration
Related Project Files

Return to the main project page:

Project 001 Main README

View the Quartus source files:

Quartus Source Files

View the hardware demonstration:

DE10-Lite Hardware Demonstration

View supporting project documentation:

Project Documentation

Purpose of This Folder

This folder provides visual documentation of the FPGA development process used in Project 001.

Together with the Quartus source files and DE10-Lite hardware demonstration, the screenshots show the progression from VHDL design to simulation, device configuration, FPGA programming, and physical implementation. 
