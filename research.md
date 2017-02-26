# Research

## High Performance Computing

### GPU Computing

GPU devices provides a great computing power with a low power consumption. Many applications may benefit from GPU acceleration.

- Use GPU as accelerators for compute intensive parts of applications
- Optimize code, algorithm and numerical methods to fit GPU architecture

### Hybrid computing

The recent heterogeneous architectures provide both CPU and accelerators (GPU, co-processors) that must be exploited concurrently in numerical applications.

- Distribute computations on both CPU and co-processors (GPU)
- Efficient usage of full hybrid clusters
- 'In-situ' parallelism

## Hybrid remeshed particle methods (semi-Lagrangian particle method)

### High order remeshing formulas

- Analysis of high spatial order remeshing formulas with dimensional splitting
- Use GPUs to handle high numerical cost

### Hybrid and multi-scale solver for passive scalar turbulent transport

- Use different scales for flow (coarse scale) and scalar transport (fine scale) computations
- Exploit different architectures for flow (CPUs) and transport (GPUs) solvers

### Multi-scale solver for multiphase turbulent flows

- Multi-scale coupling between fluid flow and density transport


# Collaborations

## Unstationary CFD around aerodynamic profiles (ONERA)

Optimizing and up-scaling a research code, NextFlow, developped at ONERA. The aim of this code is to demonstrate feasibility of LES methods for simulating turbulent flows in realisstic aerodynamic configurations.

- Multi-GPU code based on Finite Volumes methods with high order polynomial reconstruction of conservatives variables.
- Asynchronous co-processing on uused CPU cores

## NCI calculations using promolecular density (ICMR and ATOS)

Développment and optimization on GPU of a specific numerical method for studying ligand-protein interaction. The main objective is to integrate this code into a genetic algorithm for modecular docking.


## Yales2 GPU porting (CORIA)

Preliminary study for GPU porting of this two-phase combustion DNS simulation code.
