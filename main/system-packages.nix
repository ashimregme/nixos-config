{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    vlc
    google-chrome
    gnome.gnome-clocks
    gnome.gnome-calculator
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome.nautilus
    gnome.eog
    wget
    gnupg
  ];
}