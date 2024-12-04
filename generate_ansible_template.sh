#!/bin/bash
# Project name
PROJECT_NAME="example_project"

# Role name (extracted as a variable)
ROLE_NAME="example_role"

# Define project structure
PROJECT_STRUCTURE=(
    "$PROJECT_NAME"
    "$PROJECT_NAME/ansible.cfg"
    "$PROJECT_NAME/inventories"
    "$PROJECT_NAME/roles"
    "$PROJECT_NAME/roles/$ROLE_NAME"
    "$PROJECT_NAME/roles/$ROLE_NAME/tasks"
    "$PROJECT_NAME/roles/$ROLE_NAME/handlers"
    "$PROJECT_NAME/roles/$ROLE_NAME/templates"
    "$PROJECT_NAME/roles/$ROLE_NAME/files"
    "$PROJECT_NAME/roles/$ROLE_NAME/vars"
    "$PROJECT_NAME/roles/$ROLE_NAME/defaults"
    "$PROJECT_NAME/roles/$ROLE_NAME/meta"
    "$PROJECT_NAME/site.yml"
)

# Create project structure
echo "Creating Ansible project structure..."

for item in "${PROJECT_STRUCTURE[@]}"; do
    if [[ $item == "$PROJECT_NAME/inventories" ]]; then
        # Create inventories directory
        mkdir -p "$item"
        echo "Created directory: $item"
    elif [[ $item == *"."* ]] && [[ $item != *"/"* ]]; then
        # Create file (non-directory, e.g., ansible.cfg)
        touch "$item"
        echo "Created file: $item"
    elif [[ $item == *"/"* ]] && [[ $item != *"."* ]]; then
        # Create directory
        mkdir -p "$item"
        echo "Created directory: $item"
    fi
done

# Create production inventory file
touch "$PROJECT_NAME/inventories/production"

# Project-level README
cat <<EOL > "$PROJECT_NAME/README.md"
# Ansible Project: $PROJECT_NAME

## Project Structure

\`\`\`
$PROJECT_NAME/
│
├── ansible.cfg        # Ansible configuration file
├── inventories/       # Inventory files for different environments
│   └── production     # Production inventory
│
├── roles/             # Ansible roles directory
│   └── $ROLE_NAME/    # Example role
│       ├── tasks/     # Role tasks
│       ├── handlers/  # Handlers for triggering actions
│       ├── templates/ # Template files for configuration
│       ├── files/     # Static files to be copied
│       ├── vars/      # Variables specific to the role
│       ├── defaults/  # Default variables
│       └── meta/      # Role metadata and dependencies
│
└── site.yml           # Main playbook that ties everything together
\`\`\`

## Configuration Files

- \`ansible.cfg\`: Global Ansible configuration settings
- \`site.yml\`: Main playbook that defines which roles to apply to which hosts

## Inventory Management

- \`inventories/production\`: Defines the hosts and connection details for the production environment

## Roles

Roles are a way to organize and reuse Ansible tasks. This project includes the \`$ROLE_NAME\` role as an example.

## Getting Started

1. Ensure Ansible is installed
2. Modify the inventory file as needed
3. Run the playbook: \`ansible-playbook site.yml\`

## Best Practices

- Keep sensitive data out of version control
- Use variables and templates for flexibility
- Organize roles for maximum reusability
EOL

# Role README
cat <<EOL > "$PROJECT_NAME/roles/$ROLE_NAME/README.md"
# $ROLE_NAME Ansible Role

## Purpose

This role provides an example of Ansible role structure and basic task implementation.

## Directory Structure

\`\`\`
$ROLE_NAME/
├── tasks/         # Contains the main list of tasks to be executed
│   └── main.yml   # Primary task file
├── handlers/      # Contains handlers - tasks that are triggered by other tasks
├── templates/     # Jinja2 template files for dynamic configuration
├── files/         # Static files to be copied to target systems
├── vars/          # Role-specific variables (less priority than defaults)
├── defaults/      # Default variables that can be overridden
└── meta/          # Role metadata, dependencies, and galaxy information
\`\`\`

## Tasks

The \`tasks/main.yml\` file defines the primary tasks for this role.

## Variables

- Check \`defaults/main.yml\` for default variables
- Override variables in your playbook or inventory as needed

## Usage

Include this role in your playbook:

\`\`\`yaml
- hosts: all
  roles:
    - $ROLE_NAME
\`\`\`
EOL

# Add content to ansible.cfg
cat <<EOL > "$PROJECT_NAME/ansible.cfg"
[defaults]
inventory = inventories/production
roles_path = roles
host_key_checking = False
EOL
echo "Added content to ansible.cfg"

# Add example inventory content to production file
cat <<EOL > "$PROJECT_NAME/inventories/production"
[all]
localhost ansible_connection=local
EOL
echo "Added content to inventories/production"

# Add content to site.yml
cat <<EOL > "$PROJECT_NAME/site.yml"
---
- name: Example Playbook
  hosts: all
  roles:
    - $ROLE_NAME
EOL
echo "Added content to site.yml"

# Add main.yml for the example role
cat <<EOL > "$PROJECT_NAME/roles/$ROLE_NAME/tasks/main.yml"
---
# Tasks for $ROLE_NAME
- name: Example task
  debug:
    msg: "This is an example task for $ROLE_NAME"
EOL
echo "Added content to $ROLE_NAME/tasks/main.yml"

# Final message
echo "Ansible project structure has been successfully created in ./$PROJECT_NAME"