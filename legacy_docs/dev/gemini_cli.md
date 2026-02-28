# Google Gemini CLI

Official CLI for Google's Gemini AI models.

## Installation

```bash
cd ansible && ansible-playbook playbooks/ai.yml --tags gemini
```

## Description

The Google Gemini CLI provides command-line access to Google's Gemini AI models. It allows you to interact with Gemini directly from your terminal for various AI tasks.

## Package Manager

- **npm**: `@google/gemini-cli`

## Role Location

`ansible/roles/dev/gemini_cli/`

## Tags

- `ai`
- `cli`
- `gemini`

## Dependencies

- Node.js (via NVM)
- npm

## Usage

After installation, you can use the Gemini CLI with:

```bash
gemini --help
```

Refer to the [official documentation](https://www.npmjs.com/package/@google/gemini-cli) for detailed usage instructions.
