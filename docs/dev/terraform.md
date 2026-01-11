# terraform

HashiCorp Terraform is an infrastructure as code (IaC) tool that lets you build, change, and manage infrastructure safely and efficiently.

## Installation

Installed via Nix package manager (user-space installation).

Included tools:
- **terraform**: The main CLI tool.
- **terragrunt**: A thin wrapper that provides extra tools for keeping your configurations DRY.
- **tflint**: A Terraform linter for detecting errors and best practice violations.
- **tfsec**: Static analysis security scanner for your Terraform code.
- **terraform-ls**: The official Terraform Language Server.

## Role Information

- **Category**: Development Tools
- **Package Manager**: Nix
- **Package Name**: `nixpkgs#terraform`, `nixpkgs#terragrunt`, `nixpkgs#tflint`, `nixpkgs#tfsec`, `nixpkgs#terraform-ls`
- **Role Path**: `ansible/roles/dev/terraform/`

## Playbook

Available in `ansible/playbooks/dev.yml`

### Installation Command

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags terraform
```

## Usage

### Basic Commands

```bash
# Initialize a terraform configuration
terraform init

# Plan changes
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy
```

### State Management

```bash
# List resources in state
terraform state list

# Show resource detail
terraform state show <resource-address>

# Remove resource from state
terraform state rm <resource-address>
```

### Linting and Validation

```bash
# Validate configuration
terraform validate

# Format configuration files
terraform fmt

# Run TFLint
tflint

# Run tfsec
tfsec .

### Terragrunt

```bash
# Terragrunt wrapper commands
terragrunt plan
terragrunt apply
```

## Documentation

- [Official Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [TFLint Documentation](https://github.com/terraform-linters/tflint)
- [Terragrunt Documentation](https://terragrunt.gruntwork.io/)
- [tfsec Documentation](https://aquasecurity.github.io/tfsec/)

## Related Tools

- **kubectl**: Kubernetes CLI (see `docs/dev/kubectl.md`)
- **helm**: Kubernetes package manager (see `docs/dev/helm.md`)
