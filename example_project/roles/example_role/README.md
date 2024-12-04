# example_role Ansible Role

## Purpose

This role provides an example of Ansible role structure and basic task implementation.

## Directory Structure

```
example_role/
├── tasks/         # Contains the main list of tasks to be executed
│   └── main.yml   # Primary task file
├── handlers/      # Contains handlers - tasks that are triggered by other tasks
├── templates/     # Jinja2 template files for dynamic configuration
├── files/         # Static files to be copied to target systems
├── vars/          # Role-specific variables (less priority than defaults)
├── defaults/      # Default variables that can be overridden
└── meta/          # Role metadata, dependencies, and galaxy information
```

## Tasks

The `tasks/main.yml` file defines the primary tasks for this role.

## Variables

- Check `defaults/main.yml` for default variables
- Override variables in your playbook or inventory as needed

## Usage

Include this role in your playbook:

```yaml
- hosts: all
  roles:
    - example_role
```
