{ config, pkgs, ... }:

{
  specialisation = {
    kde.configuration = {
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      environment.plasma6.excludePackages = with pkgs.kdePackages; [
      ];
    };

    gnome.configuration = {
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;

      services.gnome = {
        core-utilities.enable = false;
        tracker-miners.enable = false;
        tracker.enable = false;
        gnome-browser-connector.enable = true;
      };

      environment.systemPackages = with pkgs; [
        gnomeExtensions.appindicator
        gnomeExtensions.gsconnect
        gnome.gnome-calculator
        gnome.gnome-system-monitor
        gnome.gnome-disk-utility
        gnome.nautilus
        gnome.eog
        gnome.gnome-clocks
      ];

      environment.gnome.excludePackages = with pkgs.gnome; [
        pkgs.gnome-tour
      ];

      services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
    };
  };
}
