# pipx

pipx is a tool to install and run Python applications in isolated environments. It's similar to npx for Node.js but creates isolated virtual environments for each application.

## Installation

pipx is installed automatically as a dependency when installing Python CLI tools that require it (like ansible).

Manual installation:

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags ansible
```

## What it does

- Installs pipx via Nix
- Provides isolated Python environments for CLI tools
- Prevents dependency conflicts between Python applications
- Adds installed tools to PATH automatically

## Package manager

Nix (nixpkgs)

## Architecture

This repository includes two pipx-related roles:

1. **pipx** (`ansible/roles/package_manager/pipx/`): Installs pipx itself
2. **pipx_install** (`ansible/roles/package_manager/pipx_install/`): Reusable role for installing packages via pipx

## Usage

```bash
# List installed applications
pipx list

# Install an application
pipx install <package>

# Inject library into existing app environment
pipx inject <app> <library>

# Upgrade an application
pipx upgrade <package>

# Upgrade all applications
pipx upgrade-all

# Uninstall an application
pipx uninstall <package>

# Run an application without installing
pipx run <package>
```

## For Role Developers

Use the `pipx_install` reusable role in your roles:

```yaml
---
- name: Install Python CLI tool
  ansible.builtin.include_role:
    name: pipx_install
  vars:
    pipx_install_package: "myapp"
    pipx_install_package_spec: "myapp>=1.0.0"
    pipx_install_inject_packages:
      - "library1>=2.0.0"
      - "library2"
```

### Role Variables

- **pipx_install_package** (required): The base package name (e.g., "ansible")
- **pipx_install_package_spec** (optional): Full package specification with version (e.g., "ansible>=2.9")
- **pipx_install_inject_packages** (optional): List of packages to inject into the environment

### Example: Installing a Tool with Dependencies

```yaml
---
# ansible/roles/dev/mytool/tasks/main.yml
- name: Install mytool with extra dependencies
  ansible.builtin.include_role:
    name: pipx_install
  vars:
    pipx_install_package: "mytool"
    pipx_install_package_spec: "mytool>=3.0.0"
    pipx_install_inject_packages:
      - "requests>=2.28.0"
      - "pyyaml>=6.0"
```

### Example: Simple Installation

```yaml
---
# ansible/roles/dev/black/tasks/main.yml
- name: Install black code formatter
  ansible.builtin.include_role:
    name: pipx_install
  vars:
    pipx_install_package: "black"
    pipx_install_package_spec: "black>=23.0.0"
```

## Idempotency

The `pipx_install` role is fully idempotent:

- Checks if package is already installed before installing
- Checks if libraries are already injected before injecting
- Safe to run multiple times

## Why pipx?

### Benefits

1. **Isolation**: Each Python CLI tool runs in its own virtual environment
2. **No Conflicts**: Tools can use different dependency versions
3. **Clean System**: Avoids polluting system Python or user site-packages
4. **Easy Management**: Simple commands for install/upgrade/uninstall
5. **Global Access**: Tools are available system-wide via PATH

### Use Cases

- **CLI Tools**: ansible, black, flake8, pytest, awscli, etc.
- **Development Tools**: Tools you want available globally but isolated
- **Version Management**: Run multiple tools with conflicting dependencies

### pipx vs pip

- **pip**: Install libraries into virtual environments or system Python
- **pipx**: Install CLI applications with automatic environment management

### pipx vs uv

In this repository:

- **pipx**: For isolated CLI applications (ansible, black, etc.)
- **uv**: For project-specific dependencies and virtual environments

## Related tools

- uv: Modern Python package manager
- nix: Package manager used to install pipx itself
- ansible: Example of a tool installed via pipx in this repository

## Troubleshooting

### pipx not found after installation

Source your Nix profile:

```bash
source ~/.nix-profile/etc/profile.d/nix.sh
```

### Check pipx environment

```bash
# Show pipx configuration
pipx environment

# Show detailed info about an app
pipx list --verbose
```

### Reinstall an app

```bash
pipx uninstall <app>
pipx install <app>
```

## Examples in This Repository

### Ansible with Kubernetes/OpenShift

```yaml
# ansible/roles/dev/ansible/tasks/main.yml
- name: Install Ansible with Kubernetes and OpenShift support via pipx
  ansible.builtin.include_role:
    name: pipx_install
  vars:
    pipx_install_package: "ansible"
    pipx_install_package_spec: "ansible>=2.9"
    pipx_install_inject_packages:
      - "kubernetes>=12.0.0"
      - "openshift>=0.12.0"
```

This demonstrates:

- Installing a main application (ansible)
- Injecting additional libraries (kubernetes, openshift)
- Version constraints for all packages
