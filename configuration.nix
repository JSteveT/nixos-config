{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/system.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/nvidia.nix
  ];

  system.stateVersion = "24.11";
}
