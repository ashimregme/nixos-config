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

  services.resolved = {
    enable = true;
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    extraConfig = ''
      ReadEtcHosts=no
      # DNS=127.0.0.1:5053
      DNS=192.168.11.1  # router IP, assuming https-dns-proxy is setup
      DNSStubListener=yes
      # DNSStubListener=no
      DNSSEC=no
    '';
  };
}