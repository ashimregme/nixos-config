{ config, pkgs, ... }:

{
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
