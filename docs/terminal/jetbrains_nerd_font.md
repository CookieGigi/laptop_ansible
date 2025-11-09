# JetBrainsMono Nerd Font Installation Role

## Overview

This role installs the JetBrainsMono Nerd Font, which includes programming ligatures and icon glyphs for
enhanced terminal and editor experience.

## Features

- Downloads JetBrainsMono Nerd Font from official releases
- Installs to user's local font directory
- Refreshes system font cache
- Idempotent: skips installation if font already exists
- Verifies successful installation

## Requirements

- `unzip` command (for extracting font archive)
- `fc-cache` command (for font cache refresh)
- Internet connection (for downloading font)

## Role Variables

Available in `defaults/main.yml`:

```yaml
jetbrains_nerd_font_version: "v3.1.1"
jetbrains_nerd_font_url: "https://github.com/ryanoasis/nerd-fonts/releases/download/{{ jetbrains_nerd_font_version }}/JetBrainsMono.zip"
jetbrains_nerd_font_install_dir: "{{ ansible_env.HOME }}/.local/share/fonts"
```

## Usage

### In a Playbook

```yaml
- hosts: localhost
  roles:
    - jetbrains_nerd_font
```

### With Custom Version

```yaml
- hosts: localhost
  roles:
    - role: jetbrains_nerd_font
      vars:
        jetbrains_nerd_font_version: "v3.2.0"
```

## Example Playbook

Included in `playbooks/basic.yml`:

```yaml
---
- name: Install all basics
  hosts: localhost
  roles:
    - jetbrains_nerd_font
    - alacritty
    - tmux
```

## Post-Installation

After installation, configure your terminal or editor to use the font:

### Alacritty

Add to `~/.config/alacritty/alacritty.toml`:

```toml
[font]
size = 12.0

[font.normal]
family = "JetBrainsMono Nerd Font"
style = "Regular"

[font.bold]
family = "JetBrainsMono Nerd Font"
style = "Bold"

[font.italic]
family = "JetBrainsMono Nerd Font"
style = "Italic"
```

### Tmux

Tmux will automatically use the font configured in your terminal emulator (like Alacritty).

### Verify Installation

```bash
fc-list | grep -i "JetBrainsMono Nerd Font"
```

## What Gets Installed

- All JetBrainsMono Nerd Font variants (Regular, Bold, Italic, etc.)
- Icon glyphs for programming (Git, file types, etc.)
- Ligatures for code readability
- Powerline symbols for status bars

## Notes

- Font is installed per-user in `~/.local/share/fonts`
- Does not require root/sudo privileges
- Font cache is refreshed automatically
- Installation is idempotent (safe to run multiple times)

## Dependencies

None

## License

Role: MIT
Font: SIL Open Font License 1.1

## Author

Created for system_maintain project
