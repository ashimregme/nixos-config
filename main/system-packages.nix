{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    vlc
    google-chrome
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility
    nautilus
    eog
    gnome.gnome-clocks
    wget
    gnupg
  ];
}