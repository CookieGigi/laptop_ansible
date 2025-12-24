# minikube

Local Kubernetes cluster for development and testing. Runs a single-node Kubernetes cluster inside a VM or container.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#minikube`
- **Role Path**: `ansible/roles/dev/minikube/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags minikube
```

## Prerequisites

Minikube requires a container or VM driver. Choose one:

### Recommended: Docker Driver

The Docker driver is cross-platform and most widely used.

**Install Docker:**
- On Linux: Follow [Docker Engine installation](https://docs.docker.com/engine/install/)
- On macOS/Windows: Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

**Note:** This project has an empty docker role at `ansible/roles/dev/docker/` that could be implemented in the future.

### Alternative Drivers

- **Podman** (Experimental): Rootless container runtime
  - Install: `nix profile install nixpkgs#podman`
  - More secure, less memory usage
  - Status: Experimental in Minikube

- **KVM2** (Linux only): Kernel-based Virtual Machine
  - Preferred VM driver for Linux
  - Requires: KVM and libvirt installation (distribution-specific)

- **VirtualBox**: Cross-platform VM
  - Install: Download from [virtualbox.org](https://www.virtualbox.org/)

## Usage

### Cluster Lifecycle

```bash
# Start a local cluster (auto-detects driver)
minikube start

# Start with specific driver
minikube start --driver=docker
minikube start --driver=podman
minikube start --driver=kvm2

# Specify Kubernetes version
minikube start --kubernetes-version=v1.28.0

# Allocate more resources
minikube start --cpus=4 --memory=8192

# Stop the cluster (preserves state)
minikube stop

# Delete the cluster
minikube delete

# Delete all clusters
minikube delete --all
```

### Cluster Management

```bash
# Check cluster status
minikube status

# Get cluster IP
minikube ip

# SSH into the cluster
minikube ssh

# View dashboard
minikube dashboard

# Pause cluster (save resources)
minikube pause

# Unpause cluster
minikube unpause
```

### Working with kubectl

Minikube automatically configures kubectl to use the minikube cluster:

```bash
# Verify cluster connection
kubectl cluster-info

# View nodes
kubectl get nodes

# Deploy an application
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080

# Access the service
minikube service hello-minikube
```

### Addons

Minikube includes useful addons:

```bash
# List available addons
minikube addons list

# Enable metrics-server
minikube addons enable metrics-server

# Enable ingress
minikube addons enable ingress

# Enable dashboard
minikube addons enable dashboard

# Disable addon
minikube addons disable dashboard
```

### Docker Integration

Use Minikube's Docker daemon (avoids pushing to registry):

```bash
# Configure shell to use minikube's docker
eval $(minikube docker-env)

# Build image directly in minikube
docker build -t my-app:v1 .

# Use in Kubernetes without push
kubectl run my-app --image=my-app:v1 --image-pull-policy=Never

# Undo docker-env
eval $(minikube docker-env -u)
```

### Multiple Clusters

```bash
# Create named profiles
minikube start -p dev
minikube start -p staging

# Switch between clusters
minikube profile dev
kubectl get nodes

minikube profile staging
kubectl get nodes

# List profiles
minikube profile list
```

## Configuration

Minikube stores configuration in `~/.minikube/`

### Set Default Driver

```bash
# Set docker as default
minikube config set driver docker

# Set memory default
minikube config set memory 8192

# Set CPU default
minikube config set cpus 4

# View config
minikube config view
```

### Container Runtime

```bash
# Use containerd (recommended)
minikube start --container-runtime=containerd

# Use docker
minikube start --container-runtime=docker

# Use cri-o
minikube start --container-runtime=cri-o
```

## Troubleshooting

```bash
# View logs
minikube logs

# Get recent logs (last 20 lines)
minikube logs -n 20

# Check for updates
minikube update-check

# Verify installation
minikube version
```

### Common Issues

**Driver not found:**
```bash
# List available drivers on your system
minikube start --help | grep driver

# Explicitly specify driver
minikube start --driver=docker
```

**Low resources:**
```bash
# Check resource usage
minikube status
docker stats minikube

# Adjust resources
minikube delete
minikube start --cpus=2 --memory=4096
```

**Network issues:**
```bash
# Restart cluster
minikube stop
minikube start

# Delete and recreate
minikube delete
minikube start
```

## Integration with Project Tools

Works seamlessly with other Kubernetes tools in this project:

- **kubectl**: Automatically configured to use minikube cluster (see `docs/dev/kubectl.md`)
- **helm**: Deploy charts to local cluster (see `docs/dev/helm.md`)
- **ansible**: Manage resources with kubernetes.core collection (see `docs/dev/ansible.md`)

## Documentation

- [Official Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Minikube Drivers](https://minikube.sigs.k8s.io/docs/drivers/)
- [Minikube Handbook](https://minikube.sigs.k8s.io/docs/handbook/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)

## Related Tools

- **kubectl**: Kubernetes command-line tool (see `docs/dev/kubectl.md`)
- **helm**: Kubernetes package manager (see `docs/dev/helm.md`)
- **k9s**: Terminal UI for Kubernetes clusters
- **kind**: Kubernetes IN Docker (alternative to minikube)
- **k3d**: Lightweight Kubernetes (k3s in Docker)
