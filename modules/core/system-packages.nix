{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose

#    for gnomeExtensions.battery-health-charging
    libsmbios
    dell-command-configure
  ];
}