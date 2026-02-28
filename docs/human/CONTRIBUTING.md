# Contributing

Guidelines for contributing to this project.

## Adding New Groups

Use the helper script:
```bash
./scripts/create-group.sh <group-name>
```

This creates a template in `groups/<group-name>.yml`.

## Group Structure

```yaml
---
group_name: "Display Name"
description: "What this group installs"
requires: []  # List of dependent groups

packages:
  nix: []     # Preferred for CLI tools
  flatpak: [] # For GUI applications
  pipx: []    # Python CLI tools
  cargo: []   # Rust packages
  npm: []     # Node.js packages
  apt: []     # Only when necessary

config_roles: []  # Ansible roles to run after install
post_install_message: "Optional message"
```

## Code Style

- Use `ansible.builtin.` prefix for all modules
- Indent with 2 spaces
- Every task must have a `name`
- Use `changed_when: false` for read-only operations

## Testing

Before submitting:
1. Run `make syntax-check` to validate playbooks
2. Run `make lint` for ansible-lint compliance
3. Test with `make diff GROUP=<name>` first

## Pull Request Process

1. Fork and branch from `main`
2. Add/update documentation
3. Test your changes locally
4. Submit PR with clear description

## Questions?

Open an issue or check the docs in `docs/`.
