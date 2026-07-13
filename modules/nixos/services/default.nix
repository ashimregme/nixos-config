{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./xserver.nix
    ./resolved.nix
  ];

  services = {
    printing.enable = false;
    libinput.enable = true;
    journald.storage = "volatile";

    openssh.enable = true;
    logrotate.checkConfig = false;
    pulseaudio.enable = false;
    thermald.enable = true;
  };
}
