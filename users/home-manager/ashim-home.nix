{ config, pkgs, systemd, ... }:

{
  imports = [
    ./stylix.nix
  ];
  users.users.ashim = {
    isNormalUser = true;
    description = "Ashim Regmi";
    extraGroups = [ "networkmanager" "wheel" "docker" "i2c" ];
    initialPassword = "changeme";
    shell = pkgs.zsh;
  };

  home-manager.users.ashim = {
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
        zip
        unzip
        ddcutil #brightness control
        lsof
        dig
        vlc
        google-chrome
        wget
        gnupg

        albert
      ];

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/albert.desktop" = {
        enable = true;
        source = "${pkgs.albert}/share/applications/albert.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/thunderbird.desktop" = {
        enable = true;
        source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
      };
    };

    programs = {
      home-manager.enable = true; # Let Home Manager install and manage itself.
      thunderbird = {
        enable = true;
        profiles = { };
      };
      git = {
        enable = true;
        userName = "Ashim Regmi";
        userEmail = "5734294+ashimregme@users.noreply.github.com";
      };
    };
  };
}