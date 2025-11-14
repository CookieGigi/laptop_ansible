# Daily Automated Updates

## Overview

The daily automated update system keeps your system secure and up-to-date by automatically updating:

- **System packages** (APT) - All installed packages including security updates
- **NVIDIA drivers** - Graphics drivers and kernel modules
- **Flatpak applications** - Configurable list of applications (default: Firefox and LibreWolf)

## Quick Start

### Manual Execution

```bash
# Run daily updates
cd ansible && ansible-playbook -i inventory.ini playbooks/update-daily.yml

# Update only system packages
cd ansible && ansible-playbook -i inventory.ini playbooks/update-daily.yml --tags system

# Update only Flatpak apps
cd ansible && ansible-playbook -i inventory.ini playbooks/update-daily.yml --tags flatpak

# Dry-run (check what would be updated)
cd ansible && ansible-playbook -i inventory.ini playbooks/update-daily.yml --check
```

## Configuration

### Configure Which Flatpak Packages to Update

Edit `ansible/group_vars/all.yml`:

```yaml
# Default: Update only Firefox and LibreWolf
daily_flatpak_packages:
  - org.mozilla.firefox
  - io.gitlab.librewolf-community

# Add more apps as needed
daily_flatpak_packages:
  - org.mozilla.firefox
  - io.gitlab.librewolf-community
  - md.obsidian.Obsidian
  - com.heroicgameslauncher.hgl

# Disable Flatpak updates
daily_flatpak_packages: []
```

### Other Configuration Options

```yaml
daily_flatpak_scope: user # 'user' or 'system'
daily_apt_enabled: true # Enable/disable APT updates
daily_nvidia_enabled: true # Enable/disable NVIDIA driver updates
```

## Automated Execution

### Setup Systemd Timer (Recommended) - Automated via Ansible

The easiest way to set up automated daily updates is using the provided setup playbook:

```bash
cd ansible
ansible-playbook -i inventory.ini playbooks/setup-daily-updates.yml --ask-become-pass
```

**Important:**

- You must run this from the `ansible/` directory
- The `--ask-become-pass` flag prompts for your sudo password
- This is a one-time setup

This will:

- Deploy systemd service and timer files
- Configure the schedule (daily at 3 AM by default)
- Enable and start the timer
- Show you the next scheduled run

**That's it!** Your system will now automatically update daily.

### Manual Systemd Setup (Alternative)

If you prefer to set up systemd manually:

1. **Deploy systemd files:**

```bash
sudo cp ansible/roles/system/daily_update_setup/templates/ansible-daily-update.service.j2 \
        /etc/systemd/system/ansible-daily-update.service

sudo cp ansible/roles/system/daily_update_setup/templates/ansible-daily-update.timer.j2 \
        /etc/systemd/system/ansible-daily-update.timer
```

2. **Edit files to replace template variables** (remove `{{ }}` and use actual values)

3. **Enable and start:**

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now ansible-daily-update.timer
systemctl status ansible-daily-update.timer
```

### Cron Job Setup (Alternative)

Add to root crontab (`sudo crontab -e`):

```cron
# Daily system updates at 3 AM
0 3 * * * cd /home/cookiegigi/Project/system_maintain/ansible && /usr/bin/ansible-playbook -i inventory.ini playbooks/update-daily.yml >> /var/log/ansible-daily-update.log 2>&1
```

### Viewing Logs and Status

```bash
# View timer status
systemctl status ansible-daily-update.timer

# View next scheduled runs
systemctl list-timers ansible-daily-update.timer

# View service logs
sudo journalctl -u ansible-daily-update.service

# Follow logs in real-time
sudo journalctl -u ansible-daily-update.service -f

