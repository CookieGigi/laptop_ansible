# darktable

Open-source photography workflow application and raw developer.

## Installation

darktable is installed via Flatpak in user space.

## Usage

After installation, launch darktable using:

```bash
darktable
```

Or use the application launcher from your desktop environment.

## Features

- Non-destructive raw image editing
- Professional color management
- Wide range of image processing modules
- GPU-accelerated processing
- Support for most camera raw formats

## Configuration

Flatpak installation path: `~/.var/app/org.darktable.Darktable/`

## Manual Installation

To install manually:

```bash
cd ansible
ansible-playbook playbooks/app.yml --tags darktable
```
