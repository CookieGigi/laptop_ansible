# Flatpak

## Overview

Flatpak is a utility for software deployment, package management, and application virtualization for Linux. This role installs Flatpak and adds the Flathub repository.

## Installation

- **Method**: APT
- **Role Path**: [`/ansible/roles/package_manager/flatpak`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/flatpak)

## Configuration

- **Flatpak**: Installs the Flatpak package manager.
- **Flathub**: Adds the Flathub repository for Flatpak applications.
- **Path**: Adds Flatpak's binary directory to the user's PATH.

## Usage

Flatpak is used to install and manage applications in a sandboxed environment.

## Variables

No specific variables are required for this role.

## Dependencies

- APT package manager