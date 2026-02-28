# Migration Plan: Userspace-First Architecture

**Goal**: Refactor Ansible project to be userspace-oriented with group-based package management.

**Timeline**: 4-5 weeks  
**Complexity**: Medium-High  
**Breaking Change**: Yes

---

## Architecture Overview

### New Directory Structure

```
system_maintain/
├── Makefile                          # CLI interface
├── groups/                            # Package group definitions
│   ├── core.yml
│   ├── dev-base.yml
│   ├── dev-rust.yml
│   ├── dev-python.yml
│   ├── dev-k8s.yml
│   ├── gaming.yml
│   ├── productivity.yml
│   ├── creative.yml
│   └── web.yml
├── presets/                           # Preset configurations
│   ├── minimal.yml
│   ├── workstation.yml
│   ├── gaming-rig.yml
│   ├── laptop.yml
│   └── server.yml
├── ansible/
│   ├── Makefile                       # Ansible-specific targets
│   ├── inventory/
│   │   └── state.yml                  # Installed groups tracking
│   ├── playbooks/
│   │   ├── 00-system-bootstrap.yml    # ROOT: Package managers
│   │   ├── 01-user-bootstrap.yml      # USER: Shell, terminal
│   │   ├── 02-groups.yml              # USER: Group management
│   │   └── legacy/                    # Old playbooks (deprecated)
│   ├── vars/
│   │   ├── groups.yml                 # Group registry
│   │   ├── presets.yml                # Preset registry
│   │   └── conditions.yml             # Conditional rules
│   └── roles/
│       ├── bootstrap/                 # System & user setup
│       ├── groups/                    # Group management logic
│       └── package_manager/
│           └── unified/               # Unified install/remove
└── docs/
    └── migration-guide.md
```

---

## Phase 1: Foundation (Week 1)

### 1.1 Directory Restructure

**Actions:**
- Create `groups/` directory at project root
- Create `presets/` directory at project root
- Move existing playbooks to `ansible/playbooks/legacy/`
- Create new playbook hierarchy: `00-system/`, `01-user/`, `02-groups/`
- Update `ansible.cfg` paths if needed

**Validation:**
- All old playbooks still functional from new location
- New directory structure matches plan

### 1.2 State Infrastructure

**Actions:**
- Create `ansible/inventory/state.yml` template
- Implement state validation tasks
- Add state backup/restore capability

**State Schema:**
```yaml
system:
  bootstrapped: false
  package_managers: {}
user:
  bootstrapped: false
  shell: ""
groups:
  installed: []
  removed: []
conditions: {}
current_preset: ""
```

### 1.3 CLI Wrapper

**Actions:**
- Create root `Makefile` with targets:
  - `bootstrap`: System prerequisites
  - `setup`: User environment
  - `install`: Install groups
  - `remove`: Remove groups
  - `status`: Show installed groups
  - `preset`: Apply presets
- Create `ansible/Makefile` for direct Ansible calls
- Add help system and input validation

**Validation:**
- All Make targets work correctly
- Help text is clear and complete

---

## Phase 2: Group Extraction (Week 2)

### 2.1 Package Inventory

**Actions:**
- Audit all 123 existing roles
- Categorize by installation method:
  - Nix packages (CLI tools, dev tools)
  - Flatpak (GUI applications)
  - Pipx (Python tools)
  - Cargo (Rust tools)
  - NPM (Node.js tools)
  - APT (system packages)
- Document inter-dependencies

**Output:**
- Complete inventory spreadsheet
- Installation method mapping
- Dependency graph

### 2.2 Group Definition

**Actions:**
Extract from existing playbooks:

| Source Playbook | Target Groups |
|----------------|---------------|
| `basic.yml` | `groups/core.yml` |
| `dev.yml` | `groups/dev-base.yml`, `dev-rust.yml`, `dev-python.yml`, `dev-k8s.yml`, `dev-lua.yml` |
| `app.yml` | `groups/gaming.yml`, `productivity.yml`, `creative.yml`, `web.yml` |
| `ai.yml` | `groups/ai-tools.yml` |
| `config.yml` | `groups/desktop-config.yml` |

