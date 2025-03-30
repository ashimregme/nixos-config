{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
}
