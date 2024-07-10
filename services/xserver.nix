{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    desktopManager.gnome.enable = true; # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;

    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";

    excludePackages = [ pkgs.xterm ];
  };
}