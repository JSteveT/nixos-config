{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    open = false;
  };

  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.kernelModules = [ "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia_drm modeset=1
  '';

  boot.kernelParams = [ "mem_sleep_default=deep" ];
}
