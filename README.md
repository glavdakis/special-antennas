# Special Antennas

This repository contains exercises completed for the **Special Antennas** course at the **Department of Electrical and Computer Engineering (ECE), Aristotle University of Thessaloniki (AUTH)** during the **2023–2024 academic year**.

The projects focus on the full-wave simulation of microstrip planar structures using the **MATLAB Antenna Toolbox**, alongside the design and phase-synthesis of microwave and optical beamforming systems.

---

## 📋 Contents

The repository is organized into two primary project directories based on course sets:

### 📁 Project 1: Microstrip Monopole Antenna Design for RFID Applications
* **1.1 Antenna Geometry Structural Evolution**: Complete parametric CAD build-up and substrate stack modeling of three structural stages on an FR4 dielectric substrate ($\epsilon_r = 4.4, \tan\delta = 0.018, h_{sub} = 0.8\text{ mm}$) fed by a microstrip transmission line:
  * *Square Monopole*: Basic rectangular radiating microstrip patch.
  * *H-Shaped Patch*: Introduction of symmetrical rectangular slots to shift resonant profiles.
  * *H-Ring Structure*: Advanced slotted dual-band radiating topology tailored for ISM frequency bands and RFID tag configurations.
* **1.2 Multi-Band Reflection Coefficient ($S_{11}$) Sweeps**: Frequency performance evaluation over a wide band from $1.5\text{ GHz}$ up to $6.5\text{ GHz}$, mapping operational return losses and verifying resonant shifting paths.
* **1.3 Surface Current Distributions**: High-fidelity visualization of metallic current vector mappings across the patch geometries at $2.4\text{ GHz}$ and $5.8\text{ GHz}$ operating points to isolate localized radiation nodes.
* **1.4 Elevation Radiation Patterns**: Polar field evaluations capturing elevation pattern cuts across the $\phi = 0^\circ$ and $\phi = 90^\circ$ operational sectors at target resonance points.

### 📁 Project 2: Beamforming Arrays & Optical Phased Array (OPA) Synthesis
* **2.1 Linear Beamformer Fields**: Field patterns and Array Factor (AF) visualizations of uniform linear elements at $1\text{ GHz}$ with half-wavelength ($d = \lambda/2$) and quarter-wavelength ($d = \lambda/4$) spacings. Simulates active beam-steering parameters over multiple phase progression offsets ($\delta = 30^\circ, 60^\circ, 90^\circ, 120^\circ$).
* **2.2 Array Scale & Element Resolution Analysis**: Comparative evaluation of 5-element vs. 9-element arrays with $d = \lambda/2$ tracking structural variations in Half-Power Beamwidth (HPBW), directivity thresholds, and Side Lobe Levels (SLL).
* **2.3 Side Lobe Suppression via Binomial Arrays**: Formulation of a side-lobe-free 7-element array utilizing a Binomial current excitation amplitude profile ($[1, 6, 15, 20, 15, 6, 1]$) derived from the expansion of $(1+x)^{N-1}$.
* **2.4 Optical Phased Array (OPA) Matrix Synthesis**:
  * *Phase Progression Control*: Algorithmic phase-wrapping synthesis ($\phi_n = -nkd_x\sin\theta_0$) for an $N=8$ uniform line emitter working at communication wavelength $\lambda = 1550\text{ nm}$ with element spacing $d_x = \lambda/2$, targeting strict pointing shifts ($\theta_0 = 30^\circ, 60^\circ, 90^\circ$).
  * *Integrated Photonic Weighting*: System architecture design for an 8-element binomial spatial window ($[1, 7, 21, 35, 35, 21, 7, 1]$) utilizing Mach-Zehnder Interferometers (MZI) driven via thermo-optic/electro-optic effects.