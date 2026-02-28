# Group File Structure

## Template

```yaml
---
# groups/{name}.yml
# Purpose: Description
# Install with: make install GROUP={name}

group_name: "Display Name"
description: "What it provides"
requires: []

packages:
  nix: []
  flatpak: []
  pipx: []
  cargo: []
  npm: []
  apt: []  # Use only when necessary - requires root

conditional: []
post_install_message: ""
```

## Required Fields

- `group_name`: Human-readable name
- `description`: Brief explanation
- `packages`: At least one package manager defined

## APT Warning

**Use apt only when necessary.** Prefer nix/flatpak for user-space installations. Use apt for:
- System-level tools (no nix alternative)
- Kernel modules
- Display managers
