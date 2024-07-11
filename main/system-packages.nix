{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    google-chrome
    wget
    gnupg
  ];
}