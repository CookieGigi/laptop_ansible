# Add Main User

## Overview

This role creates the main user and adds an SSH key for that user.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/user/add_main_user`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/user/add_main_user)

## Configuration

- **User Creation**: Creates the main user with sudo privileges.
- **SSH Key**: Adds an SSH key for the main user.

## Usage

This role is used to set up the main user account on the system.

## Variables

| Variable | Description |
|----------|-------------|
| `ansible_user` | Username of the main user |

## Dependencies

- `add_user` role
- `add_ssh_key` role
