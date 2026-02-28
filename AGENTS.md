# AGENTS.md - System Maintain Repository Guidelines

> Guide for AI agents working in this Ansible-based system configuration repository.

## Commands

### Run Playbooks

```bash
make bootstrap             # System bootstrap (requires sudo once)
make setup                 # User bootstrap (shell, terminal, fonts)
make install GROUP=<name>  # Install a package group
make remove GROUP=<name>   # Remove a package group
make diff GROUP=<name>     # Dry-run to see changes
make preset NAME=<name>    # Apply a preset configuration
make list                  # List available groups
make status                # Show current system state
```

### Direct Ansible (when needed)

```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-rust"
```

---

## Project Structure

- `groups/` - Package group definitions (YAML)
- `ansible/playbooks/` - Main playbooks (numbered: 00-, 01-, 02-)
- `ansible/inventory/state.yml` - Tracks installed groups
- `docs/ai/` - AI documentation (concepts, files, progress)

---

## Code Style

### YAML/Ansible

- Use `ansible.builtin.` prefix for all modules (e.g., `ansible.builtin.fail`, `ansible.builtin.stat`)
- Files start with `---`
- Indentation: 2 spaces
- Comments at top explaining purpose and usage

### Naming Conventions

- Playbooks: `NN-descriptive-name.yml` (numbered)
- Groups: `descriptive-name.yml`
- Variables: snake_case (e.g., `group_action`, `installed_groups`)

### Task Patterns

- Every task must have a `name`
- Use `changed_when: false` for read-only operations
- Use `set -o pipefail` in shell commands with pipes
- Double quotes for strings with variables
- Simple strings can omit quotes

---

## Testing

### Dry-Run Mode

Always test changes before applying:

```bash
make diff GROUP=<name>     # See what would change
```

### Syntax Validation

Check syntax before committing:

```bash
make syntax-check          # Validate all playbooks
```

### Linting

Run linter to catch issues:

```bash
make lint                  # Run ansible-lint
```

### Testing Individual Playbooks

```bash
cd ansible
# Check specific playbook
ansible-playbook --syntax-check playbooks/02-groups.yml

# Dry-run specific group
ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-rust" --check --diff
```

---

## Group Structure

Group definitions are YAML files in `groups/` directory.

**Full documentation**: See `docs/ai/concepts/groups/`

**Create new group**: `./scripts/create-group.sh <name>`

---

### Conditions

Install packages based on system detection (NVIDIA GPU, laptop, etc.).

**Full documentation**: See `docs/ai/concepts/conditions/`

---

## Presets

Pre-configured group collections for common setups.

**Full documentation**: See `docs/ai/concepts/presets/`

**Apply preset**: `make preset NAME=<name>`

---

## State

YAML file tracking installed groups and system conditions.

**Full documentation**: See `docs/ai/concepts/state/`

**View state**: `make status`

**Location**: `ansible/inventory/state.yml`
