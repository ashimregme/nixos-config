{ config, inputs, pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    evince.enable = true;
    git.enable = true;
    virt-manager.enable = true;
    hyprland = {
      enable = true;
#       set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#       make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}