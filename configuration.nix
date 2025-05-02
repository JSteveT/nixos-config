{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set timezone
  time.timeZone = "Europe/London";

  # Internationalisation
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # X11 and GNOME Desktop
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Console keymap
  console.keyMap = "uk";

  # Printing (CUPS)
  services.printing.enable = true;

  # Sound via Pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # you can comment this out if you don't use JACK apps
  };

  # User account
  users.users.jamest = {
    isNormalUser = true;
    description = "James Taylor";
    extraGroups = [ "networkmanager" "wheel" "docker" ]; # Added docker group
    packages = with pkgs; [
      git 
      wget 
      curl
      zed-editor 
      vscode 
      libreoffice
      firefox 
      google-chrome
      gnomeExtensions.pop-shell
      gnomeExtensions.vitals
      gnome-tweaks
      neofetch
      nodejs_20
      openrgb
    ];
  };

  # Enable programs
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  
  # Enable Nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    open = true;
  };

  # Enable Docker
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental nix features (flakes, nix-command)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System version
  system.stateVersion = "24.11"; # Did you read the comment?
}
