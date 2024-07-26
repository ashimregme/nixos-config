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
  };
}