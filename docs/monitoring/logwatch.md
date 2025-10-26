# Logwatch

## Overview

Logwatch is a customizable log analysis system that parses through your system's logs and creates a report analyzing areas that you specify. This role automates the installation and configuration of Logwatch.

## Installation

- **Method**: APT
- **Role Path**: [`/ansible/roles/monitoring/logwatch`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/monitoring/logwatch)

## Configuration

- **User and Group**: Creates a dedicated `logwatch` user and group.
- **Directories**: Sets up configuration and report directories with appropriate permissions.
- **Systemd Services**: Configures and enables a systemd timer to run Logwatch daily at 8 PM.

## Usage

Logwatch is used to monitor and analyze system logs, providing daily reports for system administrators.

## Variables

| Variable | Description |
|----------|-------------|
| `logwatch_user` | User for Logwatch (`logwatch`) |
| `logwatch_group` | Group for Logwatch (`logwatch`) |
| `logwatch_home` | Home directory for Logwatch user (`/home/logwatch`) |
| `logwatch_config_dir` | Configuration directory for Logwatch (`/home/logwatch/.config/logwatch`) |
| `logwatch_output_dir` | Output directory for Logwatch reports (`/home/logwatch/reports`) |
| `logwatch_timer_schedule` | Schedule for Logwatch timer (`*-*-* 20:00:00`) |

## Dependencies

- APT package manager
- Systemd