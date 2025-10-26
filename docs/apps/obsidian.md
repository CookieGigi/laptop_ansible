# Obsidian

## Overview

Obsidian is a powerful knowledge base and note-taking application that allows users to create and manage a personal wiki using Markdown files.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub md.obsidian.Obsidian`
- **Ansible Role**: [`/ansible/roles/app/obsidian`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/obsidian)

## Configuration

- **Main Config Path**: `~/.var/app/md.obsidian.Obsidian/config/obsidian/`
- **Files**:
  - `obsidian.json`: Main configuration file for Obsidian

## Usage

Obsidian is used for note-taking, knowledge management, and creating a personal wiki.

## Variables

| Variable | Description |
|----------|-------------|
| `flatpak_app_id` | Flatpak ID for Obsidian (`md.obsidian.Obsidian`) |
| `flatpak_app_alias` | Alias for Obsidian (`obsidian`) |

## Dependencies

- Flatpak
- Flathub repository