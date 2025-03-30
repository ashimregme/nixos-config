{ config, pkgs, lib, ... }:

{
  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings = {
    auto-optimise-store = true;
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  documentation.nixos.enable = false;

  environment.defaultPackages = with pkgs; [
    git
    wget
  ];
}