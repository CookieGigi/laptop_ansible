# Group Reorganization Summary

## Changes Made Based on User Feedback

### Package Moves

| Package | From | To |
|---------|------|-----|
| neovim | core | dev-base |
| lazygit | core | dev-base |
| gh | core | dev-base |
| ansible-lint | dev-base | dev-base (kept) |
| ansible | dev-base | dev-base (kept) |
| tlp | system-tools | core |
| tlp-rdw | system-tools | core |
| kdeconnect | productivity | desktop-config |

### Duplicates Removed

| Duplicate | Resolution |
|-----------|------------|
| sqlite + sqlite3 | Kept only sqlite (nix) |
| lua5_1 + lua5.1 | Kept only lua5_1 (nix), removed apt lua5.1 |
| basedpyright | Removed from dev-base npm (kept in dev-python) |
| docker.io + docker | Kept only docker (nix), docker.io only in docker group via apt |

### Groups Reorganized

#### Split from dev-k8s:
- **docker** - Docker platform (separate group)
- **podman** - Podman platform (separate group)
- **minikube** - Minikube local k8s (separate group)
- **k3d** - k3d lightweight k8s (separate group, requires docker)
- **terraform** - Terraform tools (separate group)
- **dev-k8s** - Now only kubectl and helm

#### Split from productivity:
- **obsidian** - Individual Obsidian group
- **proton** - Individual Proton Pass group
- **productivity** - Now a meta group that requires obsidian + proton

#### Split from creative:
- **darktable** - Individual Darktable group
- **inkscape** - Individual Inkscape group
- **creative** - Now a meta group that requires darktable + inkscape

#### Split from ai-tools:
- **gemini** - Individual Gemini CLI group
- **ai-tools** - Now only opencode-ai

#### Merged:
- **dev-lua** → merged into **dev-base**
  - Lua tools now part of dev-base (lua5_1, lua-language-server, luarocks)

### Package Name Fixes

| Old Name | New Name |
|----------|----------|
| md.obsidian.Obsidian | md.obsidian.obsidian |
| me.proton.Pass | me.proton.pass |
| org.darktable.Darktable | org.darktable.DarkTable |
| org.inkscape.Inkscape | org.inkscape.InkScape |
| @google/gemini-cli | gemini-cli |
| libimage-exiftool-perl | **REMOVED** |
| @context7/mcp-server | **REMOVED** (merged with ai-tools) |

### Configuration Roles

| Role | Group |
|------|-------|
| tmux_config | core |
| kde_config | desktop-config |

## Current Group Structure

### 23 Total Groups

**Core (1):**
- core - Essential CLI tools, tlp, tmux_config

**Development (3):**
- dev-base - Editors, Git, linters, LSPs, Lua tools
- dev-rust - Rust toolchain
- dev-python - Python tools

**Infrastructure (6):**
- dev-k8s - kubectl, helm
- docker - Docker platform
- podman - Podman platform
- minikube - Minikube local cluster
- k3d - k3d lightweight Kubernetes
- terraform - Terraform toolchain

**Gaming (1):**
- gaming - Steam, Heroic Launcher

**Individual Applications (6):**
- obsidian - Obsidian note-taking
- proton - Proton Pass password manager
- darktable - Darktable photo editor
- inkscape - Inkscape vector graphics
- gemini - Google Gemini CLI
- web - Firefox, LibreWolf, Chromium browsers

**Meta Groups (2):**
- productivity - Installs obsidian + proton
- creative - Installs darktable + inkscape

**AI (1):**
- ai-tools - opencode-ai

**System (2):**
- system-tools - System monitoring
- desktop-config - KDE Connect, dotfiles

## Dependency Chain

```
core (foundation)
  ├── dev-base (requires core)
  │   ├── dev-rust (requires dev-base)
  │   ├── dev-python (requires dev-base)
  │   ├── dev-k8s (requires dev-base)
  │   ├── ai-tools (requires dev-base)
  │   ├── gemini (requires dev-base)
  │   ├── minikube (requires dev-base)
  │   └── terraform (requires dev-base)
  ├── docker (requires core)
  │   └── k3d (requires docker)
  ├── podman (requires core)
  ├── gaming (requires core)
  ├── obsidian (requires core)
  ├── proton (requires core)
  │   └── productivity (requires obsidian + proton)
  ├── darktable (requires core)
  ├── inkscape (requires core)
  │   └── creative (requires darktable + inkscape)
  ├── web (requires core)
  ├── system-tools (requires core)
  └── desktop-config (requires core)
```

## Usage Examples

Install individual apps:
```bash
make install GROUP=obsidian
make install GROUP=proton
make install GROUP=darktable
make install GROUP=gemini
```

Install collections:
```bash
make install GROUP=productivity    # Installs obsidian + proton
make install GROUP=creative        # Installs darktable + inkscape
```

## Notes

- **mangohud** is a new conditional package for NVIDIA systems in the gaming group
- All Flatpak package names now use correct casing
- Duplicates have been eliminated
- Each tool category has its own focused group
- Meta groups (productivity, creative) allow installing multiple related apps at once
