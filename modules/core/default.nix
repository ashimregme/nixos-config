{
  inputs,
  nixpkgs,
  username,
  host,
  ...
}:

{
  imports =
    [
      ./boot.nix
      ./hardware.nix
      ./services
      ./networking.nix
      ./system-packages.nix
      ./programs.nix
      ./security.nix
      ./systemd.nix
      ./system.nix
      ./virtualization.nix
      ./users.nix
    ];
}