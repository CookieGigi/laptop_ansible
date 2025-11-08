# Add SSH Key

## Overview

This role ensures the `.ssh` directory exists and generates an SSH key for the specified user.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/user/add_ssh_key`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/user/add_ssh_key)

## Configuration

- **SSH Directory**: Ensures the `.ssh` directory exists with the correct permissions.
- **SSH Key Generation**: Generates an RSA SSH key for the user.

## Usage

This role is used to set up SSH keys for secure access to the system.

## Variables

| Variable | Description |
|----------|-------------|
| `username` | Username for which the SSH key is generated |

## Dependencies

- None
