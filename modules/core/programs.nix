{ config, inputs, pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    evince.enable = true;
    virt-manager.enable = true;
    adb.enable = true;
  };
}