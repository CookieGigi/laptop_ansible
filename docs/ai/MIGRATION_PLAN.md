# Migration Plan

## Goal

Refactor Ansible project to userspace-oriented with group-based package management.

**Status**: Phase 3 complete, Phase 4 in progress

## Timeline

- Phase 1: Foundation - Week 1 (Complete)
- Phase 2: Group Extraction - Week 2 (Complete)
- Phase 3: Unified Package Manager - Week 3 (Complete)
- Phase 4: Presets - Week 4 (Next)
- Phase 5: Testing & Cleanup - Week 5 (Pending)

## Architecture

See ARCHITECTURE.md for complete structure.

### Key Components

1. **Groups** - YAML definitions in `groups/`
2. **Presets** - Configuration in `presets/`
3. **State** - Tracking in `ansible/inventory/state.yml`
4. **Unified Package Manager** - Role in `ansible/roles/package_manager/unified/`

## Phases Detail

### Phase 1: Foundation (Complete)

- Directory structure created
- State infrastructure implemented
- CLI wrapper (Makefile) created
- Bootstrap playbooks: 00-system-bootstrap.yml, 01-user-bootstrap.yml

### Phase 2: Group Extraction (Complete)

- Audited 123 existing roles
- Created 11 group definitions
- Mapped dependencies between groups
- All package managers categorized

**Groups Created**:
- core, dev-base, dev-rust, dev-python, dev-k8s, dev-lua
- gaming, productivity, creative, web, ai-tools
- system-tools, desktop-config

### Phase 3: Unified Package Manager (Complete)

- Unified role created
- Install/remove capability for all package managers
- Conditional system implemented:
  - NVIDIA GPU detection
  - Laptop detection
  - VM detection
- State tracking integration
- All playbooks pass ansible-lint

### Phase 4: Presets (Next)

- Define preset configurations (minimal, workstation, gaming-rig, laptop, server)
- Create preset resolver engine
- Resolve preset → groups → dependencies
- Track applied preset in state

### Phase 5: Testing & Cleanup (Pending)

- Test all functionality
- Deprecate old playbooks
- Finalize documentation
- Update AGENTS.md

## Testing Checklist

### Bootstrap
- [x] `make bootstrap` installs package managers
- [x] `make setup` configures environment
- [x] State file created and valid

### Groups
- [x] Install `core` group
- [x] Install `dev-rust` group with dependencies
- [x] Remove groups
- [x] Error handling for invalid groups

### Conditionals
- [x] NVIDIA detection works
- [x] Laptop detection works
- [x] VM detection works

### Pending
- [ ] Flatpak remove tested
- [ ] Cargo remove tested
- [ ] NPM remove tested
- [ ] APT remove tested
- [ ] Presets fully tested
- [ ] State backup/restore
- [ ] Rollback functionality

## Design Decisions

### Decision 1: Group Granularity
**Choice**: Medium granularity
- Balance between flexibility and simplicity
- dev-rust includes toolchain + LSP + formatters

### Decision 2: State Location
**Choice**: `ansible/inventory/state.yml`
- Portable, version-controlled
- Add to .gitignore for privacy

### Decision 3: Condition Scope
**Choice**: Global with per-group overrides
- Efficient for system-wide conditions
- Groups can add specific conditions

### Decision 4: Backup Strategy
**Choice**: Automatic before modifications
- Location: `state.yml.backup.<timestamp>`
- Keep last 10 backups
- `make rollback` to restore

## Risk Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Package conflicts | Medium | High | Test isolation; document conflicts |
| State corruption | Low | High | Version state; validate; backup |
| Dependency hell | Medium | Medium | Resolve at plan-time; detect cycles |
| Missing packages | Low | High | Validate against current setup |
| User confusion | Medium | Medium | Clear docs; deprecation warnings |

## Usage (Target)

```bash
# Initial setup
make bootstrap    # Installs Nix, Flatpak, pipx (requires sudo)
make setup       # Configures zsh, alacritty, fonts

# Group management
make install GROUP=dev-rust
make install GROUP=dev-python
make remove GROUP=gaming

# Presets
make preset NAME=workstation
make preset NAME=laptop

# Information
make list           # Available groups
make status         # Installed groups
make presets        # Available presets
```

## Success Criteria

**Must Have**:
- [x] All functionality preserved
- [x] Group install/uninstall working
- [ ] Presets working (Phase 4)
- [x] State tracking accurate
- [x] Make CLI functional

**Should Have**:
- [x] Conditional groups
- [x] Dependency resolution
- [ ] Backup/rollback (Phase 5)
- [ ] Complete documentation

**Nice to Have**:
- [ ] Custom group guide
- [ ] Preset sharing
- [ ] Shell completions

## Next Steps

1. Complete Phase 4 (Presets)
2. Test preset resolver
3. Complete Phase 5 (Testing)
4. Update AGENTS.md
5. Deprecate legacy playbooks

---

**Last Updated**: 2026-02-27
**Current Phase**: 3 complete, ready for Phase 4
