{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    excludePackages = [ pkgs.xterm ];
  };
}
