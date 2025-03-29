{ config, pkgs, ... }:

{
  imports = [ ./profiles.nix ./settings ];

  programs.firefox = {
    enable = true;
    package = pkgs.unstable.firefox;
  };
}