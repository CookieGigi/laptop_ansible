#!/usr/bin/env bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "===================================================================="
echo "  Ansible Bootstrap Installer"
echo "  Installing: Nix → pipx → Ansible (with Kubernetes/OpenShift)"
echo "===================================================================="
echo ""

# Step 1: Install Nix
echo -e "${YELLOW}[1/3] Checking Nix installation...${NC}"
if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    echo -e "${GREEN}✓ Nix already installed${NC}"
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo "Installing Nix (single-user, no daemon)..."

    # Ensure /nix directory exists with correct permissions
    if [ ! -d /nix ]; then
        echo "Creating /nix directory (requires sudo)..."
        sudo mkdir -p /nix
        sudo chown -R "$(whoami)" /nix
    fi

    # Install Nix
    sh <(curl -L https://nixos.org/nix/install) --no-daemon

    # Source Nix
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"

    echo -e "${GREEN}✓ Nix installed successfully${NC}"
fi
echo ""

# Step 2: Install pipx via Nix
echo -e "${YELLOW}[2/3] Checking pipx installation...${NC}"
if nix profile list | grep -q "pipx"; then
    echo -e "${GREEN}✓ pipx already installed${NC}"
else
    echo "Installing pipx via Nix..."
    nix profile install nixpkgs#pipx

    # Ensure pipx path
    pipx ensurepath || true

    echo -e "${GREEN}✓ pipx installed successfully${NC}"
fi
echo ""

# Step 3: Install Ansible with Kubernetes/OpenShift support via pipx
echo -e "${YELLOW}[3/3] Checking Ansible installation...${NC}"
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
