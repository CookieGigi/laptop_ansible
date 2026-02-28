#!/bin/bash

# Determine project root assuming script is in scripts/
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Ensure we are in the project root
cd "$PROJECT_ROOT" || { echo "Failed to change directory to project root"; exit 1; }

# Ask for category
echo -n "Enter role category: "
read category

if [ -z "$category" ]; then
    echo "Category cannot be empty."
    exit 1
fi

# Ask for role name
echo -n "Enter role name: "
read role_name

if [ -z "$role_name" ]; then
    echo "Role name cannot be empty."
    exit 1
fi

CATEGORY_REL_PATH="./roles/$category"
CATEGORY_FULL_PATH="$PROJECT_ROOT/roles/$category"

# Check if category directory exists
if [ ! -d "$CATEGORY_FULL_PATH" ]; then
    echo "Category '$category' does not exist. Creating directory..."
    mkdir -p "$CATEGORY_FULL_PATH"
    
    CONFIG_FILE="ansible.cfg"
    if [ -f "$CONFIG_FILE" ]; then
        # Check if the path is already in ansible.cfg to avoid duplication
        # We search for the string "./roles/<category>" in the roles_path line
        if grep -q "^roles_path =.*$CATEGORY_REL_PATH" "$CONFIG_FILE"; then
            echo "Path $CATEGORY_REL_PATH is already in ansible.cfg"
        else
            echo "Adding $CATEGORY_REL_PATH to roles_path in $CONFIG_FILE..."
            # Append :./roles/<category> to the line starting with roles_path
            sed -i "/^roles_path =/ s|$|:$CATEGORY_REL_PATH|" "$CONFIG_FILE"
        fi
    else
        echo "Warning: $CONFIG_FILE not found. Could not update roles_path."
    fi
else
    echo "Category '$category' exists."
fi

ROLE_PATH="$CATEGORY_FULL_PATH/$role_name"

if [ -d "$ROLE_PATH" ]; then
    echo "Role '$role_name' already exists in '$category'. Aborting."
    exit 1
fi

echo "Creating role '$role_name'..."

# Create directories
mkdir -p "$ROLE_PATH"/{tasks,handlers,files,templates,vars,defaults,meta}

# Create tasks/main.yml
cat > "$ROLE_PATH/tasks/main.yml" <<EOF
---
- name:
EOF

echo "Role created successfully at $ROLE_PATH"
