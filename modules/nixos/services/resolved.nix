{ config, pkgs, ... }:

{
  services.resolved = {
    enable = true;

    settings = {
      Resolve = {
        ReadEtcHosts = false;
        # DNS = "127.0.0.1:5053";
        DNS = "192.168.11.1";
        DNSStubListener = true;
        DNSSEC = false;
        FallbackDNS = [
          "1.1.1.1#one.one.one.one"
          "1.0.0.1#one.one.one.one"
        ];
      };
    };
  };
}