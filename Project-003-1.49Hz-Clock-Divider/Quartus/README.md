# Project 003 – Quartus Source Files

## Overview

This folder contains the Intel Quartus Prime Lite source files used to develop **Project 003 – FPGA 1.49 Hz Clock Divider**.

The design uses a generated 25-bit up counter to divide the DE10-Lite's 50 MHz system clock into progressively lower-frequency digital outputs.

The most significant counter bit, `q[24]`, produces approximately 1.49 Hz.

---

# Project Configuration

The Quartus project is configured as:

```text
Project Revision: Project6
Top-Level Entity: Project6
FPGA Family: MAX 10
Target Device: 10M50DAF484C6GES
```

The primary project configuration files are:

- [`Project6.qpf`](Project6.qpf)
- [`Project6.qsf`](Project6.qsf)

---

# Source Files

| File | Purpose |
|---|---|
| [`Project6.qpf`](Project6.qpf) | Main Quartus project file |
| [`Project6.qsf`](Project6.qsf) | FPGA device configuration and pin assignments |
| [`Project6.bdf`](Project6.bdf) | Top-level 25-bit clock-divider schematic |
| [`Project6.bsf`](Project6.bsf) | Generated symbol for the top-level Project6 design |
| [`Counter25B.bsf`](Counter25B.bsf) | Symbol generated for the 25-bit counter |
| [`Waveform.vwf`](Waveform.vwf) | Simulation waveform file |
| [`DE10_LITE_Golden_Top.v`](DE10_LITE_Golden_Top.v) | DE10-Lite reference/top-level Verilog source |

If available, the generated Quartus IP file should also be included:

`Counter25B.qip`

---

# 25-Bit Counter

The central component of the design is:

`Counter25B`

The counter was generated using the Quartus IP Catalog.

### IP Configuration

```text
IP Function: LPM_COUNTER
Counter Width: 25 bits
Count Direction: Up only
Input: clock
Output: q[24..0]
```

The counter can represent:

**2^25 = 33,554,432**

states.

---

# Frequency Division

The DE10-Lite system clock operates at:

**50 MHz**

The most significant counter bit divides this input by:

**2^25**

Therefore:

```text
50,000,000 / 33,554,432 ≈ 1.49 Hz
```

The output:

`q[24]`

therefore provides the target low-frequency signal.

---

# Output Frequency Progression

The selected counter bits produce progressively faster outputs:

```text
q[24] ≈ 1.49 Hz
q[23] ≈ 2.98 Hz
q[22] ≈ 5.96 Hz
q[21] ≈ 11.92 Hz
q[20] ≈ 23.84 Hz
```

This demonstrates the frequency-dividing behavior of a binary counter.

---

# Top-Level Schematic

The top-level design is stored in:

[`Project6.bdf`](Project6.bdf)

The schematic connects:

```text
CLK
 |
 v
+----------------+
|   Counter25B   |
|    up counter  |
+-------+--------+
        |
        v
     q[24..0]
```

The `q[24..0]` signal is implemented as a 25-bit Quartus bus.

---

# Top-Level Symbol

The generated top-level symbol is stored in:

[`Project6.bsf`](Project6.bsf)

It exposes:

```text
Input:
CLK

Output:
q[24..0]
```

---

# Simulation

The Quartus waveform configuration is stored in:

[`Waveform.vwf`](Waveform.vwf)

The waveform includes:

```text
CLK
q[24..0]
```

The output bus contains 25 individual counter outputs.

The waveform provides a simulation environment for evaluating the counter design.

---

# Pin Assignments

The physical FPGA assignments are stored in:

[`Project6.qsf`](Project6.qsf)

The relevant assignments include:

| Signal | FPGA Pin |
|---|---|
| `CLK` | `PIN_P11` |
| `q[24]` | `PIN_A8` |
| `q[23]` | `PIN_A9` |
| `q[22]` | `PIN_A10` |
| `q[21]` | `PIN_B10` |
| `q[20]` | `PIN_D13` |

The project configures:

```text
CLK → 3.3 V Schmitt Trigger
q outputs → 3.3-V LVTTL
```

---

# Development Process

```text
Create Quartus Project
        |
        v
Open IP Catalog
        |
        v
Select LPM_COUNTER
        |
        v
Configure 25-Bit Up Counter
        |
        v
Generate Counter25B
        |
        v
Generate Counter Symbol
        |
        v
Create Project6.bdf
        |
        v
Connect CLK
        |
        v
Create q[24..0] Bus
        |
        v
Compile
        |
        v
Configure Pin Assignments
        |
        v
Program DE10-Lite
        |
        v
Verify Output Frequencies
```

---

# Why a 25-Bit Counter Is Used

The project requires a slow clock that can be observed visually.

The original FPGA clock is:

**50,000,000 cycles per second**

A 25-bit binary counter creates a very large frequency division factor:

**33,554,432**

This reduces the signal to approximately:

**1.49 cycles per second**

which can be observed using an LED on the development board.

---

# Related Project Sections

Return to the main project:

[Project 003 Main README](../README.md)

View development screenshots:

[Project Screenshots](../Screenshots/)

View the physical FPGA demonstration:

[Hardware Demonstration](../Hardware/)

---

# Purpose of This Folder

This folder preserves the primary Quartus source and configuration files used to create the FPGA frequency-divider design.

Together, the files document the process of generating counter IP, integrating it into a top-level schematic, configuring the MAX 10 FPGA, and implementing a low-frequency clock divider on the DE10-Lite development board.
