{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    htop
    unzip
    zip
    openssh
    python3
    nodejs
    docker
    mysql-workbench
  ];

  services.openssh.enable = true;

  virtualisation.docker.enable = true;
}
