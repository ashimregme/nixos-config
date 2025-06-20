{ config, pkgs, lib, username, ... }:

{
  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings = {
    auto-optimise-store = true;
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "${username}" ];
    substituters = [
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  documentation.nixos.enable = false;

  environment.defaultPackages = with pkgs; [
    git
    wget
  ];
}