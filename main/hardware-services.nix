{ config, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    i2c.enable = true; # For controlling monitor brightness (ddcutil pkg)
  };
}