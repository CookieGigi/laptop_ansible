# Ansible

Ansible is an open-source automation tool for configuration management, application deployment, and task automation. This role installs Ansible with Kubernetes and OpenShift support via pipx.

## Installation

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags ansible
```

## What it does

- Installs pipx via Nix (if not already installed)
- Installs Ansible (>=2.9) in isolated pipx environment
- Injects kubernetes (>=12.0.0) library for Kubernetes module support
- Injects openshift (>=0.12.0) library for OpenShift module support
- Provides global CLI access to ansible, ansible-playbook, etc.

## Package manager

pipx (isolated Python CLI tools)

## Tags

- `ansible`
- `automation`
- `kubernetes`
- `k8s`
- `openshift`
- `package-manager`

## Dependencies

- Nix package manager (installed via nix role)
- pipx (installed automatically via role dependency)

## Usage

```bash
# Run playbook
ansible-playbook playbooks/site.yml

# Check version
ansible --version

# Work with Kubernetes
ansible-playbook kubernetes-playbook.yml

# Work with OpenShift
ansible-playbook openshift-playbook.yml
```

## Configuration

Default versions can be overridden in playbook:

```yaml
- role: ansible
  vars:
    ansible_package_version: ">=2.15"
    ansible_kubernetes_version: ">=25.0.0"
    ansible_openshift_version: ">=0.13.0"
```

## Kubernetes/OpenShift Module Examples

### Kubernetes Module Example

```yaml
---
- name: Manage Kubernetes resources
  hosts: localhost
  tasks:
    - name: Create a namespace
      kubernetes.core.k8s:
        name: my-namespace
        api_version: v1
        kind: Namespace
        state: present

    - name: Create a deployment
      kubernetes.core.k8s:
        state: present
        definition:
          apiVersion: apps/v1
          kind: Deployment
          metadata:
            name: nginx-deployment
            namespace: my-namespace
          spec:
            replicas: 3
            selector:
              matchLabels:
                app: nginx
            template:
              metadata:
                labels:
                  app: nginx
              spec:
                containers:
                - name: nginx
                  image: nginx:latest
                  ports:
                  - containerPort: 80
```

### OpenShift Module Example

```yaml
---
- name: Manage OpenShift resources
  hosts: localhost
  tasks:
    - name: Create a project
      redhat.openshift.openshift_project:
        name: my-project
        description: "My OpenShift Project"
        state: present

    - name: Create a route
      redhat.openshift.openshift_route:
        name: my-app-route
        namespace: my-project
        to:
          kind: Service
          name: my-app-service
        port:
          targetPort: 8080
        state: present
```

## Bootstrap Installation (Alternative)

If you don't have Ansible installed yet, use the bootstrap script:

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

This will install Nix → pipx → Ansible in one go, allowing you to then run Ansible playbooks.

## Related tools

- ansible-lint: Linting tool for Ansible playbooks
- kubectl: Kubernetes command-line tool
- helm: Kubernetes package manager
