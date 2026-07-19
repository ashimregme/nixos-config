{ pkgs, ... }:

{
  systemd = {
#    To prevent getting stuck at shutdown
#    extraConfig = "DefaultTimeoutStopSec=10s";
  };
}