# yq

## Overview

yq is a lightweight and portable command-line YAML processor. It's particularly useful for this Ansible project where
YAML files are prevalent. Works similarly to jq but for YAML/XML/TOML formats.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/yq`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/yq)

## Configuration

yq is primarily used via command-line with no persistent configuration needed.

## Usage

yq is used for parsing and manipulating YAML data. Common commands:

- `yq eval '.' file.yml` - Pretty-print YAML
- `yq eval '.roles[0]' playbook.yml` - Extract specific value
- `yq eval '.roles[] | select(.name == "foo")' file.yml` - Filter arrays

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#yq-go`) |

## Dependencies

- Nix package manager
