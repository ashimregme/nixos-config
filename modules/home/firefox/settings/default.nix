{ config, pkgs, ... }:

{
  imports = [
    ./preferences.nix
    ./extensions.nix
    ./policies.nix
  ];
}