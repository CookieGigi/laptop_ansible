# Using Conditions

## In Group Files

Add a `conditional` section to install packages based on conditions:

```yaml
conditional:
  - condition: "{{ unified_nvidia_detected | default(false) }}"
    packages:
      nix:
        - cudaPackages.cudatoolkit
        - python3Packages.torchWithCuda
  
  - condition: "{{ unified_laptop_detected | default(false) }}"
    packages:
      apt:
        - powertop
        - tlp
```

## Available Variables

| Variable | Description | Set When |
|----------|-------------|----------|
| `unified_nvidia_detected` | NVIDIA GPU present | `lspci` shows NVIDIA |
| `unified_laptop_detected` | System is laptop | Battery detected in `/sys/class/power_supply/` |

## Best Practices

- Always use `| default(false)` to handle undefined variables
- Put conditions in order of priority
- Use for hardware-specific packages (CUDA, power management)
- Keep conditional blocks small and focused
