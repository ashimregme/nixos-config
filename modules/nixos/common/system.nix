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
    # This allows Nix to download and build multiple derivations in parallel.
    # A good starting point is the number of your CPU cores, or a number
    # like 4 or 8 if you have a fast network connection.
    max-jobs = 4;
    # `0` means auto-detect based on the number of cores.
    # This is for building, not downloading, but often set at the same time.
    cores = 0;
  };

  documentation.nixos.enable = false;

  environment.defaultPackages = with pkgs; [
    git
    wget
  ];
}