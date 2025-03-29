{ config, pkgs, host, ... }:

{
  networking = {
    hostName = "${host}"; # Define your hostname.
#    wireless.enable = false;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Enable networking
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8096 8920 ];
      allowedUDPPorts = [ 1900 7359 ];
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # GSConnect ports
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # GSConnect ports
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}