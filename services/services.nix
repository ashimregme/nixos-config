{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./pipewire.nix
    ./xserver.nix
  ];

  services = {
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    printing.enable = false; # Enable CUPS to print documents.
    libinput.enable = false; # Touchpad support (enabled by default in most desktopManager).
    journald.storage = "volatile"; # Store journald logs only in RAM (to be kind to ssd)

    openssh.enable = true; # Enable the OpenSSH daemon.
  };
}