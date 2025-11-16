{ config, pkgs, ... }:

{
  services = {
    gnome = {
      core-apps.enable = false;
      localsearch.enable = false;
      tinysparql.enable = false;
      # Note: This enables the system service that provides the native messaging
      # host for GNOME Shell integration (aka chrome-gnome-shell /
      # gnome-browser-connector). When Firefox is managed via Home Manager,
      # you still need to register the host for that Firefox by adding
      # `gnome-browser-connector` to
      # `programs.firefox.nativeMessagingHosts.packages` in Home Manager.
      # See: modules/home/firefox/default.nix
      gnome-browser-connector.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.control-monitor-brightness-and-volume-with-ddcutil
    gnomeExtensions.hibernate-status-button
    gnomeExtensions.just-perfection
    gnomeExtensions.auto-move-windows
    gnomeExtensions.battery-health-charging
    gnome-calculator
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
