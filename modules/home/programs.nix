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
      settings.user = {
        name = "Ashim Regmi";
        email = "5734294+ashimregme@users.noreply.github.com";
      };
    };
    gnome-shell = {
      enable = true;
      extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
    };
    fzf.enableBashIntegration = true;
  };
}