# k3d

k3d is a lightweight wrapper to run [k3s](https://k3s.io/) (Rancher Lab's lightweight Kubernetes distribution) in Docker. k3d makes it very easy to create single- and multi-node k3s clusters in Docker, e.g. for local development on Kubernetes.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#k3d`
- **Role Path**: `ansible/roles/dev/k3d/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags k3d
```

## Prerequisites

k3d requires Docker to be installed and running.

**Install Docker:**
- On Linux: Follow [Docker Engine installation](https://docs.docker.com/engine/install/)
- On macOS/Windows: Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Usage

### Cluster Lifecycle

```bash
# Create a cluster
k3d cluster create mycluster

# Create a cluster with multiple nodes
k3d cluster create mycluster --agents 2

# Create a cluster with exposed ports (e.g., for Ingress)
k3d cluster create mycluster -p "8081:80@loadbalancer"

# Stop a cluster
k3d cluster stop mycluster

# Start a stopped cluster
k3d cluster start mycluster

# Delete a cluster
k3d cluster delete mycluster

# List clusters
k3d cluster list
```

### Working with kubectl

k3d automatically merges the new cluster's connection information into your default kubeconfig.

```bash
# Verify cluster connection
kubectl cluster-info

# View nodes
kubectl get nodes
```

### Managing Nodes

```bash
# Add a node
k3d node create new-node --cluster mycluster --role agent

# Stop a node
k3d node stop k3d-mycluster-agent-0

# Delete a node
k3d node delete k3d-mycluster-agent-0
```

### Managing Registries

k3d can create a local registry to use with your clusters:

```bash
# Create a registry
k3d registry create myregistry.localhost --port 5000

# Create a cluster that uses the registry
k3d cluster create mycluster --registry-use k3d-myregistry.localhost:5000
```

## Documentation

- [Official k3d Documentation](https://k3d.io/)
- [k3s Documentation](https://rancher.com/docs/k3s/latest/en/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)

## Related Tools

- **kubectl**: Kubernetes command-line tool (see `docs/dev/kubectl.md`)
- **helm**: Kubernetes package manager (see `docs/dev/helm.md`)
- **minikube**: Local Kubernetes cluster (see `docs/dev/minikube.md`)
