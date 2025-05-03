{ config, pkgs, ... }:

{
  home.username = "jamest";
  home.homeDirectory = "/home/jamest";
  home.stateVersion = "24.05";

  dconf.settings = {
    # This tells GNOME where to find the custom keybindings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    # This defines the actual custom keybinding
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Manual Lock";
      command = "loginctl lock-session";
      binding = "<Super>L";
    };
  };
}

