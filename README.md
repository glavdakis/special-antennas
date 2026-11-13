# Special Antennas

This repository contains the assignments for the **Special Antennas** course at the ECE AUTH during the 2024–2025 academic year.

## 📋 Contents

### 📁 Project A (Set 1): Compact H-Ring Antenna for RFID Applications
* **1.1 Antenna Design**: A square monopole, an H-shaped and an H-ring microstrip antenna on FR4 ($\epsilon_r = 4.4$, $\tan\delta = 0.018$) built with the MATLAB Antenna Toolbox (`pcbStack`), following the reference paper, along with their meshes.
* **1.2 Reflection Coefficient**: $S_{11}$ of the three antennas from 1.5 GHz to 6.5 GHz with $Z_0 = 50\ \Omega$.
* **1.3 Current Distribution**: Surface currents of the H-shaped antenna at 2.4 GHz and of the H-ring antenna at 2.4 GHz and 5.8 GHz.
* **1.4 Radiation Patterns**: Vertical patterns of the H-ring antenna in the $\phi = 0^\circ$ and $\phi = 90^\circ$ planes at 2.4 GHz and 5.8 GHz, and a comparison of all results with the paper.

### 📁 Project B (Set 2): Beamformers & Optical Phased Arrays
* **2.1 Uniform Linear Array**: Field distribution and array factor of a 7-element array at 1 GHz for phase differences $\delta = 30^\circ, 60^\circ, 90^\circ, 120^\circ$, with $d = \lambda/2$ and $d = \lambda/4$.
* **2.2 Number of Elements**: The same simulation for 5- and 9-element arrays with $d = \lambda/2$, comparing their HPBW and sidelobes.
* **2.3 Binomial Array**: A 7-element array with binomial current amplitudes $[1, 6, 15, 20, 15, 6, 1]$ that removes the sidelobes.
* **2.4 Optical Phased Array**: The element phases of an 8-element OPA at $\lambda = 1550$ nm for beam steering to $30^\circ$, $60^\circ$ and $90^\circ$, compared with the given table, and a binomial amplitude distribution realized with Mach-Zehnder interferometers.
