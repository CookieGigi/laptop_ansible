# Changelog

All notable changes to this project.

## [Unreleased]

### Added
- Unified package manager supporting 6 package managers
- Group-based package organization
- Preset system for common configurations
- Conditional package installation (NVIDIA, laptop detection)
- State tracking in YAML

### Changed
- Migrated from role-based to group-based architecture
- Replaced APT-only with multi-package-manager approach

### Removed
- Legacy role-based structure (123 roles)

## Migration Phases

- **Phase 1**: Foundation - Directory structure, playbooks, state tracking
- **Phase 2**: Group Extraction - 11 groups from existing roles
- **Phase 3**: Unified Package Manager - Multi-manager support with conditions
- **Phase 4**: Presets - Configuration collections (In Progress)
- **Phase 5**: Testing & Cleanup - Final validation (Pending)

---

Last updated: 2026-03-01
