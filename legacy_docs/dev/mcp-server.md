# MCP Server (@context7/mcp-server)

## Overview

The Model Context Protocol (MCP) server from Context7 enables AI assistants to interact with external tools and data sources through a standardized protocol.

## Installation

This role installs the `@context7/mcp-server` package globally via npm.

## Role Location

- **Role**: `ansible/roles/dev/mcp-server/`
- **Category**: Development tools
- **Package Manager**: npm (global installation)

## Usage

### Install via Playbook

```bash
cd ansible
ansible-playbook playbooks/ai.yml --tags mcp
```

### Install All AI Tools

```bash
cd ansible
ansible-playbook playbooks/ai.yml
```

## Configuration

The MCP server is installed globally and available system-wide. Configuration depends on how you integrate it with your AI tools.

## Related Roles

- `npm_install`: Reusable role for npm package installation
- `opencode`: AI code editor that may use MCP servers

## References

- [Context7 MCP Server](https://www.npmjs.com/package/@context7/mcp-server)
- [Model Context Protocol Specification](https://modelcontextprotocol.io/)
