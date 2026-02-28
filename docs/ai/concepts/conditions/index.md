# Conditions

System detection rules for conditional package installation.

## Overview

Conditions allow groups to install different packages based on system characteristics detected during bootstrap.

## Available Conditions

- **NVIDIA GPU**: `unified_nvidia_detected` - Install CUDA packages
- **Laptop**: `unified_laptop_detected` - Install power management tools

## Quick Reference

- **Usage**: See [usage.md](usage.md)
- **Detection**: Happens in `00-system-bootstrap.yml`
- **Variables**: Stored in `ansible/inventory/state.yml`
