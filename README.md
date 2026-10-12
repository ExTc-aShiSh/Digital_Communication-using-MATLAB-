# Digital Communication Lab using MATLAB

[![MATLAB](https://img.shields.io/badge/Language-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Open Source Love](https://img.shields.io/badge/Open%20Source-%E2%99%A5-brightgreen.svg)](#open-source--contributions)
[![Curriculum](https://img.shields.io/badge/Focus-Academic%20Curriculum-lightgrey.svg)](#overview)

A curated collection of MATLAB implementations for fundamental Digital Communication experiments, created and maintained as part of an undergraduate engineering curriculum.

---

## Overview

- **Academic Focus**: Practical MATLAB simulations accompanying digital communication theory.
- **Open Source**: Freely available for students, educators, and enthusiasts to learn, reference, and expand upon.
- **Visual & Analytical**: Includes signal waveforms, spectral estimations, error metrics, and modulation/demodulation models.

---

## Experiments Index

| # | Topic | MATLAB Script | Key Concepts Simulated |
|---|---|---|---|
| **01** | Line Coding & PSD | [`Line_codings.m`](MATLAB_Codes/Line_codings.m) | Unipolar NRZ, Bipolar AMI, Manchester; Welch PSD estimation |
| **02** | PCM & DPCM | [`PCM_DPCM.m`](MATLAB_Codes/PCM_DPCM.m) | Sampling, uniform quantization, PCM binary encoding, DPCM difference quantization |
| **03** | DM & Adaptive DM | [`Delta_Adaptive_delta.m`](MATLAB_Codes/Delta_Adaptive_delta.m) | Slope overload, hunting error, adaptive step sizing, MSE comparison |
| **04** | Digital Modulation Schemes | [`ASK_PSK_FSK.m`](MATLAB_Codes/ASK_PSK_FSK.m) | ASK (OOK), BPSK, FSK modulation, correlation-based detection, BER verification |

---

## Repository Structure

```plaintext
Digital_Communication-using-MATLAB-/
│
├── MATLAB_Codes/
│   ├── Line_codings.m           # Experiment 1: Baseband line coding techniques & PSD
│   ├── PCM_DPCM.m               # Experiment 2: Pulse code and differential PCM systems
│   ├── Delta_Adaptive_delta.m   # Experiment 3: Delta and adaptive delta modulation
│   └── ASK_PSK_FSK.m            # Experiment 4: Carrier modulation (ASK, PSK, FSK)
│
├── .gitignore                   # Ignored temporary MATLAB/editor files
├── LICENSE                      # MIT Open Source License
└── README.md                    # Project documentation
```

---

## Getting Started

### Prerequisites

- **MATLAB** (R2020a or newer recommended)
- **Signal Processing Toolbox** (required for `pwelch` in line coding analysis)

### Installation & Execution

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ExTc-aShiSh/Digital_Communication-using-MATLAB-.git
   ```
2. **Navigate into the folder**:
   ```bash
   cd Digital_Communication-using-MATLAB-
   ```
3. **Run experiments in MATLAB**:
   - Open MATLAB and set `MATLAB_Codes/` as your working directory.
   - Run any desired script via the Command Window or Editor:
     ```matlab
     run('ASK_PSK_FSK.m')
     ```

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