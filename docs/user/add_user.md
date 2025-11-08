# Add User

## Overview

This role creates a user with the specified username and groups.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/user/add_user`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/user/add_user)

## Configuration

- **User Creation**: Creates a user with the specified username and groups.

## Usage

This role is used to create user accounts on the system.

## Variables

| Variable | Description |
|----------|-------------|
| `username` | Username to create |
| `usergroups` | Groups to which the user will be added (e.g., `sudo`) |

## Dependencies

- None
