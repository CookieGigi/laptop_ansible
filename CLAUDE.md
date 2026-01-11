# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Critical Requirements

### Working Directory
**ALL Ansible commands MUST be executed from the `ansible/` directory!**

The `ansible.cfg` file is located there and uses relative paths for role resolution. Always `cd ansible` before running any ansible commands.

### Playbook Execution Policy

**🚨 ABSOLUTELY NEVER RUN ANSIBLE PLAYBOOKS AUTOMATICALLY! 🚨**

This means:
- ❌ NEVER use `ansible-playbook` to execute playbooks
- ❌ NEVER run playbooks with --tags, --check, or any other flags
- ❌ NEVER execute roles directly
- ❌ DO NOT run playbooks even if user says "install" or "setup"

What you CAN and SHOULD do:
- ✅ Create roles and playbook entries
- ✅ Run `ansible-lint` to verify code quality
- ✅ Run `ansible-playbook --syntax-check` to verify YAML syntax
- ✅ Run `ansible-playbook --list-tasks` to show what would run
- ✅ Provide the user with the EXACT command they need to run manually

The user will execute playbooks themselves when ready.

## Common Commands

All commands below assume you're in the `ansible/` directory unless otherwise noted.

### Development Workflow

```bash
# After creating/modifying roles (ALWAYS run this!)
cd ansible && ansible-lint

# Lint specific role
cd ansible && ansible-lint roles/<category>/<role_name>/

# Syntax check a playbook
cd ansible && ansible-playbook --syntax-check playbooks/<playbook>.yml

# Show what tasks would run (without executing)
cd ansible && ansible-playbook --list-tasks playbooks/<playbook>.yml --tags <tag>
```

### Linting Other File Types

```bash
# Markdown (from project root)
markdownlint docs/**/*.md
markdownlint --fix docs/**/*.md

# Shell scripts (from project root)
shellcheck <script>.sh
find . -name "*.sh" -exec shellcheck {} +

# Biome for JS/TS/JSON/CSS (from project root)
biome check --apply .
```

## Architecture

### Package Management Philosophy

This project uses a **user-space first** approach with three package managers:

1. **Flatpak** (GUI applications)
   - Role: `flatpak_user_install`
   - Installed with `--user` flag in user space
   - Automatically creates shell aliases via `add_alias` role
   - Examples: Firefox, LibreWolf, Obsidian, KDE Connect

2. **Nix** (CLI tools and dev environments)
   - Role: `nix_install`
   - Single-user installation (no daemon)
   - Profile at `~/.nix-profile/etc/profile.d/nix.sh`
   - Idempotent: checks `nix profile list` before installing
   - Packages from nixpkgs

3. **npm** (JavaScript/Node.js tools)
   - Role: `npm_install`
   - For JS-based CLI tools and language servers

### Role Organization

Roles are categorized under `ansible/roles/`:

