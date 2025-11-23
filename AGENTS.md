# System Maintain Ansible Project - Agent Guidelines

> **CRITICAL**: All Ansible commands must be executed from the `ansible/` directory!
> The `ansible.cfg` file is located there and uses relative paths for role resolution.

## Project Structure

```
system_maintain/
├── ansible/                    # Main Ansible directory (run all ansible commands from here!)
│   ├── group_vars/            # Group variables
│   ├── playbooks/             # Ansible playbooks
│   │   ├── ai.yml            # AI/ML setup playbook
│   │   ├── app.yml           # Application installation playbook
│   │   ├── basic.yml         # Basic system setup playbook
│   │   ├── config.yml        # Configuration management playbook
│   │   ├── dev.yml           # Development tools playbook
│   │   └── nvidia.yml        # NVIDIA driver playbook
│   ├── roles/                 # Ansible roles organized by category
│   │   ├── app/              # Desktop applications
│   │   ├── config/           # System configuration
│   │   ├── dev/              # Development tools
│   │   ├── driver/           # Hardware drivers
│   │   ├── package_manager/  # Package manager setup
│   │   ├── terminal/         # Terminal environment
│   │   └── user/             # User management
│   ├── ansible.cfg           # Ansible configuration (defines role paths)
│   └── .gitignore
├── docs/                      # Documentation for each role
│   ├── apps/
│   ├── config/
│   ├── dev/
│   ├── driver/
│   ├── monitoring/
│   ├── package_manager/
│   ├── terminal/
│   └── user/
├── dotfiles/                  # Git submodules for configuration files
│   ├── alacritty/
│   ├── kdeconfig/
│   └── tmux/
├── .gitignore
├── .markdownlint.json
├── AGENTS.md                 # This file - agent guidelines
├── opencode.json
└── README.md
```

### Directory Purposes

