{ pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;
    i2c.enable = true; # For controlling monitor brightness (ddcutil pkg)
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
    };
    enableRedistributableFirmware = true;
  };
}
