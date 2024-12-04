# Ansible Project: example_project

## Project Structure

```
example_project/
│
├── ansible.cfg        # Ansible configuration file
├── inventories/       # Inventory files for different environments
│   └── production     # Production inventory
│
├── roles/             # Ansible roles directory
│   └── example_role/    # Example role
│       ├── tasks/     # Role tasks
│       ├── handlers/  # Handlers for triggering actions
│       ├── templates/ # Template files for configuration
│       ├── files/     # Static files to be copied
│       ├── vars/      # Variables specific to the role
│       ├── defaults/  # Default variables
│       └── meta/      # Role metadata and dependencies
│
└── site.yml           # Main playbook that ties everything together
```

## Configuration Files

- `ansible.cfg`: Global Ansible configuration settings
- `site.yml`: Main playbook that defines which roles to apply to which hosts

## Inventory Management

- `inventories/production`: Defines the hosts and connection details for the production environment

## Roles

Roles are a way to organize and reuse Ansible tasks. This project includes the `example_role` role as an example.

## Getting Started

1. Ensure Ansible is installed
2. Modify the inventory file as needed
3. Run the playbook: `ansible-playbook site.yml`

## Best Practices

- Keep sensitive data out of version control
- Use variables and templates for flexibility
- Organize roles for maximum reusability
