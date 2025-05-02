# nixos-config

My personal **NixOS configuration**, modularized for clarity and maintainability.
This repo manages everything from the bootloader and desktop environment to GPU drivers and user setup.

---

## Structure

```sh
nixos-config/
├── configuration.nix               # Main entry point, imports modules
├── hardware-configuration.nix     # Auto-generated hardware file (from installer)
└── modules/
    ├── base.nix                    # Bootloader, networking, nix settings
    ├── system.nix                  # Timezone, locale, Pipewire audio
    ├── desktop.nix                 # GNOME desktop, X11/Wayland config
    ├── users.nix                   # User account, packages, Docker
    └── nvidia.nix                  # Hybrid graphics (AMD + NVIDIA) config
```

## Usage

Apply system changes

```sh
sudo nixos-rebuild switch
```
