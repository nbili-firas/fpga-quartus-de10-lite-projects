# Project 001 – FPGA 7-Segment Display Driver Using VHDL

## Project Overview

This project demonstrates the design, simulation, and hardware implementation of a **7-segment display driver** using **VHDL**, **Intel Quartus Prime Lite**, and the **Terasic DE10-Lite FPGA Development Board**.

The project converts a 4-bit digital input into a 7-bit output used to control a 7-segment display. An enable input is also incorporated into the design to control whether the display is active.

The project was developed through a complete FPGA design workflow that included:

- VHDL development
- Quartus project creation
- Block Diagram/Schematic design
- Symbol generation
- Functional simulation
- Waveform analysis
- FPGA pin assignments
- Compilation
- USB-Blaster/JTAG programming
- Physical testing on the DE10-Lite board

The completed project demonstrates the process of moving from a digital-logic specification to a simulated and physically implemented FPGA design.

---

## Hardware and Software

### Software

- Intel Quartus Prime Lite
- VHDL
- Quartus Simulation Waveform Editor

### Hardware

- Terasic DE10-Lite FPGA Development Board
- Intel MAX 10 FPGA
- On-board switches
- On-board 7-segment display
- USB-Blaster programming interface

---

# System Inputs and Outputs

The 7-segment display driver uses the following signals:

| Signal | Type | Width | Purpose |
|---|---|---:|---|
| `D[3..0]` | Input | 4 bits | Digital value supplied to the display driver |
| `EN` | Input | 1 bit | Enables or disables the display |
| `S[6..0]` | Output | 7 bits | Controls the seven display segments |

The basic signal flow is:

```text
D[3..0] ─────┐
              │
              ▼
          ┌─────────┐
EN ──────►│   SSD   │──────► S[6..0]
          └─────────┘
              │
              ▼
       7-Segment Display
```

---

# VHDL Design

The display-driver logic was implemented in the:

`SSD.vhd`

source file.

The VHDL entity contains:

```vhdl
D  : IN std_logic_vector(3 downto 0);
EN : IN std_logic;
S  : OUT std_logic_vector(6 downto 0);
```

The four-bit `D` input represents the value processed by the display driver.

The `EN` signal controls whether the output is enabled.

The `S[6..0]` output provides the seven control signals required by the 7-segment display.

---

# Development Process

## Step 1 – Review the Design Requirements

The first step was to identify the required FPGA inputs and outputs.

The design required:

- A 4-bit data input
- An enable input
- Seven output signals
- VHDL-based display logic
- Functional simulation
- FPGA implementation

This established the interface for the VHDL module.

---

## Step 2 – Develop the VHDL Module

The 7-segment display logic was implemented using VHDL.

The source file:

`SSD.vhd`

defines the relationship between the input value and the corresponding seven display-segment outputs.

The enable input was incorporated so the display output could also be controlled independently of the data input.

---

## Step 3 – Generate the Quartus Symbol

After developing the VHDL module, a Quartus symbol was created from the VHDL design.

The resulting symbol file is:

`SSD.bsf`

This allowed the VHDL module to be used as a graphical component inside the Quartus Block Diagram/Schematic Editor.

---

## Step 4 – Build the Top-Level Schematic

The top-level FPGA design was constructed in:

`Project3.bdf`

The `SSD` module was placed in the schematic and connected to:

- `D[3..0]`
- `EN`
- `S[6..0]`

This provided a graphical representation of the FPGA system.

![Quartus Top-Level Design](Screenshots/Picture1.png)

---

# Functional Simulation

## Step 5 – Create the Simulation Waveform

A waveform file was created to test the digital design:

`Waveform.vwf`

The waveform contains the principal signals:

- `D[3..0]`
- `EN`
- `S[6..0]`

Different input combinations were applied to the design to verify the resulting 7-segment output.

---

## Step 6 – Configure Input Test Values

The simulation was configured so that the 4-bit input could move through different values over time.

This allowed multiple display-driver conditions to be evaluated during a single simulation.

The enable signal was also changed to verify the behavior of the display when enabled and disabled.

---

## Step 7 – Run the Simulation

The Quartus simulation was executed and the resulting `S[6..0]` waveform was observed.

The simulation provided a method for validating the VHDL logic before programming the physical FPGA.

The waveform results demonstrated the relationship between:

```text
D[3..0]
   +
  EN
   |
   v
SSD Logic
   |
   v
S[6..0]
```

---

# FPGA Device Configuration

The project targets the Intel MAX 10 FPGA used on the DE10-Lite development board.

The Quartus project configuration identifies the FPGA device as:

`10M50DAF484C6GES`

The project settings and device configuration are stored primarily in:

`Project3.qsf`

and:

`Project3.qpf`

---

# Pin Assignments

## Step 8 – Configure FPGA I/O Pins

After verifying the digital logic through simulation, the design inputs and outputs were assigned to physical FPGA pins.

Quartus Pin Planner was used to associate the logical signals with DE10-Lite hardware resources.

These assignments connect the FPGA design to physical components such as:

- Board switches
- 7-segment display segments

The pin-assignment stage connects the software-defined FPGA logic with the actual DE10-Lite hardware.

---

# Compilation

## Step 9 – Compile the FPGA Design

After completing the design and pin assignments, the Quartus project was compiled.

Compilation verifies the design and performs the required FPGA implementation stages.

The compilation process checks areas such as:

- VHDL syntax
- Design connectivity
- Device compatibility
- Pin assignments
- Logic implementation

Any errors encountered during this stage must be corrected before programming the FPGA.

---

# DE10-Lite Programming

## Step 10 – Connect the FPGA Board

The DE10-Lite board was connected to the computer through its USB-Blaster programming interface.

Quartus Programmer was then used to communicate with the FPGA.

The programming configuration used:

- **Hardware:** USB-Blaster
- **Mode:** JTAG

---

## Step 11 – Program the FPGA

The compiled FPGA configuration was loaded onto the DE10-Lite board through Quartus Programmer.

The successful programming result confirmed communication between Quartus and the MAX 10 FPGA.

---

# Hardware Testing

## Step 12 – Test the Physical Design

After programming the FPGA, the design was tested directly on the DE10-Lite board.

Physical board inputs were used to change the digital input value, while the corresponding 7-segment display output was observed.

This hardware test provided final verification that the VHDL design operated correctly after being transferred from simulation to the FPGA.

The project therefore progressed through:

```text
Design Requirement
        |
        v
VHDL Development
        |
        v
Symbol Generation
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
USB-Blaster / JTAG Programming
        |
        v
DE10-Lite Hardware Testing
```

---

# Project Results

The project successfully demonstrated the FPGA development process for a VHDL-based 7-segment display driver.

The completed design included:

- 4-bit digital input processing
- Enable control
- 7-bit segment output
- VHDL implementation
- Quartus symbol generation
- Top-level schematic integration
- Waveform simulation
- Pin assignment
- FPGA compilation
- USB-Blaster/JTAG programming
- DE10-Lite hardware implementation
- Physical testing

The simulation and hardware implementation provided two levels of verification: software-based functional testing and physical FPGA testing.

---

# Project Files

## Quartus Source Files

The Quartus project files are located in the [`Quartus`](Quartus/) folder.

Important source files include:

| File | Purpose |
|---|---|
| `Project3.qpf` | Quartus project file |
| `Project3.qsf` | Project settings, FPGA configuration, and pin assignments |
| `Project3.bdf` | Top-level Block Diagram/Schematic |
| `SSD.vhd` | VHDL 7-segment display-driver source |
| `SSD.bsf` | Quartus symbol for the SSD module |
| `Waveform.vwf` | Functional simulation waveform |
| `DE10_LITE_Golden_Top.v` | DE10-Lite-related Verilog source/reference file |

---

## Screenshots

Design, simulation, Pin Planner, and programming screenshots are located in:

[`Screenshots`](Screenshots/)

---

## Hardware Demonstration

The DE10-Lite hardware demonstration is located in:

[`Hardware`](Hardware/)

The hardware video demonstrates the design operating on the physical FPGA development board.

---

## Documentation

Supporting laboratory documentation is located in:

[`Documentation`](Documentation/)

---

# Skills Demonstrated

## FPGA and Digital Design

- FPGA Development
- Digital Logic Design
- VHDL
- 7-Segment Display Control
- Combinational Logic
- Digital Input/Output
- FPGA Pin Mapping

## Intel Quartus Prime Lite

- Quartus Project Development
- Block Diagram/Schematic Editor
- Symbol Generation
- Waveform Editor
- Functional Simulation
- Pin Planner
- FPGA Device Configuration
- Compilation
- Quartus Programmer
- USB-Blaster
- JTAG Programming

## Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA I/O
- Board Switches
- 7-Segment Displays
- Hardware Programming
- Hardware Testing

## Engineering

- Digital System Design
- Design Verification
- Simulation
- Troubleshooting
- Testing and Validation
- Hardware/Software Integration
- Technical Documentation
- Systematic Problem Solving

---

# What I Learned

This project strengthened my understanding of the complete FPGA development process.

I gained practical experience developing VHDL logic, integrating an HDL module into a Quartus schematic, creating simulation waveforms, analyzing digital outputs, assigning FPGA pins, compiling a design, and programming a physical FPGA through USB-Blaster and JTAG.

The project also demonstrated the importance of verifying a digital design through simulation before implementing it on hardware.

Working with the DE10-Lite board provided practical experience connecting software-defined digital logic with physical FPGA inputs and outputs.

---

# Conclusion

Project 001 demonstrates the development of a VHDL-based 7-segment display driver from initial design through physical FPGA implementation.

Using Quartus Prime Lite, the design was created, simulated, verified, assigned to physical FPGA pins, compiled, and programmed onto the DE10-Lite development board.

The project provides practical evidence of experience with **VHDL, FPGA development, digital logic, functional simulation, pin assignment, JTAG programming, and hardware testing**.