- **app/**: GUI applications (Flatpak-based)
- **config/**: Configuration management (dotfiles, Neovim configs, KDE settings)
- **dev/**: Development tools (LSPs, linters, formatters)
- **package_manager/**: Core package manager setup roles
- **terminal/**: Terminal tools and utilities
- **user/**: User management and SSH keys
- **driver/**: Hardware drivers (NVIDIA)
- **monitoring/**: System monitoring (logwatch)
- **system/**: System maintenance (updates, health checks)

### Reusable Utility Roles

These roles are designed to be included by other roles via `ansible.builtin.include_role`:

#### `add_alias`
Adds shell aliases to `~/.zshrc` with Ansible-managed blocks.

**Variables:**
- `add_alias_alias_name`: Alias name
- `add_alias_alias_cmd`: Command to alias

**Usage in roles:**
```yaml
- name: Add alias
  ansible.builtin.include_role:
    name: add_alias
  vars:
    add_alias_alias_name: "vi"
    add_alias_alias_cmd: "nvim"
```

#### `add_neovim_config`
Sets up isolated Neovim configurations using `NVIM_APPNAME`.

**Variables:**
- `add_neovim_config_path`: Actual config directory path
- `add_neovim_config_appname`: NVIM_APPNAME (relative to `~/.config/`)
- `add_neovim_config_alias`: Shell alias name
- `add_neovim_config_repo`: Git repo URL (optional)

**How it works:**
1. Clones/updates repo to actual path (e.g., `~/Project/neovim/base`)
2. Creates symlink `~/.config/<appname>` → actual path
3. Creates alias: `alias <alias>="NVIM_APPNAME=<appname> nvim"`

**Pattern:** Multiple Neovim configs coexist (nvim_dev, nvim_prod, nvim_sh_dev, nvim_rust_dev)

#### `nix_install`
Installs packages via Nix with idempotency.

**Variables:**
- `nix_install_nix_packages`: List of nixpkgs packages
- `nix_install_allow_unfree`: (Optional) Boolean to allow unfree packages (default: `false`)

**Implementation:**
- Checks `nix profile list` before installing
- Only installs if package not already present
- Sources `nix_profil_path` before commands
- Uses `NIXPKGS_ALLOW_UNFREE=1` and `--impure` if `nix_install_allow_unfree` is true

#### `flatpak_user_install`
Installs Flatpak apps in user space.

**Variables:**
- `flatpak_user_install_flatpak_app_id`: Flatpak app ID
- `flatpak_user_install_flatpak_app_alias`: Shell alias

**Implementation:**
- Checks `flatpak list` before installing
- Installs with `--user` flag
- Auto-creates alias via `add_alias` role

### Global Variables

Defined in `ansible/group_vars/all.yml`:

- `shell_config`: `~/.zshrc` (shell RC file path)
- `nix_profil_path`: `~/.nix-profile/etc/profile.d/nix.sh`
- `dotfiles_path`: `~/dotfiles`
- Daily update configuration variables

### Playbooks

- **basic.yml**: Core system setup (shell, CLI tools, terminal, fonts)
- **app.yml**: Desktop applications
- **config.yml**: Configuration and dotfiles
- **ai.yml**: AI/ML tools
- **nvidia.yml**: NVIDIA drivers

## Creating New Roles

### Standard Role Structure

```
ansible/roles/<category>/<role-name>/
├── tasks/main.yml          # Required: task definitions
├── defaults/main.yml       # Optional: default variables
├── vars/main.yml          # Optional: role variables
├── meta/main.yml          # Optional: dependencies
├── handlers/main.yml      # Optional: handlers
└── templates/             # Optional: Jinja2 templates (.j2)
```

### For GUI Applications

1. Create role in `ansible/roles/app/<app-name>/`
2. Use `flatpak_user_install` role:
   ```yaml
   - name: Install app via Flatpak
     ansible.builtin.include_role:
       name: flatpak_user_install
     vars:
       flatpak_user_install_flatpak_app_id: "org.example.App"
       flatpak_user_install_flatpak_app_alias: "appname"
   ```
3. Add to `ansible/playbooks/app.yml` with tags
4. Create docs in `docs/apps/<app-name>.md`

### For CLI Tools

1. Create role in `ansible/roles/terminal/<tool-name>/` or `ansible/roles/dev/<tool-name>/`
2. Use `nix_install` role:
   ```yaml
   - name: Install via Nix
     ansible.builtin.include_role:
       name: nix_install
     vars:
       nix_install_nix_packages:
         - "nixpkgs#<package-name>"
   ```
3. Add to appropriate playbook with tags
4. Create docs in `docs/terminal/<tool-name>.md` or `docs/dev/<tool-name>.md`

## Code Style

- **YAML**: 2-space indentation
- **Naming**:
  - Playbooks: `lowercase_with_underscores.yml`
  - Roles: `lowercase-with-dashes/`
  - Variables: `snake_case`
- **Idempotency**: All tasks must be safe to run multiple times
  - Check before installing (e.g., `flatpak list`, `nix profile list`)
  - Use `changed_when` and `failed_when` appropriately
  - Use `when` conditions to skip unnecessary operations
- **Managed Blocks**: Use `blockinfile` with unique markers for config files
- **Paths**: Never use absolute paths in docs; use relative from project root

## Inventory

Copy `ansible/inventory.ini.example` to `ansible/inventory.ini`. Typically:
```ini
localhost ansible_connection=local ansible_user=<username>
```

## Additional Documentation

See `AGENTS.md` for complete development tool list and additional guidelines.
