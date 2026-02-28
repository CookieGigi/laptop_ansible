# System Maintain - User-friendly CLI wrapper for Ansible
# Usage:
#   make bootstrap           # ROOT: Install package managers (once)
#   make setup               # USER: Shell, terminal, fonts (once)
#   make install GROUP=<name> # Install a group
#   make remove GROUP=<name>  # Remove a group
#   make preset NAME=<name>   # Apply a preset
#   make list                 # List available groups
#   make status               # Show current state

.PHONY: help bootstrap setup install remove preset list status lint syntax-check diff

# Default target
help:
	@echo "System Maintain - Package Management Made Easy"
	@echo ""
	@echo "Available commands:"
	@echo "  make bootstrap           - System bootstrap, asks for sudo password (run once)"
	@echo "  make setup               - USER: Setup shell, terminal, fonts (run once)"
	@echo "  make install GROUP=<name> - Install a package group"
	@echo "  make remove GROUP=<name>  - Remove a package group"
	@echo "  make preset NAME=<name>   - Apply a preset configuration"
  @echo "  make list                 - List available groups"
  @echo "  make status               - Show current system state"
  @echo "  make lint                 - Run ansible-lint on all playbooks"
  @echo "  make syntax-check         - Check syntax of all playbooks"
  @echo "  make diff GROUP=<name>    - Show changes for a group (dry-run)"

# System bootstrap (asks for sudo password when needed)
bootstrap:
	@echo "Running system bootstrap..."
	@cd ansible && ansible-playbook playbooks/00-system-bootstrap.yml --ask-become-pass

# User bootstrap (user-level setup)
setup:
	@echo "Running user bootstrap..."
	@cd ansible && ansible-playbook playbooks/01-user-bootstrap.yml

# Install a group
install:
ifndef GROUP
	$(error GROUP is not set. Usage: make install GROUP=<name>)
endif
	@echo "Installing group: $(GROUP)"
	@cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=$(GROUP)"

# Remove a group
remove:
ifndef GROUP
	$(error GROUP is not set. Usage: make remove GROUP=<name>)
endif
	@echo "Removing group: $(GROUP)"
	@cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=$(GROUP)"

# Apply a preset
preset:
ifndef NAME
	$(error NAME is not set. Usage: make preset NAME=<name>)
endif
	@echo "Applying preset: $(NAME)"
	@cd ansible && ansible-playbook playbooks/03-presets.yml -e "preset=$(NAME)"

# List available groups
list:
	@echo "Available groups:"
	@ls -1 groups/ 2>/dev/null || echo "  (No groups defined yet)"

# Show current state
status:
	@echo "Current system state:"
	@cat ansible/inventory/state.yml

# Run ansible-lint on all playbooks
lint:
	@echo "Running ansible-lint..."
	@cd ansible && ansible-lint

# Check syntax of all playbooks
syntax-check:
	@echo "Checking syntax..."
	@cd ansible && ansible-playbook --syntax-check playbooks/*.yml

# Show changes for a group (dry-run)
diff:
ifndef GROUP
	$(error GROUP is not set. Usage: make diff GROUP=<name>)
endif
	@echo "Showing changes for group: $(GROUP)"
	@cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=$(GROUP)" --check --diff
