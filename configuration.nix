{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./main/boot.nix
      ./main/networking.nix
      ./main/hardware-services.nix
      ./main/system-packages.nix
      ./main/programs.nix
      ./services/services.nix
      ./users/users.nix
      ./systemd-timer.nix
    ];

  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
  nix.settings.allowed-users = [ "@wheel" ];

  documentation.nixos.enable = false;

  environment.defaultPackages = lib.mkForce [];
  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-tour
  ];

  security.rtkit.enable = true;
  security.sudo.execWheelOnly = true;

  virtualisation.docker.enable = true;
}
