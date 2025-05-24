{ config, pkgs, ... }:

{
  services = {
    gnome = {
      core-apps.enable = false;
      localsearch.enable = false;
      tinysparql.enable = false;
      gnome-browser-connector.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.control-monitor-brightness-and-volume-with-ddcutil
    gnomeExtensions.open-bar
    gnomeExtensions.hibernate-status-button
    gnomeExtensions.just-perfection
    gnomeExtensions.auto-move-windows
    gnomeExtensions.battery-health-charging
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

  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];
}
