{ config, pkgs, ... }:

{
  services.gnome = {
    core-utilities.enable = false;
    tracker-miners.enable = false;
    tracker.enable = false;
    gnome-browser-connector.enable = true;
  };
}
