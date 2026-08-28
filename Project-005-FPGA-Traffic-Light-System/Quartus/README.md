# Project 005 – Quartus Source Files

## Overview

This folder contains the complete Intel Quartus Prime Lite source for **Project 005 – FPGA Traffic Light Control System**.

The project integrates a traffic-light finite state machine with two digital timing circuits to control traffic flow between a main street and a side street.

The final top-level entity is:

```text
TLSystem
```

---

# FPGA Configuration

```text
FPGA Family: MAX 10
Device: 10M50DAF484C6GES
Top-Level Entity: TLSystem
System Clock: 50 MHz
```

---

# Required Source Files

The complete repository intentionally preserves the reusable source files used by the traffic-light system.

These include:

```text
TrafficLights.vhd
Counter25B.vhd
count5B.vhd
oneshot22.bdf
oneshot8.bdf
```

These files should remain in the repository because they are dependencies of the final hierarchical FPGA design.

---

# File Structure

```text
Quartus/
│
├── TLSystem.qpf
├── TLSystem.qsf
├── TLSystem.bdf
├── TLSystem.bsf
├── TrafficLights.vhd
├── Counter25B.vhd
├── count5B.vhd
├── oneshot22.bdf
├── oneshot8.bdf
├── Waveform.vwf
└── DE10_LITE_Golden_Top.v
```

---

# File Descriptions

| File | Description |
|---|---|
| `TLSystem.qpf` | Main Quartus project |
| `TLSystem.qsf` | FPGA settings and pin assignments |
| `TLSystem.bdf` | Final top-level traffic-light schematic |
| `TLSystem.bsf` | Generated traffic-light system block symbol |
| `TrafficLights.vhd` | Traffic-light finite state machine |
| `Counter25B.vhd` | 25-bit clock divider |
| `count5B.vhd` | 5-bit counter used by timing logic |
| `oneshot22.bdf` | 22-clock-cycle one-shot timer |
| `oneshot8.bdf` | 8-clock-cycle one-shot timer |
| `Waveform.vwf` | Quartus waveform file |
| `DE10_LITE_Golden_Top.v` | DE10-Lite board reference Verilog |

---

# TrafficLights.vhd

The file:

```text
TrafficLights.vhd
```

contains the state-machine logic responsible for controlling:

```text
MR
MY
MG

SR
SY
SG
```

where:

```text
MR = Main Red
MY = Main Yellow
MG = Main Green

SR = Side Red
SY = Side Yellow
SG = Side Green
```

The state machine also responds to the vehicle sensor and timing signals.

---

# Counter25B.vhd

The file:

```text
Counter25B.vhd
```

implements a 25-bit counter used as a clock divider.

The DE10-Lite system clock is:

```text
50 MHz
```

The divider produces a slow timing signal of approximately:

```text
1.49 Hz
```

This corresponds to approximately:

```text
0.67 seconds per timing pulse
```

---

# count5B.vhd

The file:

```text
count5B.vhd
```

implements the 5-bit counter required by the longer one-shot timing subsystem.

The counter is used as part of the reusable timing logic incorporated into the final traffic-light system.

---

# oneshot8.bdf

The source schematic:

```text
oneshot8.bdf
```

implements an 8-clock-cycle one-shot timer.

With a 1.49 Hz timing clock:

```text
8 × 0.67114 ≈ 5.37 seconds
```

This provides the timing interval used for the traffic-light yellow phase.

---

# oneshot22.bdf

The source schematic:

```text
oneshot22.bdf
```

implements a 22-clock-cycle one-shot timer.

With the 1.49 Hz clock:

```text
22 × 0.67114 ≈ 14.77 seconds
```

This provides the longer timing interval required by the traffic-light controller.

---

# TLSystem.bdf

The final hierarchical design is:

```text
TLSystem.bdf
```

It combines the reusable components into a complete traffic-light control system.

Conceptually:

```text
                 50 MHz
                   |
                   v
             Counter25B
                   |
                   v
                1.49 Hz
                   |
        +----------+----------+
        |                     |
        v                     v
    oneshot8              oneshot22
    ~5.37 sec             ~14.77 sec
        |                     |
        +----------+----------+
                   |
                   v
             TrafficLights
                   |
       +-----------+-----------+
       |                       |
       v                       v
 Main Street Lights       Side Street Lights
   MR MY MG                  SR SY SG
```

---

# Inputs

The final design uses:

```text
sysclock
reset
VS
```

where:

```text
sysclock = 50 MHz FPGA clock
reset    = system initialization
VS       = side-street vehicle sensor
```

---

# Outputs

The final design produces:

```text
MR
MY
MG
SR
SY
SG
```

representing the six traffic-light LEDs.

---

# FPGA Pin Assignments

The final Quartus project maps the signals to:

| Signal | Pin |
|---|---|
| `MG` | `PIN_A10` |
| `MR` | `PIN_A8` |
| `MY` | `PIN_A9` |
| `reset` | `PIN_A7` |
| `SR` | `PIN_B10` |
| `SG` | `PIN_C13` |
| `SY` | `PIN_D13` |
| `sysclock` | `PIN_P11` |
| `VS` | `PIN_B8` |

The required I/O standard is:

```text
3.3-V LVTTL
```

---

# Top-Level Entity

The final hardware configuration uses:

```text
TLSystem
```

as the Quartus top-level entity.

---

# Build Workflow

```text
Open TLSystem.qpf
       |
       v
Verify VHDL Dependencies
       |
       +--> TrafficLights.vhd
       +--> Counter25B.vhd
       +--> count5B.vhd
       |
       v
Verify BDF Dependencies
       |
       +--> oneshot8.bdf
       +--> oneshot22.bdf
       |
       v
Open TLSystem.bdf
       |
       v
Set TLSystem as Top-Level Entity
       |
       v
Verify Device
10M50DAF484C6GES
       |
       v
Verify Pin Assignments
       |
       v
Compile Project
       |
       v
Quartus Programmer
       |
       v
USB-Blaster / JTAG
       |
       v
Program DE10-Lite
```

---

# Why the Dependency Files Are Included

This project uses hierarchical FPGA design.

The final `TLSystem.bdf` depends on reusable components developed separately.

For that reason, this repository preserves the actual source files:

```text
TrafficLights.vhd
Counter25B.vhd
count5B.vhd
oneshot22.bdf
oneshot8.bdf
```

rather than preserving only generated symbols.

This makes the repository cleaner, more complete, and easier to understand as an engineering portfolio project.

---

# Related Project Sections

Main project documentation:

```text
../README.md
```

Development screenshots:

```text
../Screenshots/
```

Physical hardware demonstration:

```text
../Hardware/
```

---

# Purpose

This folder preserves the FPGA source code and schematic files necessary to document and reproduce the Project 005 traffic-light controller.

Together, the files demonstrate:

- VHDL
- Finite state machines
- Clock division
- Digital counters
- One-shot timing
- Hierarchical FPGA design
- Quartus schematic integration
- FPGA pin mapping
- DE10-Lite implementation
