# Proton Pass

## Overview

Proton Pass is a password manager developed by Proton AG, offering end-to-end encrypted password storage and management.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub me.proton.Pass`
- **Ansible Role**: [`/ansible/roles/app/proton-pass`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/proton-pass)

## Configuration

- **Main Config Path**: `~/.var/app/me.proton.Pass/config/`

## Usage

Proton Pass is used for secure password management and storage.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak ID for Proton Pass (`me.proton.Pass`) |
| `flatpak_app_alias` | Alias for Proton Pass (`proton-pass`) |

## Dependencies

- Flatpak
- Flathub repository