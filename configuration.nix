{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./main/boot.nix
      ./main/networking.nix
      ./main/hardware-services.nix
      ./main/system-packages.nix
      ./main/programs.nix
      ./users/users.nix
      ./services/services.nix
      ./systemd-timer.nix
    ];

  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  documentation.nixos.enable = false;

  environment.defaultPackages = lib.mkForce [];

  security.rtkit.enable = true;
  security.sudo.execWheelOnly = true;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  services.resolved = {
    enable = false;
    dnssec = "true";
    dnsovertls = "true";
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    extraConfig = ''
      ReadEtcHosts=no
      # DNS=127.0.0.1:5053
      DNS=192.168.11.1  # router IP, assuming https-dns-proxy is setup
      DNSStubListener=yes
      # DNSStubListener=no
      DNSSEC=no
    '';
  };
}
