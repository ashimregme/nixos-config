{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./networking.nix
    ./system-packages.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./systemd.nix
    ./system.nix
    ./virtualization.nix
  ];
}
