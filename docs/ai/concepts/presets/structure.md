# Preset File Structure

## Template

```yaml
---
# presets/{name}.yml
# Purpose: Description
# Apply with: make preset NAME={name}

preset_name: "Display Name"
description: "What this preset provides"

groups:
  - core
  - dev-base
  - dev-rust
  # ... more groups

post_apply_message: ""
```

## Fields

- `preset_name`: Human-readable name
- `description`: Brief explanation
- `groups`: List of groups to install (in order)
- `post_apply_message`: Message shown after applying

## Example

```yaml
---
# presets/workstation.yml
preset_name: "Development Workstation"
description: "Full development environment"

groups:
  - core
  - dev-base
  - dev-python
  - dev-rust
  - web

post_apply_message: "Workstation preset applied. Restart recommended."
```
