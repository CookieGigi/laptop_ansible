# helm

The package manager for Kubernetes, used to deploy and manage applications on K8s clusters.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#kubernetes-helm`
- **Role Path**: `ansible/roles/dev/helm/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags helm
```

## Usage

### Chart Management

```bash
# Search for charts
helm search hub <keyword>
helm search repo <keyword>

# Add a chart repository
helm repo add <repo-name> <repo-url>

# Update chart repositories
helm repo update

# List installed repositories
helm repo list
```

### Installation and Deployment

```bash
# Install a chart
helm install <release-name> <chart-name>

# Install with custom values
helm install <release-name> <chart-name> -f values.yaml

# Install with specific namespace
helm install <release-name> <chart-name> -n <namespace>

# Upgrade a release
helm upgrade <release-name> <chart-name>

# Rollback a release
helm rollback <release-name> <revision>

# Uninstall a release
helm uninstall <release-name>
```

### Release Management

```bash
# List all releases
helm list

# List releases in all namespaces
helm list --all-namespaces

# Get release status
helm status <release-name>

# Get release history
helm history <release-name>

# Show chart values
helm show values <chart-name>
```

### Chart Development

```bash
# Create a new chart
helm create <chart-name>

# Validate chart syntax
helm lint <chart-path>

# Package a chart
helm package <chart-path>

# Test chart rendering
helm template <chart-name> --debug
```

## Configuration

Helm stores configuration in:
- Charts: `~/.cache/helm/`
- Repositories: `~/.config/helm/repositories.yaml`

## Common Repositories

```bash
# Official Helm stable charts
helm repo add stable https://charts.helm.sh/stable

# Bitnami charts
helm repo add bitnami https://charts.bitnami.com/bitnami
```

## Documentation

- [Official Helm Documentation](https://helm.sh/docs/)
- [Helm Charts Repository](https://artifacthub.io/)
- [Helm Best Practices](https://helm.sh/docs/chart_best_practices/)

## Related Tools

- **kubectl**: Kubernetes CLI (see `docs/dev/kubectl.md`)
- **helmfile**: Declarative Helm chart management
