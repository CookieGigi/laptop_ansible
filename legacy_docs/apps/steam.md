# Steam

## Overview

Steam is a digital distribution platform for video games and software.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub com.valvesoftware.Steam`
- **Ansible Role**: [`/ansible/roles/app/steam`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/steam)

## Configuration

- **Main Config Path**: `~/.var/app/com.valvesoftware.Steam/config/`
- **Games Path**: `~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/`

## Usage

Steam is used to buy, play, and manage your game library.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak ID for Steam (`com.valvesoftware.Steam`) |
| `flatpak_app_alias` | Alias for Steam (`steam`) |

## Dependencies

- Flatpak
- Flathub repository
