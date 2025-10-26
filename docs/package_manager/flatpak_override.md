# Flatpak Override

## Overview

This role allows overriding specific settings for Flatpak applications, such as permissions or environment variables.

## Installation

- **Method**: Flatpak
- **Role Path**: [`/ansible/roles/package_manager/flatpak_override`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/flatpak_override)

## Configuration

- **Override Command**: Executes `flatpak override` with specified options and application ID.

## Usage

This role is used to customize the behavior of Flatpak applications.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_option` | Option for Flatpak override (e.g., `--filesystem=host`) |
| `flatpak_app_id` | Flatpak application ID (e.g., `org.gnome.Calculator`) |

## Dependencies

- Flatpak