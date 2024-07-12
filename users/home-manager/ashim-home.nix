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
        persepolis #GUI for aria2
        zip
        unzip
        ddcutil #brightness control

        albert
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
  };

  # Equivalent to command 'systemctl --user enable albert'
  systemd.packages = with pkgs; [ albert ];
  systemd.user.services.albert = {
    enable = true;
    wantedBy = [ "default.target" ];
    description = "Launcher application: albert";
    serviceConfig = {
      ExecStart = "${pkgs.albert}/bin/albert";
      wantedBy = [ "default.target" ];
      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}