{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty # for Hyprland
    docker-compose
  ];
}