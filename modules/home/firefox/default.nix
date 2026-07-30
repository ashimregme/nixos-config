{ config, pkgs, ... }:

{
  imports = [ ./profiles.nix ./settings ];

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    package = pkgs.unstable.firefox;
    nativeMessagingHosts = with pkgs; [
      # Provides the org.gnome.chrome_gnome_shell native host needed for
      # GNOME Extensions integration in Firefox.
      gnome-browser-connector
    ];
  };
}