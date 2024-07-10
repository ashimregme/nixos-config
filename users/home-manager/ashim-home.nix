{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./zsh.nix
    ./terminal.nix
    ./dconf.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ashim";
  home.homeDirectory = "/home/ashim";

  home.packages = with pkgs; [
    qbittorrent
    sublime4
    protonvpn-gui
    shotwell
    libreoffice
    jetbrains.idea-ultimate
    deja-dup
    gparted
    veracrypt
    ventoy-full
    neofetch
    aria2
    persepolis #GUI for aria2
    zip
    unzip

    ddcutil #gnome brightness control
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";
  
  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
    git = {
      enable = true;
      userName = "Ashim Regmi";
      userEmail = "5734294+ashimregme@users.noreply.github.com";
    };
  };

  # systemd.user.services.custombrightness = {
  #   description = "Change brightness of monitor according to the time of the day";
  #   script = ''
      
  #   '';
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  # };
}