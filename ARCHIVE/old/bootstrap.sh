#!/usr/bin/env bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "===================================================================="
echo "  Ansible Bootstrap Installer"
echo "  Installing: Nix → pipx → Ansible → Collections"
echo "===================================================================="
echo ""

# Step 1: Install Nix
echo -e "${YELLOW}[1/4] Checking Nix installation...${NC}"
if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    echo -e "${GREEN}✓ Nix already installed${NC}"
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo "Installing Nix (single-user, no daemon)..."

    # Ensure nix storage directory exists in home
    mkdir -p "$HOME/.local/share/nix"

    # Ensure /nix directory exists with correct permissions
    if [ ! -d /nix ]; then
        echo "Creating /nix directory (requires sudo)..."
        sudo mkdir -p /nix
        sudo chown -R "$(whoami)" /nix
    fi

    # Bind mount home nix directory to /nix if not already mounted
    if ! mountpoint -q /nix; then
        echo "Mounting /nix to $HOME/.local/share/nix (requires sudo)..."
        sudo mount --bind "$HOME/.local/share/nix" /nix
    fi

    # Install Nix
    sh <(curl -L https://nixos.org/nix/install) --no-daemon

    # Source Nix
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"

    echo -e "${GREEN}✓ Nix installed successfully${NC}"
fi
echo ""

# Step 2: Install pipx via Nix
echo -e "${YELLOW}[2/4] Checking pipx installation...${NC}"
if command -v pipx >/dev/null 2>&1; then
    echo -e "${GREEN}✓ pipx already installed${NC}"
else
    echo "Installing pipx via Nix..."
    if nix profile list 2>/dev/null | grep -q "pipx"; then
        echo -e "${GREEN}✓ pipx already in Nix profile${NC}"
    else
        nix profile install nixpkgs#pipx
    fi

    # Ensure pipx path
    pipx ensurepath --force 2>/dev/null || true

    echo -e "${GREEN}✓ pipx installed successfully${NC}"
fi
echo ""

# Step 3: Install Ansible with Kubernetes/OpenShift support via pipx
echo -e "${YELLOW}[3/4] Checking Ansible installation...${NC}"
if pipx list --short | grep -q "ansible"; then
    echo -e "${GREEN}✓ Ansible already installed via pipx${NC}"

    # Check for injected packages
    echo "Checking injected packages..."
    NEEDS_INJECT=false

    if ! pipx list --json | python3 -c "import sys, json; venvs = json.load(sys.stdin).get('venvs', {}); injected = venvs.get('ansible', {}).get('metadata', {}).get('injected_packages', {}); exit(0 if 'kubernetes' in injected else 1)" 2>/dev/null; then
        echo "  - kubernetes library needs to be injected"
        NEEDS_INJECT=true
    fi

    if ! pipx list --json | python3 -c "import sys, json; venvs = json.load(sys.stdin).get('venvs', {}); injected = venvs.get('ansible', {}).get('metadata', {}).get('injected_packages', {}); exit(0 if 'openshift' in injected else 1)" 2>/dev/null; then
        echo "  - openshift library needs to be injected"
        NEEDS_INJECT=true
    fi

    if [ "$NEEDS_INJECT" = true ]; then
        echo "Injecting missing packages..."
        pipx inject ansible "kubernetes>=12.0.0" 2>/dev/null || echo "  - kubernetes already injected or failed"
        pipx inject ansible "openshift>=0.12.0" 2>/dev/null || echo "  - openshift already injected or failed"
        echo -e "${GREEN}✓ Packages injected${NC}"
    else
        echo -e "${GREEN}✓ All packages already injected${NC}"
    fi
else
    echo "Installing Ansible via pipx..."
    pipx install "ansible>=2.9"

    echo "Injecting kubernetes and openshift libraries..."
    pipx inject ansible "kubernetes>=12.0.0"
    pipx inject ansible "openshift>=0.12.0"

    echo -e "${GREEN}✓ Ansible installed successfully${NC}"
fi

# Ensure ansible commands are available in PATH
ANSIBLE_VENV_BIN="$HOME/.local/share/pipx/venvs/ansible/bin"
if [ -d "$ANSIBLE_VENV_BIN" ]; then
    echo "Ensuring ansible commands are available..."
    COMMANDS_LINKED=false
    for cmd in ansible ansible-playbook ansible-galaxy ansible-inventory ansible-vault ansible-doc ansible-config ansible-console ansible-pull; do
        if [ -f "$ANSIBLE_VENV_BIN/$cmd" ]; then
            if [ ! -f "$HOME/.local/bin/$cmd" ]; then
                ln -s "$ANSIBLE_VENV_BIN/$cmd" "$HOME/.local/bin/$cmd" 2>/dev/null || true
                COMMANDS_LINKED=true
            elif [ "$(readlink "$HOME/.local/bin/$cmd")" != "$ANSIBLE_VENV_BIN/$cmd" ]; then
                # Fix broken symlink
                rm -f "$HOME/.local/bin/$cmd" 2>/dev/null || true
                ln -s "$ANSIBLE_VENV_BIN/$cmd" "$HOME/.local/bin/$cmd" 2>/dev/null || true
                COMMANDS_LINKED=true
            fi
        fi
    done
    if [ "$COMMANDS_LINKED" = true ]; then
        echo -e "${GREEN}✓ Ansible commands linked${NC}"
    else
        echo -e "${GREEN}✓ Ansible commands already linked${NC}"
    fi
fi
echo ""

# Step 4: Install Ansible collections
echo -e "${YELLOW}[4/4] Checking Ansible collections...${NC}"
COLLECTIONS_NEEDED=false

if ! ansible-galaxy collection list 2>/dev/null | grep -q "community.general"; then
    echo "  - community.general collection needs to be installed"
    COLLECTIONS_NEEDED=true
fi

if [ "$COLLECTIONS_NEEDED" = true ]; then
    echo "Installing Ansible collections..."
    ansible-galaxy collection install community.general 2>/dev/null || echo "  - Failed to install community.general"
    echo -e "${GREEN}✓ Collections installed${NC}"
else
    echo -e "${GREEN}✓ All required collections already installed${NC}"
fi
echo ""

# Verification
echo "===================================================================="
echo -e "${GREEN}Bootstrap complete!${NC}"
echo "===================================================================="
echo ""
echo "Installed versions:"
echo "  - Nix:       $(nix --version 2>/dev/null || echo 'error')"
echo "  - pipx:      $(pipx --version 2>/dev/null || echo 'error')"
echo "  - Ansible:   $(ansible --version 2>/dev/null | head -n1 || echo 'error')"
echo ""
echo "To verify Kubernetes/OpenShift support:"
echo "  python3 -c 'import kubernetes; print(\"kubernetes:\", kubernetes.__version__)'"
echo "  python3 -c 'import openshift; print(\"openshift:\", openshift.__version__)'"
echo ""
echo "Next steps:"
echo "  1. Source Nix in your current shell:"
echo "     source ~/.nix-profile/etc/profile.d/nix.sh"
echo "  2. Run Ansible playbooks:"
echo "     cd ansible && ansible-playbook playbooks/dev.yml --tags ansible"
echo ""
