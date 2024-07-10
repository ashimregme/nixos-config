{ config, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    evince.enable = true;
    git.enable = true;
    virt-manager.enable = true;
  };
}