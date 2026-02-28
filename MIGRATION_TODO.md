# Migration Todo List

## Completed ✅
- [x] Analyze existing Ansible project (123 roles)
- [x] Design new userspace-oriented architecture
- [x] Write migration plan to `docs/ai/MIGRATION_PLAN.md`
- [x] Move old docs to `legacy_docs/`

## Phase 1: Foundation ✅
- [x] Create directory structure (`groups/`, `presets/`)
- [x] Create `ansible/inventory/state.yml` template
- [x] Create root `Makefile` CLI wrapper
- [x] Create `ansible/playbooks/00-system-bootstrap.yml`
- [x] Create `ansible/playbooks/01-user-bootstrap.yml`
- [x] Create `ansible/playbooks/02-groups.yml`
- [x] Create example group `groups/dev-rust.yml`
- [x] All playbooks pass ansible-lint

## Phase 2: Group Extraction ✅
- [x] Audit existing roles and categorize by install method
- [x] Extract groups from existing playbooks
- [x] Map dependencies between groups
- [x] Create 11 group definitions with full package mappings
  - core, dev-base, dev-rust, dev-python, dev-k8s, dev-lua
  - gaming, productivity, creative, web, ai-tools
  - system-tools, desktop-config
- [x] Document groups in groups/README.md

## Phase 3: Unified Package Manager ✅
- [x] Create `unified` role with install capability
- [x] Add remove capability to package managers
- [x] Implement conditional system
  - [x] NVIDIA GPU detection
  - [x] Laptop detection (battery check)
  - [x] VM detection
- [x] State tracking integration

## Phase 4: Presets (In Progress)
- [ ] Define preset configurations
- [ ] Create preset resolver/engine

## Phase 5: Testing & Cleanup (Pending)
- [ ] Test all functionality
- [ ] Deprecate old playbooks
- [ ] Finalize documentation

---

## Architecture Summary

**Goal**: Userspace-first with group-based package management

**Target Usage**:
```bash
make bootstrap    # ROOT: Install package managers (once)
make setup        # USER: Shell, terminal, fonts (once)
make install GROUP=dev-rust   # Install groups
make remove GROUP=gaming      # Remove groups
make preset NAME=workstation  # Apply presets
```

**Key Features**:
- Group uninstall support
- YAML state tracking
- Conditional groups (NVIDIA, laptop detection)
- Presets (workstation, gaming-rig, laptop, minimal, server)
- Make-based CLI interface

---

**Last Updated**: 2026-02-27
**Status**: Phase 3 complete, ready to begin Phase 4
