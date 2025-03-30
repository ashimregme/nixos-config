{ config, pkgs, systemd, username, host, ... }:

{
  imports = [
    ./firefox                         # browser
    ./zsh.nix                         # shell
    ./terminal.nix                    # shell
    ./dconf.nix                       # configurations
    ./packages.nix                    # user packages not available in NixOS by default
    ./autostart.nix
    ./programs.nix                    # user programs available in NixOS by default
  ];
}
