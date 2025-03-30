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
      enable = true;
      package = pkgs.temurin-bin-17;
    };
    gnome-shell = {
      enable = true;
      extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
    };
    fzf.enableBashIntegration = true;
  };
}