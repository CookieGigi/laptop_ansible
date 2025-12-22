# kubectl

Kubernetes command-line tool for interacting with Kubernetes clusters.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#kubectl`
- **Role Path**: `ansible/roles/dev/kubectl/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags kubectl
```

## Usage

```bash
# View cluster information
kubectl cluster-info

# Get nodes in the cluster
kubectl get nodes

# Get all pods in default namespace
kubectl get pods

# Get pods in all namespaces
kubectl get pods --all-namespaces

# Describe a resource
kubectl describe pod <pod-name>

# Create resources from a file
kubectl apply -f <file.yaml>

# Delete resources
kubectl delete -f <file.yaml>

# Get logs from a pod
kubectl logs <pod-name>

# Execute command in a pod
kubectl exec -it <pod-name> -- /bin/bash

# Port forward to a pod
kubectl port-forward <pod-name> 8080:80
```

## Configuration

kubectl uses `~/.kube/config` for cluster configuration. You can:

- Set current context: `kubectl config use-context <context-name>`
- View current context: `kubectl config current-context`
- View all contexts: `kubectl config get-contexts`

## Documentation

- [Official kubectl Documentation](https://kubernetes.io/docs/reference/kubectl/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## Related Tools

- **helm**: Kubernetes package manager (see `docs/dev/helm.md`)
- **k9s**: Terminal UI for Kubernetes clusters
