{ config, pkgs, ... }:

{
  users.users.jamest = {
    isNormalUser = true;
    description = "James Taylor";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
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
      pciutils
    ];
  };
}

