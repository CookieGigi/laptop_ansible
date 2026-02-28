# Quick Start - Daily Automated Updates

## Setup Daily Updates (One-Time)

Run this command to automatically configure daily updates via systemd:

```bash
cd /home/cookiegigi/Project/system_maintain/ansible
ansible-playbook -i inventory.ini playbooks/setup-daily-updates.yml --ask-become-pass
```

**Important:**

- Must be run from the `ansible/` directory (use full path shown above)
- Enter your sudo password when prompted

**What this does:**

- Installs systemd service and timer
- Schedules daily updates at 3 AM
- Enables automatic start on boot
- Shows you the next scheduled run

## What Gets Updated Daily

- **System packages** (APT): All installed packages + security updates
- **NVIDIA drivers**: Graphics drivers and kernel modules
- **Browsers**: Firefox and LibreWolf (configurable)

## Configuration

### Change which Flatpak apps to update

Edit `ansible/group_vars/all.yml`:

```yaml
daily_flatpak_packages:
  - org.mozilla.firefox
  - io.gitlab.librewolf-community
  # Add more Flatpak app IDs here
```

### Change schedule time

Edit `ansible/roles/system/daily_update_setup/defaults/main.yml`:

```yaml
daily_update_setup_time: "03:00:00" # Change to your preferred time
```

Then re-run the setup playbook.

## Manual Operations

### Run updates immediately

```bash
cd ansible
ansible-playbook -i inventory.ini playbooks/update-daily.yml --ask-become-pass
```

### Check timer status

```bash
systemctl status ansible-daily-update.timer
systemctl list-timers ansible-daily-update.timer
```

### View update logs

```bash
sudo journalctl -u ansible-daily-update.service -n 50
```

### Disable automatic updates

```bash
sudo systemctl disable ansible-daily-update.timer
sudo systemctl stop ansible-daily-update.timer
```

### Re-enable automatic updates

```bash
sudo systemctl enable ansible-daily-update.timer
sudo systemctl start ansible-daily-update.timer
```

## Finding Flatpak App IDs

```bash
# List installed apps
flatpak list --app --columns=application,name

# Search for apps
flatpak search <app-name>
```

## Documentation

- Full documentation: [docs/system/daily-updates.md](docs/system/daily-updates.md)
- Firefox setup: [docs/apps/firefox.md](docs/apps/firefox.md)
- LibreWolf setup: [docs/apps/librewolf.md](docs/apps/librewolf.md)

## Troubleshooting

### "Permission denied" error

Make sure you use `--ask-become-pass` flag when running playbooks that need sudo.

### Timer not running

Check status: `systemctl status ansible-daily-update.timer`

### Updates failing

View logs: `sudo journalctl -u ansible-daily-update.service -f`

### Wrong paths in systemd files

The playbook automatically detects the correct ansible directory from where you run it.
Always run from: `/home/cookiegigi/Project/system_maintain/ansible`
