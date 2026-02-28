# Podman

Podman (Pod Manager) is an open-source tool for developing, managing, and running OCI containers and container images. It is a daemonless, rootless alternative to Docker.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#podman`
- **Role Path**: `ansible/roles/dev/podman/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags podman
```

## Features

- **Daemonless**: Unlike Docker, Podman doesn't require a long-running daemon. It uses a fork-and-exec model.
- **Rootless**: Runs containers without root privileges by default, improving security.
- **Docker-compatible**: Most Docker commands can be aliased directly to Podman.
- **Pod Support**: Can group containers into "pods" that share network and storage (similar to Kubernetes pods).

## Usage

### Basic Commands

```bash
# Run a container
podman run --name my-nginx -p 8080:80 -d nginx

# List running containers
podman ps

# List all containers
podman ps -a

# Stop a container
podman stop my-nginx

# Remove a container
podman rm my-nginx

# List images
podman images

# Pull an image
podman pull alpine
```

### Pod Management

```bash
# Create a pod
podman pod create --name my-pod -p 8080:80

# Run a container in a pod
podman run -d --pod my-pod --name nginx-in-pod nginx

# List pods
podman pod ps

# Stop/Remove pods
podman pod stop my-pod
podman pod rm my-pod
```

### Docker Compatibility

You can alias `docker` to `podman` in your shell configuration:

```bash
alias docker=podman
```

## Rootless Configuration

Podman runs in rootless mode by default when installed via Nix. This requires subuid and subgid ranges to be configured on the host.

### Troubleshooting Rootless

If you encounter issues with permissions or network in rootless mode:

1.  **Check subuid/subgid ranges:**
    ```bash
    cat /etc/subuid
    cat /etc/subgid
    ```
    Ensure your user has a range assigned (e.g., `username:100000:65536`).

2.  **Verify user namespaces:**
    ```bash
    cat /proc/sys/user/max_user_namespaces
    ```
    It should be a non-zero value.

## Integration with Project Tools

- **minikube**: Can be used as a driver for minikube (see `docs/dev/minikube.md`).
- **k3d**: Lightweight Kubernetes in Docker (see `docs/dev/k3d.md`).
- **podman-compose**: Run docker-compose.yml files using Podman (see `docs/dev/podman-compose.md`).

## Documentation

- [Official Podman Documentation](https://podman.io/)
- [Podman Desktop](https://podman-desktop.io/)
- [Rootless Podman](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md)
