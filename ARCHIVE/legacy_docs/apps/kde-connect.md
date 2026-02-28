# KDE Connect

## Overview

KDE Connect is a tool that allows devices to communicate and share content, such as notifications, files, and clipboard
data, between a computer and a phone.

## Installation

- **Method**: APT
- **Command**: `sudo apt install kdeconnect`
- **Ansible Role**: [`/ansible/roles/app/kde-connect`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/kde-connect)

## Configuration

- **Main Config Path**: `~/.config/kdeconnect/`
- **Files**:
  - `kdeconnect.conf`: Main configuration file for KDE Connect

## Usage

KDE Connect is used to sync notifications, files, and clipboard data between the system and mobile devices.

## Variables

No specific Ansible variables are defined for KDE Connect.

## Dependencies

- KDE Plasma (recommended)
