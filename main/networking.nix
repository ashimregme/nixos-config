{ config, pkgs, ... }:

{
  networking = {
    hostName = "homestation"; # Define your hostname.
#    wireless.enable = false;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Enable networking
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # GSConnect ports
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # GSConnect ports
      ];
    };
  };
}