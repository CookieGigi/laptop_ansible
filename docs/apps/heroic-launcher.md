# Heroic Launcher

## Overview

Heroic Launcher is an open-source game launcher for Linux, designed to manage and launch games from various platforms,
including Epic Games, GOG, and Amazon.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub com.heroicgameslauncher.hgl`
- **Ansible Role**: [`/ansible/roles/app/heroic-launcher`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/heroic-launcher)

## Configuration

- **Main Config Path**: `~/.var/app/com.heroicgameslauncher.hgl/config/`

## Usage

Heroic Launcher is used to manage and launch games from different platforms.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak ID for Heroic Launcher (`com.heroicgameslauncher.hgl`) |
| `flatpak_app_alias` | Alias for Heroic Launcher (`heroic`) |

## Dependencies

- Flatpak
- Flathub repository
