# hadolint

## Overview

hadolint is a Dockerfile linter that helps you build best practice Docker images. It validates Dockerfiles against a set of rules and provides suggestions for improvements.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/hadolint`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/hadolint)

## Configuration

Configure via `.hadolint.yaml` or inline ignore comments in Dockerfiles. Customize rules, trusted registries, and ignore patterns.

## Usage

hadolint is used for linting Dockerfiles. Common commands:
- `hadolint Dockerfile` - Lint a Dockerfile
- `hadolint --ignore DL3006 Dockerfile` - Ignore specific rules
- `hadolint --format json Dockerfile` - Output as JSON
- `find . -name Dockerfile -exec hadolint {} \;` - Lint all Dockerfiles

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#hadolint`) |

## Dependencies

- Nix package manager
