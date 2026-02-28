#!/bin/bash
# Create a new group file from template
# Usage: ./scripts/create-group.sh <group-name>

set -e

if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/create-group.sh <group-name>"
    echo "Example: ./scripts/create-group.sh my-tools"
    exit 1
fi

GROUP_NAME="$1"
GROUP_FILE="groups/${GROUP_NAME}.yml"

if [ -f "$GROUP_FILE" ]; then
    echo "Error: $GROUP_FILE already exists"
    exit 1
fi

cat > "$GROUP_FILE" << 'EOF'
---
# groups/GROUP_NAME.yml
# Purpose: 
# Install with: make install GROUP=GROUP_NAME

group_name: ""
description: ""
requires: []

packages:
  nix: []
  flatpak: []
  pipx: []
  cargo: []
  npm: []
  apt: []  # Use only when necessary - requires root

conditional: []
post_install_message: ""
EOF

sed -i "s/GROUP_NAME/${GROUP_NAME}/g" "$GROUP_FILE"

echo "Created $GROUP_FILE"
echo "Edit the file to add packages and metadata"
