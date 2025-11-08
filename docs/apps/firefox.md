# Firefox

## Overview

Firefox is a free and open-source web browser developed by Mozilla. It is used as the default browser in this system for
general web browsing.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub org.mozilla.firefox`
- **Ansible Role**: [`/ansible/roles/app/firefox`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/firefox)

## Configuration

- **Main Config Path**: `~/.var/app/org.mozilla.firefox/.mozilla/firefox/`
- **Files**:
  - `prefs.js`: Main configuration file for Firefox preferences

## Usage

Firefox is used for general web browsing and is the default browser in the system.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak ID for Firefox (`org.mozilla.firefox`) |
| `flatpak_app_alias` | Alias for Firefox (`firefox`) |

## Dependencies

- Flatpak
- Flathub repository
