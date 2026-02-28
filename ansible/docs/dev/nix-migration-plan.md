# Migration Plan: Moving Nix Store to Home Directory

## Problem
The system root partition (`/`) is full (98% usage), causing Nix builds to fail with "no space left on device". The home partition (`/home`) has plenty of space (280GB available).

## Objective
Relocate the Nix store (`/nix`) to the home directory while maintaining compatibility with official binary caches.

## Strategy: Bind Mount
Nix requires the store to be at `/nix` to use pre-compiled binaries. We will use a **bind mount** to map a directory in the home partition to the `/nix` path at the root.

---

## Phase 1: Bootstrap & Cleanup
Before running the updated bootstrap, we must clear the existing failed installation to free up space on the root partition.

### 1. Manual Cleanup (Free Space)
```bash
sudo rm -rf /nix/*
rm -rf ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
```

### 2. Update `bootstrap.sh`
Modify the Nix installation section to:
- Create the storage directory in `$HOME`.
- Create the `/nix` mount point.
- Bind mount the storage to `/nix`.

### 3. Bootstrap Implementation Logic
```bash
    # Ensure nix storage directory exists in home
    mkdir -p "$HOME/.local/share/nix"

    # Ensure /nix directory exists and is mounted
    if [ ! -d /nix ]; then
        echo "Creating /nix directory (requires sudo)..."
        sudo mkdir -p /nix
        sudo chown -R "$(whoami)" /nix
    fi

    if ! mountpoint -q /nix; then
        echo "Mounting /nix to $HOME/.local/share/nix (requires sudo)..."
        sudo mount --bind "$HOME/.local/share/nix" /nix
    fi
```

---

## Phase 2: Ansible Implementation
We will update the `roles/package_manager/nix` role to automate the storage setup.

### 1. Update `roles/package_manager/nix/tasks/main.yml`
Add tasks to:
- Create `~/.local/share/nix` as the physical storage location.
- Create `/nix` as the mount point.
- Use the `ansible.posix.mount` module to bind mount the two.

### 2. Implementation Steps
```yaml
- name: Ensure nix storage directory exists in home
  ansible.builtin.file:
    path: "{{ lookup('env', 'HOME') }}/.local/share/nix"
    state: directory
    mode: '0755'

- name: Ensure /nix mount point exists
  become: true
  ansible.builtin.file:
    path: /nix
    state: directory
    mode: '0755'
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"

- name: Bind mount home nix directory to /nix
  become: true
  ansible.posix.mount:
    path: /nix
    src: "{{ lookup('env', 'HOME') }}/.local/share/nix"
    fstype: none
    opts: bind
    state: mounted
```

---

## Phase 3: Verification
1. **Run the playbook:**
   ```bash
   ansible-playbook playbooks/dev.yml --tags nix
   ```
2. **Verify mount:**
   ```bash
   mount | grep /nix
   # Should show: /home/cookiegigi/.local/share/nix on /nix type none (rw,bind,...)
   ```
3. **Check disk space:**
   ```bash
   df -h /nix
   # Should now reflect the size and availability of the /home partition.
   ```

## Why not just move it to `~/nix`?
Moving it to a non-standard path breaks binary caches. Nix hashes are calculated based on the absolute path `/nix/store/...`. If moved, every package would need to be rebuilt from source, which would again fill up temporary space and take hours/days.
