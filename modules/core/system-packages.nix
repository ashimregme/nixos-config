{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty # for Hyprland
    docker-compose

#    for gnomeExtensions.battery-health-charging
    libsmbios
    dell-command-configure
  ];
}