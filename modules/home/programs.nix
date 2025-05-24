{ config, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    thunderbird = {
      enable = true;
      profiles = { };
    };
    git = {
      enable = true;
      userName = "Ashim Regmi";
      userEmail = "5734294+ashimregme@users.noreply.github.com";
    };
    java = {
      enable = false;
      package = pkgs.temurin-bin-21;
    };
    gnome-shell = {
      enable = true;
      extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
    };
    fzf.enableBashIntegration = true;
  };
}