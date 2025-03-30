{ config, pkgs, lib, ... }:

{
  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings = {
    auto-optimise-store = true;
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  documentation.nixos.enable = false;

  environment.defaultPackages = with pkgs; [
    git
    wget
  ];
}