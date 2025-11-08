# jq

## Overview

jq is a lightweight and flexible command-line JSON processor. It's like sed for JSON data, allowing you to slice, filter, map, and transform structured data.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/jq`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/jq)

## Configuration

jq is primarily used via command-line with no persistent configuration needed.

## Usage

jq is used for parsing and manipulating JSON data. Common commands:
- `cat file.json | jq '.'` - Pretty-print JSON
- `jq '.key' file.json` - Extract value by key
- `jq '.[] | select(.name == "foo")' file.json` - Filter arrays

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#jq`) |

## Dependencies

- Nix package manager
