# Stow

## Overview

GNU Stow is a symlink farm manager which takes separate packages of software and/or data located in separate directories
on the filesystem, and makes them appear to be installed in a single directory.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/terminal/stow`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/terminal/stow)

## Configuration

- **Installation**: Installs Stow using the `nix_install` role.

## Usage

Stow is used to manage symlinks for packages and dotfiles.

## Variables

No specific variables are required for this role.

## Dependencies

- Nix package manager