**Group Schema:**
```yaml
name: "Group Name"
description: "What this group provides"
requires: [list, of, dependencies]

packages:
  nix: []
  flatpak: []
  pipx: []
  cargo: []
  npm: []
  apt: []  # System packages

conditional:
  - when: condition_name
    packages:
      nix: []
      # etc
```

### 2.3 Dependency Mapping

**Actions:**
- Map requires chains:
  - `core` (no deps)
  - `dev-base` -> requires: [core]
  - `dev-rust` -> requires: [core, dev-base]
  - `dev-python` -> requires: [core, dev-base]
  - `gaming` -> requires: [core]
- Detect circular dependencies
- Create dependency resolver

**Validation:**
- Dependency graph has no cycles
- All dependencies resolve to existing groups

---

## Phase 3: Unified Package Manager (Week 3)

### 3.1 Abstract Install Layer

**Actions:**
- Create `unified` role in `roles/package_manager/unified/`
- Implement `tasks/install.yml`:
  - Accept standardized variables
  - Delegate to appropriate package manager
  - Handle errors uniformly
- Standardize variable naming across all package managers

**Supported Managers:**
- nix_install (for nixpkgs packages)
- flatpak_user_install (for Flatpak apps)
- pipx_install (for Python tools)
- cargo (for Rust packages)
- npm_install (for Node.js tools)

### 3.2 Remove Capability

**Actions:**
- Extend each package manager role with remove tasks
- Implement `tasks/remove.yml` in unified role
- Track installed packages in state file
- Add dependency-aware removal (prevent removing if other groups depend on it)

**Remove Strategy:**
- Nix: `nix profile remove <package>`
- Flatpak: `flatpak uninstall --user <app>`
- Pipx: `pipx uninstall <package>`
- Cargo: `cargo uninstall <package>`
- NPM: `npm uninstall -g <package>`

### 3.3 Conditional System

**Actions:**
- Create `vars/conditions.yml` with predefined conditions
- Implement condition evaluator
- Add hardware detection tasks
- Integrate with group definitions

**Predefined Conditions:**
```yaml
conditions:
  has_nvidia:
    check: "ansible_facts['devices']['nvidia'] is defined"
  has_amd_gpu:
    check: "ansible_facts['devices']['amd'] is defined"
  is_laptop:
    check: "ansible_facts['form_factor'] == 'laptop'"
  has_desktop_env:
    check: "ansible_facts['desktop_environment'] is defined"
  is_wayland:
    check: "ansible_facts['desktop_session'] == 'wayland'"
```

---

## Phase 4: Presets (Week 4)

### 4.1 Preset Definition

**Actions:**
Create preset configurations:

**`presets/minimal.yml`:**
- Groups: core
- Description: Bare minimum setup

**`presets/workstation.yml`:**
- Groups: core, dev-base, dev-rust, dev-python, productivity, web
- Description: Full development workstation

**`presets/gaming-rig.yml`:**
- Groups: core, gaming, creative, communication
- Description: Gaming-focused setup

**`presets/laptop.yml`:**
- Groups: core, dev-base, productivity
- Conditions: is_laptop
- Includes laptop-specific packages (TLP, powertop)

**`presets/server.yml`:**
- Groups: core, monitoring, security
- Conditions: has_desktop_env: false
- Description: Headless server

### 4.2 Preset Engine

**Actions:**
- Create preset resolver
- Resolve preset -> groups -> dependencies
- Check conditions before applying
- Track applied preset in state

**Preset Resolution:**
1. Load preset definition
2. Check conditions (skip if not met)
3. Resolve dependencies
4. Remove duplicates
5. Apply in order

---

## Phase 5: Migration & Testing (Week 5)

### 5.1 Parallel Testing

**Actions:**
- Set up test environment
- Install old system, document state
- Install new system, compare
- Verify package parity
- Test install/remove cycles

**Test Scenarios:**
- Fresh install (bootstrap -> setup -> install groups)
- Add groups incrementally
- Remove groups
- Apply presets
- Switch presets

### 5.2 Legacy Deprecation

**Actions:**
- Mark old playbooks as deprecated in comments
- Add deprecation warnings to legacy playbooks
- Create migration guide documentation
- Update README with new usage

### 5.3 Cleanup