# View recent runs
sudo journalctl -u ansible-daily-update.service --since today
```

## What Gets Updated

### System-Level (requires sudo)

- All APT packages (alacritty, kdeconnect, curl, git, flatpak, etc.)
- NVIDIA drivers (nvidia-driver, nvidia-kernel-dkms)
- Kernel and system libraries
- Security patches

### User-Space (no sudo)

- Flatpak applications specified in `daily_flatpak_packages`
- Default: Firefox and LibreWolf browsers

### NOT Updated Daily

- Other Flatpak apps (unless added to `daily_flatpak_packages`)
- Nix packages (neovim, lazygit, ripgrep, biome, etc.)
- npm packages (markdownlint, etc.)
- Git submodules (oh-my-zsh, tmux plugins)

## Roles

### apt_update

Updates system packages via APT.

- **Location**: `ansible/roles/system/apt_update/`
- **Tasks**: Update cache, upgrade packages, clean up
- **Requires**: sudo

### flatpak_update

Updates specified Flatpak applications.

- **Location**: `ansible/roles/system/flatpak_update/`
- **Tasks**: Update each configured Flatpak app
- **Requires**: No sudo (for user-space installs)

### system_health_check

Performs post-update health checks.

- **Location**: `ansible/roles/system/system_health_check/`
- **Tasks**: Check disk space, verify packages
- **Requires**: Partial sudo (for dpkg audit)

## Finding Flatpak App IDs

To find Flatpak app IDs for packages you want to add:

```bash
# List all installed Flatpak apps
flatpak list --app --columns=application,name

# Search Flathub for apps
flatpak search <app-name>

# Get info about specific app
flatpak info <app-id>
```

Example output:

```
org.mozilla.firefox              Firefox
io.gitlab.librewolf-community    LibreWolf
md.obsidian.Obsidian             Obsidian
com.heroicgameslauncher.hgl      Heroic Games Launcher
```

## Reboot Detection

The playbook automatically checks if a system reboot is required after updates:

- Checks for `/var/run/reboot-required` file
- Displays warning in output
- Creates `/tmp/ansible-reboot-required.txt` reminder file

To reboot after updates:

```bash
sudo reboot
```

## Troubleshooting

### Check if timer is active

```bash
systemctl status ansible-daily-update.timer
systemctl list-timers --all
```

### View update logs

```bash
# Systemd journal
sudo journalctl -u ansible-daily-update.service -n 100

# If using cron
tail -f /var/log/ansible-daily-update.log
```

### Manually trigger update

```bash
# Via systemd
sudo systemctl start ansible-daily-update.service

# Or run playbook directly
cd ansible && ansible-playbook -i inventory.ini playbooks/update-daily.yml
```

### Disable automatic updates

```bash
# Stop and disable timer
sudo systemctl stop ansible-daily-update.timer
sudo systemctl disable ansible-daily-update.timer

# Or remove systemd files completely
sudo rm /etc/systemd/system/ansible-daily-update.{service,timer}
sudo systemctl daemon-reload
```

### Customize schedule

Edit `ansible/roles/system/daily_update_setup/defaults/main.yml` and change:

```yaml
daily_update_setup_time: "03:00:00" # Change to your preferred time
daily_update_setup_randomize_delay: "30min" # Adjust randomization window
```

Then re-run the setup:

```bash
cd ansible && ansible-playbook -i inventory.ini playbooks/setup-daily-updates.yml
```

## Variables Reference

| Variable                 | Default                | Description                       |
| ------------------------ | ---------------------- | --------------------------------- |
| `daily_flatpak_packages` | `[firefox, librewolf]` | List of Flatpak app IDs to update |
| `daily_flatpak_scope`    | `user`                 | Flatpak scope: `user` or `system` |
| `daily_apt_enabled`      | `true`                 | Enable APT package updates        |
| `daily_nvidia_enabled`   | `true`                 | Enable NVIDIA driver updates      |
| `apt_update_autoremove`  | `true`                 | Remove unused packages            |
| `apt_update_autoclean`   | `true`                 | Clean APT cache                   |
| `flatpak_update_verbose` | `true`                 | Show detailed update info         |

## Security Considerations

- The systemd service runs as root (required for APT updates)
- Flatpak updates run in user-space (no root needed)
- Updates are logged to systemd journal
- Failed updates don't break the system (errors are handled gracefully)
- Reboot is never automatic (manual intervention required)

## Related Documentation

- [APT Package Manager](../package_manager/apt.md)
- [Flatpak](../package_manager/flatpak.md)
- [Firefox](../apps/firefox.md)
- [LibreWolf](../apps/librewolf.md)
