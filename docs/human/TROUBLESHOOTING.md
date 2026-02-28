# Troubleshooting

Common issues and solutions.

## Installation Issues

### "GROUP is not set" error
**Problem**: Forgot to specify GROUP parameter
**Solution**: Use `make install GROUP=<name>` not just `make install`

### Permission denied during bootstrap
**Problem**: bootstrap requires sudo privileges
**Solution**: Run `make bootstrap` and enter password when prompted

### Package not found
**Problem**: Package name changed or unavailable
**Solution**: Check the group YAML file and verify package names for your distro

## Ansible Issues

### "command not found: ansible-playbook"
**Problem**: Ansible not installed
**Solution**: Run `make bootstrap` first to install dependencies

### Syntax errors
**Problem**: Invalid YAML in group definition
**Solution**: Run `make syntax-check` to validate before installing

## State Issues

### State file missing
**Problem**: `ansible/inventory/state.yml` does not exist
**Solution**: Run `make bootstrap` to initialize state tracking

### Groups show as not installed
**Problem**: State tracking out of sync
**Solution**: Check `make status` and manually edit `ansible/inventory/state.yml`

## Conditional Detection

### NVIDIA packages not installing
**Problem**: NVIDIA GPU not detected
**Solution**: Check `ansible/inventory/state.yml` for `has_nvidia_gpu: true`

### Laptop power management missing
**Problem**: Laptop not detected
**Solution**: Verify `ansible/inventory/state.yml` has `is_laptop: true`

## Getting Help

1. Check `make status` output
2. Review `ansible/inventory/state.yml` for system detection
3. Run with `--verbose` flag: `cd ansible && ansible-playbook -v playbooks/02-groups.yml -e "group_action=install group=<name>"`
4. Check Ansible logs in `~/.ansible/log/`
