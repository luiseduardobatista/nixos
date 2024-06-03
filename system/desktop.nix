
{ config, lib, ... }:
{

  options.nvidiaDesktop = {
    enable = lib.mkEnableOption "Desktop";
  };

  config = lib.mkIf config.nvidiaDesktop.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.modesetting.enable = true;
  };
}

