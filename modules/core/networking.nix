{ config, pkgs, host, ... }:

{
  networking = {
    hostName = "${host}"; # Define your hostname.
#    wireless.enable = false;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Enable networking
    firewall = {
      enable = false;
      allowedTCPPorts = [
        8096
        8920
        4200
        8080
        1716
      ];
      allowedUDPPorts = [
        1900
        7359
        41641 #tailscale
        1716
      ];
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