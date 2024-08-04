{ config, pkgs, systemd, ... }:

{
  imports = [
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
        gimp
      ];

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/protonvpn-app.desktop" = {
        enable = true;
        source = "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/thunderbird.desktop" = {
        enable = true;
        source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/firefox.desktop" = {
        enable = true;
        source = "${pkgs.firefox}/share/applications/firefox.desktop";
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
