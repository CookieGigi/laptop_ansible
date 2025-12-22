# ExifTool

## Overview

ExifTool is a platform-independent Perl library and command-line application for reading, writing, and editing metadata in image, audio, and video files.

## Installation

- **Method**: APT
- **Package**: libimage-exiftool-perl
- **Command**: `sudo apt install libimage-exiftool-perl`
- **Ansible Role**: [`/ansible/roles/app/exiftool`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/exiftool)

## Configuration

ExifTool is a command-line tool with no persistent configuration files. Configuration is done via command-line arguments.

## Usage

Common commands:

- View all metadata: `exiftool image.jpg`
- View specific tag: `exiftool -DateTimeOriginal image.jpg`
- Edit metadata: `exiftool -Author="Your Name" image.jpg`
- Strip all metadata: `exiftool -all= image.jpg`

## Variables

No Ansible variables are defined for ExifTool.

## Dependencies

- Perl (installed by default on Debian-based systems)
