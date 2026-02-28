# Neovim

## Overview

Neovim is a hyper-extensible Vim-based text editor. It aims to enable new applications without compromising Vim's
traditional roles.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/neovim`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/neovim)

## Configuration

Neovim is configured through its initialization file, typically located at `~/.config/nvim/init.vim` or
`~/.config/nvim/init.lua`.

## Usage

Neovim is used for text editing and can be extended with plugins for various functionalities.

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#neovim`) |

## Dependencies

- Nix package manager
