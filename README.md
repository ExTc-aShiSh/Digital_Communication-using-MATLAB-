# Digital Communication Lab using MATLAB

<div align="center">

<img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" alt="MATLAB Logo" width="80"/>
&nbsp;&nbsp;&nbsp;
<img src="https://upload.wikimedia.org/wikipedia/commons/9/92/LaTeX_logo.svg" alt="LaTeX Logo" width="120"/>
&nbsp;&nbsp;&nbsp;
<img src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg" alt="VS Code Logo" width="60"/>

</div>

<br/>
<div align = "center">

[![MATLAB](https://img.shields.io/badge/Language-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html) [![LaTeX](https://img.shields.io/badge/Docs-LaTeX-008080.svg)](https://www.latex-project.org/)  [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)  [![Open Source Love](https://img.shields.io/badge/Open%20Source-%E2%99%A5-brightgreen.svg)](#open-source--contributions)  [![Curriculum](https://img.shields.io/badge/Focus-Academic%20Curriculum-lightgrey.svg)](#overview)

</div>

A curated collection of MATLAB implementations for fundamental Digital Communication experiments, created and maintained as part of an undergraduate engineering curriculum. Also includes the complete **LaTeX source** for the practical file.

> [!IMPORTANT]
> **📢 Archive Notice** — This repository is no longer actively maintained as of **November 22, 2026**. The associated course has been completed. The code and documentation will remain available as-is for reference. Feel free to fork and build upon it!

---

## Overview

- **Academic Focus**: Practical MATLAB simulations accompanying digital communication theory.
- **LaTeX Practical File**: Full LaTeX source for the lab practical file — edit, customize, and compile with any LaTeX editor.
- **Open Source**: Freely available for students, educators, and enthusiasts to learn, reference, and expand upon.
- **Visual & Analytical**: Includes signal waveforms, spectral estimations, error metrics, and modulation/demodulation models.

---

## Experiments Index

| Topic | MATLAB Script | Key Concepts Simulated |
|---|---|---|
| Line Coding & PSD | [`Line_codings.m`](MATLAB_Codes/Line_codings.m) | Unipolar NRZ, Bipolar AMI, Manchester; Welch PSD estimation |
| PCM & DPCM | [`PCM_DPCM.m`](MATLAB_Codes/PCM_DPCM.m) | Sampling, uniform quantization, PCM binary encoding, DPCM difference quantization |
| DM & Adaptive DM | [`Delta_Adaptive_delta.m`](MATLAB_Codes/Delta_Adaptive_delta.m) | Slope overload, hunting error, adaptive step sizing, MSE comparison |
| Digital Modulation Schemes | [`ASK_PSK_FSK.m`](MATLAB_Codes/ASK_PSK_FSK.m) | ASK (OOK), BPSK, FSK modulation, correlation-based detection, BER verification |
| Sampling Theorem Verification | [`Sampling_theorm_verification.m`](MATLAB_Codes/Sampling_theorm_verification.m) | Nyquist criterion, aliasing demonstration, signal reconstruction |
| QPSK & QAM | [`QPSK_QAM.m`](MATLAB_Codes/QPSK_QAM.m) | QPSK and QAM modulation/demodulation, constellation diagrams, BER analysis |
| Eye Diagram & ISI | [`Eye_Diagram_ISI.m`](MATLAB_Codes/Eye_Diagram_ISI.m) | Inter-symbol interference, eye pattern generation, channel distortion effects |
| Matched Filter & Correlator Receiver | [`Matched_filter_design.m`](MATLAB_Codes/Matched_filter_design.m) | Matched filter design, correlator receiver, SNR maximization |
| DSSS Spread Spectrum | [`DSSS_Spread_Spectrum.m`](MATLAB_Codes/DSSS_Spread_Spectrum.m) | Direct sequence spread spectrum, PN sequence, spreading/despreading, jamming resistance |

---

## Repository Structure

```plaintext
Digital_Communication-using-MATLAB-/
|
+-- MATLAB_Codes/
|   +-- Line_codings.m                # Baseband line coding techniques & PSD
|   +-- PCM_DPCM.m                    # Pulse code and differential PCM systems
|   +-- Delta_Adaptive_delta.m        # Delta and adaptive delta modulation
|   +-- ASK_PSK_FSK.m                 # Carrier modulation (ASK, PSK, FSK)
|   +-- Sampling_theorm_verification.m# Sampling theorem & aliasing
|   +-- QPSK_QAM.m                    # QPSK and QAM modulation schemes
|   +-- Eye_Diagram_ISI.m             # Eye diagram and ISI analysis
|   +-- Matched_filter_design.m       # Matched filter & correlator receiver
|   +-- DSSS_Spread_Spectrum.m        # DSSS spread spectrum technique
|
+-- Practical_File/
|   +-- Digital_Comm_file.zip         # LaTeX source for the complete practical file
|
+-- .gitignore                        # Ignored temporary MATLAB/editor files
+-- LICENSE                           # MIT Open Source License
+-- README.md                         # Project documentation
```

---

## Practical File (LaTeX)

The [`Practical_File/`](Practical_File/) folder contains **`Digital_Comm_file.zip`** — the complete LaTeX source code for the Digital Communication practical/lab file.

### What's Inside the Zip

- **`Digital_Comm.tex`** — Main document (root file)
- **`cover.tex`** — Cover page
- **`index.tex`** — Table of contents / index
- **`exp01.tex` – `exp09.tex`** — Individual experiment write-ups
- **`MATLAB.tex`** — MATLAB code appendix
- **`exp_photos/` & `exp9_photos/`** — Output plots and result images
- **`Digital_Comm.pdf`** — Pre-compiled PDF of the practical file

### How to Edit

You can edit the LaTeX source using **any LaTeX editor** — online or offline:

| Editor | Type | Link |
|---|---|---|
| **Overleaf** | Online | [overleaf.com](https://www.overleaf.com/) |
| **Papeeria** | Online | [papeeria.com](https://papeeria.com/) |
| **TeXstudio** | Offline | [texstudio.org](https://www.texstudio.org/) |
| **TeXmaker** | Offline | [xm1math.net/texmaker](https://www.xm1math.net/texmaker/) |
| **VS Code + LaTeX Workshop** | Offline | [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) |

> **Steps**: Extract the zip → Open `Digital_Comm.tex` in your preferred editor → Edit and compile to PDF.

---

## Getting Started

### Prerequisites

- **MATLAB** (R2020a or newer recommended)
- **Signal Processing Toolbox** (required for `pwelch` in line coding analysis)

> [!TIP]
> **Don't have MATLAB installed?** You can use [**MATLAB Online**](https://matlab.mathworks.com/) — a browser-based version of MATLAB that requires a MathWorks account (free for students with a university email). Just upload the `.m` files and run them directly in your browser — no installation needed!

### Installation & Execution

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ExTc-aShiSh/Digital_Communication-using-MATLAB-.git
   ```
2. **Navigate into the folder**:
   ```bash
   cd Digital_Communication-using-MATLAB-
   ```
3. **Run experiments in MATLAB** (Desktop or Online):
   - **Desktop**: Open MATLAB and set `MATLAB_Codes/` as your working directory. Run any script:
     ```matlab
     run('ASK_PSK_FSK.m')
     ```
   - **MATLAB Online**: Go to [matlab.mathworks.com](https://matlab.mathworks.com/), upload the scripts from `MATLAB_Codes/`, and run them in the browser.

---

## Open Source & Contributions

This repository is open source under the [MIT License](LICENSE). Contributions that enhance code clarity, introduce new experiments, or add documentation are welcome.

### How to Contribute

- **Report Issues**: Open an issue if you encounter bugs or mathematical discrepancies.
- **Submit Improvements**:
  1. Fork the repository.
  2. Create a feature branch: `git checkout -b feature/new-experiment`.
  3. Commit your changes: `git commit -m "Add QPSK modulation simulation"`.
  4. Push to the branch: `git push origin feature/new-experiment`.
  5. Open a Pull Request.

---

## License

This project is licensed under the [MIT License](LICENSE) - see the file for full details.

<div align="center">


**Made with ❤️ by Ashish**

</div>
