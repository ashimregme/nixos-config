{ config, pkgs, ... }:

{
  specialisation = {};
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome = {
    core-utilities.enable = false;
    localsearch.enable = false;
    tinysparql.enable = false;
    gnome-browser-connector.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.control-monitor-brightness-and-volume-with-ddcutil
    gnomeExtensions.open-bar
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    nautilus
    eog
    gnome-clocks
    gnome-tweaks
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-tour
  ];

  services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
