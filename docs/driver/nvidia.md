# NVIDIA Driver

## Overview

The NVIDIA driver role installs the proprietary NVIDIA drivers for GPU support on Linux systems. It ensures that the correct drivers are installed based on the detected hardware.

## Installation

- **Method**: APT
- **Role Path**: [`/ansible/roles/driver/nvidia`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/driver/nvidia)

## Configuration

- **Sources List**: Modifies `/etc/apt/sources.list` to include `non-free` and `contrib` repositories.
- **Packages**: Installs `linux-headers`, `build-essential`, `dkms`, and `nvidia-detect`.
- **Driver Installation**: Installs `nvidia-driver` and `nvidia-kernel-dkms`.

## Usage

This role is used to install and configure NVIDIA drivers for systems with NVIDIA GPUs.

## Variables

No specific variables are required for this role.

## Dependencies

- APT package manager
- Internet connection for package installation