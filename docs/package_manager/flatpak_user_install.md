# Flatpak User Install

## Overview

This role installs Flatpak applications for the current user and creates an alias for easier execution.

## Installation

- **Method**: Flatpak
- **Role Path**: [`/ansible/roles/package_manager/flatpak_user_install`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/flatpak_user_install)

## Configuration

- **Installation**: Installs the specified Flatpak application for the user.
- **Alias**: Creates an alias for the installed application.

## Usage

This role is used to install and manage user-specific Flatpak applications.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak application ID (e.g., `org.gnome.Calculator`) |
| `flatpak_app_alias` | Alias for the application (e.g., `calculator`) |

## Dependencies

- Flatpak
