{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  programs.firefox.enable = true;
  programs.dconf.enable = true;
}
