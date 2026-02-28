# Docker

Docker is an open platform for developing, shipping, and running applications in containers. Containers are lightweight, portable, and ensure consistency across environments.

## Installation

Installed via Nix package manager (user-space installation), with system Docker daemon setup.

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Names**: `nixpkgs#docker`, `nixpkgs#docker-compose`
- **Role Path**: `ansible/roles/dev/docker/`
- **Privileges Required**: Some tasks require `sudo` (installing system Docker package and adding user to group)

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags docker
```

**Note:** You'll be prompted for sudo password during execution.

## Features

- **Containerization**: Package applications with all dependencies
- **Docker Compose**: Define and run multi-container applications
- **System Docker**: Uses system Docker daemon for better integration
- **User Group Setup**: Automatically adds your user to the docker group

## Post-Installation Steps

After running the playbook, you **must logout and login again** for the group membership changes to take effect.

Alternatively, run:
```bash
newgrp docker
```

Then verify Docker works:
```bash
docker ps
```

## Usage

### Basic Commands

```bash
# Run a container
docker run --name my-nginx -p 8080:80 -d nginx

# List running containers
docker ps

# List all containers
docker ps -a

# Stop a container
docker stop my-nginx

# Remove a container
docker rm my-nginx

# List images
docker images

# Pull an image
docker pull alpine
```

### Docker Compose

```bash
# Start services defined in docker-compose.yml
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs

# Build images
docker-compose build
```

## What the Role Does

1. Installs Docker client and Docker Compose via Nix
2. Installs system Docker package (`docker.io`) if not present (requires sudo)
3. Starts and enables the Docker system service (requires sudo)
4. Adds your user to the `docker` group (requires sudo)

## Integration with Project Tools

- **hadolint**: Dockerfile linter (see `docs/dev/hadolint.md`)
- **k3d**: Lightweight Kubernetes in Docker (see `docs/dev/k3d.md`)
- **minikube**: Can use Docker as a driver (see `docs/dev/minikube.md`)

## Documentation

- [Official Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
