{ config, pkgs, ... }:

{
  imports = [
    ./firefox/firefox.nix
    ./zsh.nix
    ./terminal.nix
    ./dconf.nix
  ];

  home = {
    stateVersion = "24.05";
    username = "ashim";
    homeDirectory = "/home/ashim";

    packages = with pkgs; [
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
  };

  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
    git = {
      enable = true;
      userName = "Ashim Regmi";
      userEmail = "5734294+ashimregme@users.noreply.github.com";
    };
  };
}