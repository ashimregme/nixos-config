{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true; # Enable the GNOME Desktop Environment.

  services.gnome = {
    core-utilities.enable = false;
    tracker-miners.enable = false;
    tracker.enable = false;
    gnome-browser-connector.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    nautilus
    eog
    gnome.gnome-clocks
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-tour
  ];

  services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
}
