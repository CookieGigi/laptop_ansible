# System Maintain Ansible Project - Agent Guidelines

> **CRITICAL**: All Ansible commands must be executed from the `ansible/` directory!
> The `ansible.cfg` file is located there and uses relative paths for role resolution.

## Working Directory

- **Ansible commands**: Must be run from `ansible/` directory (relative to project root)
- **Reason**: The `ansible.cfg` file with role paths is located in the ansible/ directory

## Build/Lint/Test Commands

> **IMPORTANT**: After creating or modifying Ansible roles, ALWAYS run linting to ensure code quality!
> **CRITICAL**: NEVER run playbooks automatically! Only perform syntax checks and linting.

### Ansible

- **Ansible Lint**: `cd ansible && ansible-lint` (ALWAYS run after creating/modifying roles)
- **Lint Specific Role**: `cd ansible && ansible-lint roles/<category>/<role_name>/`
- **Syntax Check**: `cd ansible && ansible-playbook --syntax-check playbooks/<playbook>.yml`
- **Run Playbook**: NEVER run automatically - user must execute manually
- **Test Role**: NEVER run automatically - user must execute manually

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

- **Prettier** (JavaScript, JSON, YAML, Markdown):
  - Format file: `prettier --write <file>`
  - Check formatting: `prettier --check <file>`
  - Format all: `prettier --write "**/*.{js,json,yml,yaml,md}"`

### All Linters at Once

- **Lint everything**: Run from project root:
  ```bash
  cd ansible && ansible-lint && cd .. && \
  markdownlint docs/**/*.md && \
  find . -name "*.sh" -exec shellcheck {} +
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
- **prettier**: Multi-language code formatter

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
