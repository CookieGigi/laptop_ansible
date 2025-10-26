# System Maintain Ansible Project - Agent Guidelines

## Build/Lint/Test Commands
- **Ansible Lint**: `ansible-lint` (run in project root)
- **Syntax Check**: `ansible-playbook --syntax-check playbooks/<playbook>.yml`
- **Run Playbook**: `ansible-playbook -i inventory.ini playbooks/<playbook>.yml`
- **Test Role**: `ansible-playbook -i inventory.ini playbooks/test.yml --tags <role_name>`

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
- **Documentation**: Include purpose comments for complex playbooks/roles
- **Variable Naming**: snake_case for variables, UPPER_CASE for constants

## Ansible Specifics
- Role structure follows Ansible Galaxy standards
- Use `tags` for logical task grouping
- Template files use `.j2` extension
- Inventory managed via `inventory.ini`