# State File Structure

## Example

```yaml
---
# ansible/inventory/state.yml

installed_groups:
  - core
  - dev-base

system_detected:
  has_nvidia_gpu: true
  is_laptop: true
  detected_package_manager: Debian

bootstrap:
  system_completed: true
  user_completed: true
```

## Sections

### installed_groups
List of groups currently installed. Updated automatically by group playbooks.

### system_detected
Hardware and system characteristics detected during bootstrap:
- `has_nvidia_gpu`: NVIDIA GPU detected
- `is_laptop`: Battery/power supply detected
- `detected_package_manager`: OS family (Debian, RedHat, etc.)

### bootstrap
Tracks bootstrap completion:
- `system_completed`: System bootstrap done
- `user_completed`: User bootstrap done

## Important Notes

- **Auto-managed**: Don't edit manually
- **Version controlled**: Commit changes after group install/remove
- **Used by**: Group dependency resolution, conditional packages
