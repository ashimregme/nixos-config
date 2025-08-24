{ config, pkgs, ... }:

{
  imports = [
    ./de.nix
    ./pipewire.nix
    ./xserver.nix
    ./resolved.nix
  ];

  services = {
    printing.enable = false; # Enable CUPS to print documents.
    libinput.enable = true; # Touchpad support (enabled by default in most desktopManager).
    journald.storage = "volatile"; # Store journald logs only in RAM (to be kind to ssd)

    openssh.enable = true; # Enable the OpenSSH daemon.
    logrotate.checkConfig = false; # temporary solution (https://discourse.nixos.org/t/logrotate-config-fails-due-to-missing-group-30000/28501)
    tailscale.enable = false;
    pulseaudio.enable = false;
    thermald.enable = true; # proactively prevents overheating on Intel CPUs and works well with other tools. (https://wiki.nixos.org/wiki/Laptop)
  };
}