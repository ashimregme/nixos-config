{ config, pkgs, systemd, username, host, ... }:

{
  imports = [
    ./firefox
    ./zsh.nix
    ./terminal.nix
    ./packages.nix
    ./autostart.nix
    ./programs.nix
  ];
}
