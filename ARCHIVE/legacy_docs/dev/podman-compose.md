# Podman Compose

Podman Compose is an implementation of Docker Compose with a Podman backend. It allows you to use `docker-compose.yml` files to define and run multi-container applications using Podman.

## Installation

Installed via Nix package manager (user-space installation).

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#podman-compose`
- **Role Path**: `ansible/roles/dev/podman-compose/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags podman-compose
```

## Usage

### Basic Commands

```bash
# Start services defined in docker-compose.yml
podman-compose up

# Start services in the background
podman-compose up -d

# Stop services
podman-compose down

# Build images before starting
podman-compose up --build

# View logs
podman-compose logs
```

## Integration with Podman

Podman Compose communicates with the Podman socket or CLI to manage containers. Ensure Podman is installed and working correctly.

## Documentation

- [Podman Compose GitHub Repository](https://github.com/containers/podman-compose)
