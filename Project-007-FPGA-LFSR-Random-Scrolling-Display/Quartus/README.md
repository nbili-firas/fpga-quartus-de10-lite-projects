# Project 007 – Quartus Source Files

## Overview

This folder contains the Intel Quartus Prime Lite source files for **Project 007 – FPGA LFSR Random Scrolling Display**.

The project combines a Linear Feedback Shift Register, hexadecimal 7-segment display driver, Johnson counter, display-sequencing logic, and final hierarchical FPGA design.

The source files document the complete progression from individual digital subsystems to the final DE10-Lite implementation.

---

# Target Hardware

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
```

---

# Recommended Quartus Files

```text
Quartus/
│
├── LFSR.qpf
├── LFSR.qsf
├── LFSR.bdf
├── LFSR.bsf
├── Display.vhd
├── Display.bsf
├── LFSRDisplay.bdf
├── LFSRDisplay.bsf
├── Johnson.bdf
├── Johnson.bsf
├── TB.bdf
├── Waveform.vwf
├── Waveform1.vwf
├── Waveform2.vwf
└── DE10_LITE_Golden_Top.v
```

---

# File Descriptions

| File | Purpose |
|---|---|
| `LFSR.qpf` | Main Quartus project file |
| `LFSR.qsf` | FPGA configuration and pin assignments |
| `LFSR.bdf` | Linear Feedback Shift Register schematic |
| `LFSR.bsf` | Reusable LFSR block symbol |
| `Display.vhd` | VHDL hexadecimal 7-segment driver |
| `Display.bsf` | Reusable display-driver symbol |
| `LFSRDisplay.bdf` | Combined random-number/display subsystem |
| `LFSRDisplay.bsf` | Reusable combined subsystem |
| `Johnson.bdf` | Johnson counter schematic |
| `Johnson.bsf` | Johnson counter block symbol |
| `TB.bdf` | Final integrated system |
| `Waveform.vwf` | Functional simulation |
| `Waveform1.vwf` | Functional simulation |
| `Waveform2.vwf` | Functional simulation |
| `DE10_LITE_Golden_Top.v` | DE10-Lite reference source |

---

# LFSR.bdf

The random-number generation subsystem is implemented in:

```text
LFSR.bdf
```

The design uses a Linear Feedback Shift Register.

The LFSR consists of:

- Flip-flop stages
- Shift-register connections
- XOR feedback
- Clock input
- Enable input

The outputs form a 4-bit pseudo-random value.

---

# LFSR Inputs

```text
CLK
EN
```

`CLK` advances the shift register.

`EN` controls whether the LFSR is allowed to advance.

During functional simulation:

```text
EN = HIGH
```

---

# LFSR Outputs

The four LFSR output bits form:

```text
D[3..0]
```

or an equivalent grouped unsigned value.

Grouping the outputs allows the sequence to be viewed as hexadecimal or unsigned decimal values.

---

# LFSR Sequence

The LFSR generates a sequence different from a binary up counter.

Example:

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
14
12
8
9
3
6
5
...
```

The exact sequence is determined by:

- Initial state
- Register topology
- Feedback taps

---

# Display.vhd

The hexadecimal 7-segment decoder is implemented in:

```text
Display.vhd
```

The interface is:

```vhdl
D  : IN std_logic_vector(3 downto 0);
EN : IN std_logic;
S  : OUT std_logic_vector(6 downto 0);
```

---

# Display Mapping

The module supports the complete hexadecimal range:

```text
0000 → 0
0001 → 1
0010 → 2
0011 → 3
0100 → 4
0101 → 5
0110 → 6
0111 → 7
1000 → 8
1001 → 9
1010 → A
1011 → b
1100 → C
1101 → d
1110 → E
1111 → F
```

When:

```text
EN = 0
```

the display is blanked.

---

# Display.bsf

After compiling the VHDL module, a reusable symbol was generated:

```text
Display.bsf
```

This allows the HDL module to be integrated graphically into other Quartus BDF designs.

---

# LFSRDisplay.bdf

The combined module is:

```text
LFSRDisplay.bdf
```

This schematic integrates:

```text
LFSR
+
Display
```

The internal signal flow is:

```text
CLK / Enable
      |
      v
     LFSR
      |
      v
   D[3..0]
      |
      v
   Display
      |
      v
   S[6..0]
```

Each pseudo-random 4-bit LFSR value is therefore converted directly into a hexadecimal display pattern.

---

# LFSRDisplay.bsf

The combined subsystem was converted into:

```text
LFSRDisplay.bsf
```

This creates a reusable higher-level component for the final FPGA design.

---

# Johnson.bdf

The sequential display-enable subsystem is implemented in:

```text
Johnson.bdf
```

The Johnson counter uses a feedback shift-register architecture.

The inverted final-stage output is returned to the first stage, producing a controlled sequence of states.

---

# Johnson Counter Purpose

The Johnson counter sequentially controls which display position is active.

This allows the hexadecimal data to appear to move across the display system.

The operating concept is:

```text
Clock
  |
  v
Johnson Counter
  |
  +--> Display Position 1
  |
  +--> Display Position 2
  |
  +--> Display Position 3
  |
  +--> Display Position 4
```

---

# Johnson Simulation

The Johnson design is verified using:

```text
CLK
EN
Q0
Q1
Q2
Q3
```

The waveform confirms the sequential counter states before the subsystem is incorporated into the final design.

---

# TB.bdf

The final FPGA system is implemented in:

```text
TB.bdf
```

This design combines:

- LFSRDisplay
- Johnson counter
- Display sequencing
- Automatic FPGA clock
- Final output logic

---

# Automatic Clock

The final system uses the onboard FPGA clock rather than manual clocking.

A clock divider is used so that display transitions occur slowly enough to be observed.

A previously developed `Counter25B` design may be reused for this purpose.

---

# Waveform Files

Three waveform files are preserved:

```text
Waveform.vwf
Waveform1.vwf
Waveform2.vwf
```

These files document functional verification of the different subsystems developed during the project.

They include verification of:

- LFSR sequence
- Display decoding
- Johnson counter behavior

---

# FPGA Implementation Workflow

```text
Create LFSR.bdf
      |
      v
Compile LFSR
      |
      v
Simulate Random Sequence
      |
      v
Create LFSR.bsf
      |
      v
Create Display.vhd
      |
      v
Compile Display
      |
      v
Verify 0-F Output
      |
      v
Create Display.bsf
      |
      v
Create LFSRDisplay.bdf
      |
      v
Compile Combined Module
      |
      v
Create LFSRDisplay.bsf
      |
      v
Create Johnson.bdf
      |
      v
Verify Johnson Counter
      |
      v
Create Johnson.bsf
      |
      v
Create TB.bdf
      |
      v
Integrate Clock Divider
      |
      v
Assign FPGA Pins
      |
      v
Compile
      |
      v
Program DE10-Lite
```

---

# Files Not Needed for Portfolio

The following Quartus-generated/workspace files are not necessary for the GitHub portfolio:

```text
LFSR.qws
LFSR_assignment_defaults.qdf
qar_info.json
```

They may be regenerated by Quartus and do not represent primary engineering source.

---

# Related Project Sections

Main project:

```text
../README.md
```

Screenshots:

```text
../Screenshots/
```

Hardware:

```text
../Hardware/
```

---

# Purpose

This folder preserves the source design files required to understand the complete Project 007 FPGA implementation.

The project demonstrates modular digital design through LFSR pseudo-random generation, VHDL hexadecimal decoding, Johnson counter sequencing, hierarchical BDF integration, waveform verification, and physical FPGA implementation.