- **ansible/**: Core Ansible directory containing all playbooks, roles, and configuration
  - **CRITICAL**: All ansible commands must be run from this directory!
- **docs/**: Markdown documentation for each role, organized by category
- **dotfiles/**: Git submodules containing actual configuration files managed by roles
- **Role Categories**:
  - `app/`: Desktop applications and GUI tools
  - `config/`: System and application configuration management
  - `dev/`: Development tools, LSP servers, linters, and CLI utilities
  - `driver/`: Hardware drivers and kernel modules
  - `package_manager/`: Package manager installation and configuration
  - `terminal/`: Terminal emulator and shell environment setup
  - `user/`: User account creation and management

### Playbook Descriptions

- **ai.yml**: AI/ML tools and framework setup
- **app.yml**: Desktop application installation
- **basic.yml**: Basic system setup and essential packages
- **config.yml**: System configuration and dotfiles deployment
- **dev.yml**: Development environment setup
- **nvidia.yml**: NVIDIA GPU driver installation

## Working Directory

- **Ansible commands**: Must be run from `ansible/` directory (relative to project root)
- **Reason**: The `ansible.cfg` file with role paths is located in the ansible/ directory

## Build/Lint/Test Commands

> **IMPORTANT**: After creating or modifying Ansible roles, ALWAYS run linting to ensure code quality!
> 
> **🚨 CRITICAL - PLAYBOOK EXECUTION POLICY 🚨**
> 
> **ABSOLUTELY NEVER RUN ANSIBLE PLAYBOOKS AUTOMATICALLY!**
> 
> This means:
> - ❌ NEVER use `ansible-playbook` command to execute playbooks
> - ❌ NEVER run playbooks with ANY tags (--tags)
> - ❌ NEVER run playbooks in "test" mode or "check" mode to "verify" they work
> - ❌ NEVER execute roles directly
> - ❌ DO NOT run playbooks even if the user says "install" or "setup" - CREATE THE ROLE ONLY
> 
> What you CAN and SHOULD do:
> - ✅ Create roles and playbook entries
> - ✅ Run `ansible-lint` to verify code quality
> - ✅ Run `ansible-playbook --syntax-check` to verify YAML syntax
> - ✅ Run `ansible-playbook --list-tasks` to show what would run
> - ✅ Provide the user with the EXACT command they need to run manually
> 
> The user will execute playbooks themselves when they are ready.

### Ansible

- **Ansible Lint**: `cd ansible && ansible-lint` (ALWAYS run after creating/modifying roles)
- **Lint Specific Role**: `cd ansible && ansible-lint roles/<category>/<role_name>/`
- **Syntax Check**: `cd ansible && ansible-playbook --syntax-check playbooks/<playbook>.yml`
- **List Tasks**: `cd ansible && ansible-playbook --list-tasks playbooks/<playbook>.yml --tags <tag>`
- **Run Playbook**: ❌ FORBIDDEN - User must execute manually
- **Test Role**: ❌ FORBIDDEN - User must execute manually

### Shell Scripts

- **ShellCheck**: `shellcheck <script>.sh`
- **Check all shell scripts**: `find . -name "*.sh" -exec shellcheck {} +`

### YAML

- **YAML Language Server**: Integrated via LSP (auto-runs in editor)
- **Manual YAML validation**: `yamllint <file>.yml` (if yamllint installed)

### Markdown

- **Markdownlint**: `markdownlint docs/**/*.md`
- **Fix auto-fixable issues**: `markdownlint --fix docs/**/*.md`
- **Check single file**: `markdownlint <file>.md`

### Dockerfiles

- **Hadolint**: `hadolint Dockerfile`
- **Check all Dockerfiles**: `find . -name "Dockerfile*" -exec hadolint {} +`

### Code Formatting

- **Biome** (JavaScript, TypeScript, JSON, JSX, CSS):
  - Format file: `biome format --write <file>`
  - Check formatting: `biome format <file>`
  - Format all: `biome format --write .`
  - Lint and format: `biome check --apply .`

### All Linters at Once

- **Lint everything**: Run from project root:
  ```bash
  cd ansible && ansible-lint && cd .. && \
  markdownlint docs/**/*.md && \
  find . -name "*.sh" -exec shellcheck {} + && \
  biome check .
  ```

## Code Style Guidelines

- **YAML Formatting**: 2-space indentation, consistent spacing after colons
- **Naming**:
  - Playbooks: lowercase_with_underscores.yml
  - Roles: lowercase-with-dashes/
  - Tasks: main.yml (within role directories)
  - Variables: vars/main.yml
- **Imports**: Group similar imports (e.g., all Ansible modules together)
- **Error Handling**: Use `ignore_errors: yes` and `failed_when` for controlled failure handling
- **Idempotency**: Ensure all tasks are idempotent (can run multiple times safely)
- **Documentation**:
  - Include purpose comments for complex playbooks/roles
  - **Never use absolute paths** (e.g., `/home/user/...`) in documentation or code
  - Always use relative paths from project root (e.g., `./ansible/`, `docs/`)
- **Variable Naming**: snake_case for variables, UPPER_CASE for constants

## Installed Development Tools

### LSP Servers (Language Server Protocol)

These are automatically used by editors (Neovim, OpenCode) for code intelligence:

- **bash-language-server**: Bash/shell script completion and diagnostics
- **lua-language-server**: Lua code completion and analysis
- **yaml-language-server**: YAML validation and schema support (perfect for Ansible!)
- **marksman**: Markdown LSP for link validation and completion

### Linters & Formatters

- **ansible-lint**: Ansible playbook and role linting
- **shellcheck**: Shell script static analysis
- **hadolint**: Dockerfile linter
- **markdownlint-cli**: Markdown style checking
- **biome**: Fast formatter and linter for JavaScript, TypeScript, JSON, JSX, CSS

### CLI Tools

- **bat**: Syntax-highlighted cat alternative
- **eza**: Modern ls replacement with git integration
- **fd**: Fast find alternative
- **fzf**: Fuzzy finder for command line
- **ripgrep (rg)**: Fast text search tool
- **jq**: JSON processor
- **yq**: YAML processor
- **tree**: Directory structure visualization
- **gh**: GitHub CLI
- **lazygit**: Terminal UI for git

## Ansible Specifics

- Role structure follows Ansible Galaxy standards
- Use `tags` for logical task grouping
- Template files use `.j2` extension
- Inventory managed via `inventory.ini`
