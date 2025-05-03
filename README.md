# nixos-config

My personal **NixOS configuration**, built with **flakes** and modularized for clarity and maintainability.

This setup manages everything from the bootloader and audio stack to GPU drivers and desktop environment — plus user apps and system packages via Home Manager.

---

## Directory Structure

```sh
nixos-config/
├── flake.nix                     # Flake entry point
├── flake.lock                   # Locked inputs for reproducibility
├── configuration.nix           # Main system entry point, imports modules
├── hardware-configuration.nix  # Auto-generated hardware info
├── home.nix                    # Home Manager config for user: jamest
└── modules/
    ├── base.nix                # Bootloader, Nix settings, networking
    ├── system.nix              # Locale, timezone, PipeWire config
    ├── desktop.nix             # GNOME desktop, Wayland/X11, themes
    ├── users.nix               # User config (jamest), GUI apps, shells
    ├── packages.nix            # System-wide packages (docker, dev tools)
    └── nvidia.nix              # NVIDIA hybrid graphics config
````

---

## Usage

### Rebuild system (with flake):

```bash
sudo nixos-rebuild switch --flake .#james
```

### Update flake inputs:

```bash
nix flake update
sudo nixos-rebuild switch --flake .#james
```
