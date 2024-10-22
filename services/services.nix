{ config, pkgs, ... }:

{
  imports = [
    ./de.nix
    ./pipewire.nix
    ./xserver.nix
  ];

  services = {
    printing.enable = false; # Enable CUPS to print documents.
    libinput.enable = false; # Touchpad support (enabled by default in most desktopManager).
    journald.storage = "volatile"; # Store journald logs only in RAM (to be kind to ssd)

    openssh.enable = false; # Enable the OpenSSH daemon.
    logrotate.checkConfig = false; # temporary solution (https://discourse.nixos.org/t/logrotate-config-fails-due-to-missing-group-30000/28501)
  };
}