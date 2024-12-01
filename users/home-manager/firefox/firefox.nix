{ config, pkgs, ... }:

{
  imports = [ ./profiles.nix ./policies/policies.nix ];

  programs.firefox = {
    enable = true;
    package = pkgs.unstable.firefox;
  };
}