**Actions:**
- Remove redundant legacy playbook files
- Archive unused roles (if any)
- Finalize documentation
- Update AGENTS.md with new architecture

---

## Key Design Decisions

### Decision 1: Group Granularity
**Options:**
- Many small groups (dev-rust-lsp, dev-rust-tools, dev-rust-formatters)
- Fewer larger groups (dev-rust with everything)

**Decision:** Medium granularity
- Reason: Balance between flexibility and simplicity
- Example: `dev-rust` includes toolchain + LSP + formatters
- Specialized tools in separate groups (e.g., `wasm-dev`)

### Decision 2: State Location
**Options:**
- In repo: `ansible/inventory/state.yml`
- In user home: `~/.config/system-maintain/state.yml`

**Decision:** In repo (ansible/inventory/state.yml)
- Reason: Portable, version-controlled, survives reinstalls
- Add to .gitignore if user wants it private

### Decision 3: Condition Scope
**Options:**
- Global conditions (evaluated once)
- Per-group conditions (evaluated per group)

**Decision:** Global conditions with per-group overrides
- Reason: Efficiency + flexibility
- Most conditions are system-wide (NVIDIA, laptop)
- Groups can add specific conditions

### Decision 4: Backup Strategy
**Options:**
- No backup (user manages state file)
- Automatic backup before changes
- Git integration for state

**Decision:** Automatic backup before modifications
- Location: `ansible/inventory/state.yml.backup.<timestamp>`
- Keep last 10 backups
- Allow rollback via `make rollback`

---

## Risk Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Package conflicts | Medium | High | Test each group in isolation; document conflicts |
| State corruption | Low | High | Version state file; validate on read; backup before changes |
| Dependency hell | Medium | Medium | Resolve at plan-time; detect cycles; fail fast |
| Missing packages | Low | High | Validate against current setup; audit all packages |
| User confusion | Medium | Medium | Clear documentation; deprecation warnings; help system |

---

## Testing Checklist

### Bootstrap Phase
- [ ] `make bootstrap` installs Nix, Flatpak, pipx
- [ ] `make setup` configures zsh, alacritty, fonts
- [ ] State file created and updated
- [ ] Validation prevents double bootstrap

### Group Management
- [ ] Install `core` group
- [ ] Install `dev-rust` group (tests dependency resolution)
- [ ] Install `gaming` group
- [ ] Remove `gaming` group
- [ ] Attempt to remove `core` while `dev-rust` installed (should fail)

### Conditional Groups
- [ ] Gaming group on NVIDIA system includes mangohud
- [ ] Laptop preset on desktop skips TLP
- [ ] Conditions evaluated correctly

### Presets
- [ ] Apply `minimal` preset
- [ ] Apply `workstation` preset
- [ ] Switch from `gaming-rig` to `workstation`
- [ ] Preset tracked in state

### State Management
- [ ] State file accurately reflects installed groups
- [ ] Backup created before modifications
- [ ] Rollback restores previous state
- [ ] Status command shows correct information

---

## Usage Examples (Target)

```bash
# Initial setup (run once)
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

---

## Documentation Plan

### To Update:
- [ ] README.md - New usage instructions
- [ ] AGENTS.md - Architecture changes
- [ ] docs/ - Create migration-guide.md
- [ ] docs/ - Update existing role docs

### To Create:
- [ ] groups/README.md - How to create custom groups
- [ ] presets/README.md - How to create custom presets
- [ ] docs/troubleshooting.md - Common issues

---

## Success Criteria

**Must Have:**
- [ ] All existing functionality preserved
- [ ] Group install/uninstall working
- [ ] Presets working
- [ ] State tracking accurate
- [ ] Make CLI functional

**Should Have:**
- [ ] Conditional groups working
- [ ] Dependency resolution
- [ ] Backup/rollback
- [ ] Complete documentation

**Nice to Have:**
- [ ] Custom group creation guide
- [ ] Preset sharing mechanism
- [ ] Shell completions

---

## Notes

- Keep existing roles untouched during migration
- New architecture sits alongside until complete
- Test thoroughly before deprecating old playbooks
- Consider user feedback during Phase 5

---

**Created**: 2026-02-22  
**Status**: Ready for implementation  
**Next Step**: Await approval to begin Phase 1
