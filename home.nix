{ config, pkgs, ... }:

{
  home.username = "jamest";
  home.homeDirectory = "/home/jamest";
  home.stateVersion = "24.05";

  programs.dconf.enable = true;

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings" = {
      custom0 = {
        name = "Manual Lock";
        command = "loginctl lock-session";
        binding = "<Super>L";
      };
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
  };
}
