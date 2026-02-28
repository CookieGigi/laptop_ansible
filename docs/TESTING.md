# Phase 3 Testing Checklist

## Unified Package Manager Role Testing

**Location**: `/home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/unified/`

---

## Package Manager Installation Tests

### 1. Nix Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-rust"
# or
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core"
```
- [x] Install completes without errors
- [x] Packages are available in PATH after install
- [x] Verify: `which rustc`, `which cargo`, `which ripgrep`

### 2. Flatpak Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=productivity"
```
- [x] Flatpak packages install successfully
- [x] Apps appear in desktop environment

### 3. Cargo Packages
```bash
# First install dev-rust group (provides cargo)
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-rust"
# Then verify cargo plugins
cargo install --list | grep cargo-watch
```
- [x] Cargo plugins install after rust toolchain
- [x] cargo-watch, cargo-edit, etc. available

### 4. NPM Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=web"
```
- [x] Global npm packages install
- [x] Verify: `npm list -g --depth=0`

### 5. APT Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core" --ask-become-pass
```
- [x] APT packages install with sudo
- [x] No password prompts after --ask-become-pass
- [x] Cache is updated before install

---

## Remove/Uninstall Tests

### 6. Remove Nix Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=dev-rust"
```
- [x] Packages are removed from nix profile
- [ ] Verify: `nix profile list` shows packages removed

### 7. Remove Flatpak Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=productivity"
```
- [ ] Flatpak packages uninstalled
- [ ] Verify: `flatpak list`

### 8. Remove Cargo Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=dev-rust"
```
- [ ] Cargo plugins removed
- [ ] Verify: `cargo install --list`

### 9. Remove NPM Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=web"
```
- [ ] Global npm packages removed
- [ ] Verify: `npm list -g --depth=0`

### 10. Remove APT Packages
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=remove group=core" --ask-become-pass
```
- [ ] APT packages removed
- [ ] Verify: `dpkg -l | grep <package>`

---

## Conditional System Tests

### 11. NVIDIA GPU Detection
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-ml" --check
```
- [ ] Detects NVIDIA GPU: Check task "Set NVIDIA detected fact"
- [ ] If NVIDIA: Installs CUDA toolkit and GPU-enabled PyTorch/TensorFlow
- [ ] If no NVIDIA: Installs CPU-only versions
- [ ] Verify detection: `lspci | grep -i nvidia`

### 12. Laptop Detection
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-ml" --check
```
- [ ] Detects laptop via battery: Check task "Set laptop detected fact"
- [ ] If laptop: Installs powertop, tlp
- [ ] If desktop: Skips laptop packages
- [ ] Verify: `ls /sys/class/power_supply/BAT0`

### 13. VM Detection
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-ml" --check
```
- [ ] Detects VM: Check task "Set VM detected fact"
- [ ] VM-specific conditionals applied

---

## State Tracking Tests

### 14. State File Updates
```bash
# Check state file after install
cat ansible/inventory/state.yml
```
- [ ] Group added to `installed_groups` after install
- [ ] Group removed from `installed_groups` after remove
- [ ] `last_action` and `last_group` updated
- [ ] Timestamp recorded
- [ ] File is valid YAML

### 15. Multiple Group Tracking
```bash
# Install multiple groups
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core"
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-rust"
cat ansible/inventory/state.yml
```
- [ ] Both groups appear in `installed_groups`
- [ ] No duplicates in list

---

## Error Handling Tests

### 16. Non-existent Group
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=nonexistent"
```
- [ ] Playbook fails gracefully
- [ ] Clear error message: "Group 'nonexistent' not found"

### 17. Invalid Action
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=invalid group=core"
```
- [ ] Playbook fails with validation error
- [ ] Message: "group_action must be either 'install' or 'remove'"

### 18. Missing Package
```bash
# Temporarily add non-existent package to a group, then test
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=test"
```
- [ ] Error handled gracefully
- [ ] Playbook stops or skips (not crashes)

---

## Multi-Package Manager Tests

### 19. Group with Multiple Package Managers
```bash
# Test a group that has packages in multiple formats
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=dev-base"
```
- [ ] Nix packages install
- [ ] Flatpak packages install (if any)
- [ ] APT packages install (if any)
- [ ] All package types handled correctly

### 20. Install Order
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core" -vv
```
- [ ] Nix installed first
- [ ] Then flatpak, cargo, npm, pipx, apt
- [ ] No conflicts between package managers

---

## Check Mode Tests

### 21. Dry Run
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core" --check
```
- [ ] Playbook runs without making changes
- [ ] Shows what would be installed
- [ ] No errors in check mode

### 22. Diff Mode
```bash
cd ansible && ansible-playbook playbooks/02-groups.yml -e "group_action=install group=core" --check --diff
```
- [ ] Shows differences clearly
- [ ] Useful for reviewing changes

---

## Lint and Validation

### 23. Ansible Lint
```bash
cd ansible && ansible-lint roles/package_manager/unified/
cd ansible && ansible-lint playbooks/02-groups.yml
```
- [ ] All files pass ansible-lint
- [ ] No syntax errors
- [ ] No deprecation warnings (except unavoidable)

### 24. Syntax Check
```bash
cd ansible && ansible-playbook --syntax-check playbooks/02-groups.yml
```
- [ ] Playbook syntax is valid

---

## Known Issues / Limitations

1. **tlp-rdw** removed from core group - not available in nixpkgs
2. **Nix command deprecation**: Uses `nix profile add` instead of deprecated `nix profile install`
3. **Sudo required** for APT operations only
4. **Fact syntax**: Updated to `ansible_facts['env']['PATH']` format for Ansible 2.24 compatibility

---

## Test Results Log

| Test | Date | Result | Notes |
|------|------|--------|-------|
| Nix install (dev-rust) | | | |
| Nix install (core) | | | |
| Flatpak install | | | |
| Cargo install | | | |
| NPM install | | | |
| APT install | | | |
| Remove tests | | | |
| Conditional detection | | | |
| State tracking | | | |
| Error handling | | | |

---

**Last Updated**: 2026-02-27
**Phase**: 3 (Unified Package Manager)
**Status**: Ready for testing
