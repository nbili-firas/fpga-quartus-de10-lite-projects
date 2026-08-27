# Project 002 – Quartus Source Files

## Overview  

This folder contains the Intel Quartus Prime Lite source files used to design, simulate, configure, and implement the **Project 002 – FPGA 4-Bit Up Counter**.

These files represent the core FPGA development artifacts for the project.

---

# Source Files

| File | Purpose |
|---|---|
| [`FourBitUPCounter.qpf`](FourBitUPCounter.qpf) | Quartus project file |
| [`FourBitUPCounter.qsf`](FourBitUPCounter.qsf) | Quartus settings, device configuration, and pin assignments |
| [`FourBitUPCounter.bdf`](FourBitUPCounter.bdf) | Main 4-bit up-counter schematic |
| [`FourBitUPCounter.bsf`](FourBitUPCounter.bsf) | Quartus Block Symbol File |
| [`Waveform.vwf`](Waveform.vwf) | Functional simulation waveform |
| [`DE10_LITE_Golden_Top.v`](DE10_LITE_Golden_Top.v) | DE10-Lite reference/top-level Verilog source |

---

# Main Design

The primary design file is:

[`FourBitUPCounter.bdf`](FourBitUPCounter.bdf)

The schematic implements a 4-bit sequential counter using four flip-flop stages.

The design includes:

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

The four outputs form the counter value:

```text
QD QC QB QA
```

---

# Quartus Project Configuration

The Quartus project uses:

```text
Project Name: FourBitUPCounter
Top-Level Entity: FourBitUPCounter
FPGA Family: MAX 10
Target Device: 10M50DAF484C6GES
```

The project configuration is stored primarily in:

[`FourBitUPCounter.qpf`](FourBitUPCounter.qpf)

and:

[`FourBitUPCounter.qsf`](FourBitUPCounter.qsf)

---

# Schematic Development

The counter was constructed using the Quartus Block Diagram/Schematic Editor.

The schematic contains:

- Four sequential flip-flop stages
- Clock input
- Clear/reset input
- Feedback connections
- Inversion logic
- Four binary outputs

The counter produces the expected binary sequence as clock transitions occur.

---

# Functional Simulation

The simulation configuration is stored in:

[`Waveform.vwf`](Waveform.vwf)

The waveform contains:

```text
CLK
CLRN
QA
QB
QC
QD
```

A periodic waveform is applied to `CLK` to advance the counter.

The output signals demonstrate the expected frequency relationship:

```text
QA = fastest
QB = QA / 2
QC = QB / 2
QD = QC / 2
```

Together, these outputs represent the 4-bit binary count.

---

# FPGA Configuration

The project targets the Intel MAX 10 FPGA:

```text
10M50DAF484C6GES
```

Quartus Pin Planner was used to assign the logical design signals to physical FPGA pins.

The project assignments include:

| Signal | FPGA Pin |
|---|---|
| `CLK` | `PIN_B8` |
| `CLRN` | `PIN_C11` |
| `QA` | `PIN_A8` |
| `QB` | `PIN_A9` |
| `QC` | `PIN_A10` |
| `QD` | `PIN_B10` |

The assignments are stored in:

[`FourBitUPCounter.qsf`](FourBitUPCounter.qsf)

---

# Compilation

The Quartus project was successfully compiled for the MAX 10 FPGA.

The Flow Summary showed:

```text
Flow Status: Successful
Total Logic Elements: 8
Total Registers: 4
Total Pins: 6
```

The compilation completed with:

```text
0 errors
```

---

# FPGA Programming

The compiled design was transferred to the DE10-Lite using Quartus Programmer.

Programming configuration:

```text
Hardware: USB-Blaster
Mode: JTAG
FPGA: Intel MAX 10
Board: Terasic DE10-Lite
```

---

# Development Workflow

```text
Create Quartus Project
        |
        v
Build Counter Schematic
        |
        v
Compile Design
        |
        v
Create Simulation Waveform
        |
        v
Apply CLK and CLRN
        |
        v
Run Functional Simulation
        |
        v
Verify Binary Counter Outputs
        |
        v
Assign FPGA Pins
        |
        v
Compile Final Design
        |
        v
Program DE10-Lite
        |
        v
Hardware Verification
```

---

# Related Project Sections

Return to the complete project overview:

[Project 002 Main README](../README.md)

View development screenshots:

[Project Screenshots](../Screenshots/)

View the physical FPGA implementation:

[Hardware Demonstration](../Hardware/)

---

# Purpose of This Folder

The purpose of this folder is to preserve the Quartus source files required to understand and reproduce the FPGA counter design.

Together, these files document the transition from a sequential digital logic concept to a simulated, compiled, and physically implemented FPGA design.
