# Ansible Collections

This role installs required Ansible collections via ansible-galaxy. Collections are bundles of modules, plugins, and roles that extend Ansible's functionality.

## Installation

This role is automatically installed as a dependency when using the `ansible` role. You typically don't need to call it directly.

## What it does

- Installs `community.general` collection (required for various modules)
- Handles already-installed scenarios gracefully
- Properly detects installation success vs existing installation

## Package manager

ansible-galaxy (Ansible's built-in collection manager)

## Collections Installed

### community.general

The community.general collection provides a wide variety of community-maintained modules and plugins:

- **Package management**: npm, pip, pipx, cargo, etc.
- **System management**: systemd, cron, timezone, etc.
- **Cloud modules**: Various cloud provider integrations
- **Network modules**: HTTP, REST API interactions
- **And many more**: 100+ modules for various tasks

## Why This Role Exists

Many Ansible roles in this repository depend on modules from the `community.general` collection. For example:

- `npm_install` role uses `community.general.npm` module
- Various system management tasks use community modules

Without this collection installed, these roles would fail with errors like:
```
[ERROR]: couldn't resolve module/action 'community.general.npm'
```

## Usage

### Automatic Installation (Recommended)

The `ansible` role automatically includes this as a dependency:

```yaml
# ansible/roles/dev/ansible/meta/main.yml
dependencies:
  - role: pipx
  - role: ansible_collections
```

So when you install Ansible via the playbook, collections are installed automatically:

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags ansible
```

### Manual Installation (If Needed)

If you need to install collections separately:

```yaml
---
- name: Install Ansible collections
  hosts: localhost
  roles:
    - role: ansible_collections
```

### Bootstrap Script

The `bootstrap.sh` script also installs collections as Step 4:

```bash
./bootstrap.sh
```

## Idempotency

The role is fully idempotent:
- Checks if collection is already installed
- Only installs if not present
- Handles "already installed" messages gracefully

## Troubleshooting

### Check installed collections

```bash
ansible-galaxy collection list
```

### Manually install a collection

```bash
ansible-galaxy collection install community.general
```

### Upgrade a collection

```bash
ansible-galaxy collection install --upgrade community.general
```

### Remove a collection

```bash
ansible-galaxy collection uninstall community.general
```

## Related Resources

- [Ansible Galaxy](https://galaxy.ansible.com/) - Browse available collections
- [community.general documentation](https://docs.ansible.com/ansible/latest/collections/community/general/)
- [Using Collections](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html)

## Related Roles

- ansible: Main Ansible installation role (includes this as dependency)
- npm_install: Uses community.general.npm module
