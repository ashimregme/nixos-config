{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/services/pipewire.nix
    ../../modules/nixos/services/resolved.nix
    ../../modules/nixos/services/xserver.nix
    ../../modules/nixos/desktop/gnome.nix
    ../../modules/nixos/desktop/dconf.nix
    ../../modules/nixos/users.nix
    ./host.nix
  ];
}
