{ config, pkgs, ... }:

{
  xdg.configFile."autostart/thunderbird.desktop" = {
    enable = true;
    source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
  };

  xdg.configFile."autostart/firefox.desktop" = {
    enable = true;
    source = "${pkgs.unstable.firefox}/share/applications/firefox.desktop";
  };

  xdg.configFile."autostart/guake.desktop" = {
    enable = true;
    source = "${pkgs.guake}/share/applications/guake.desktop";
  };

  xdg.configFile."autostart/jetbrains-idea.desktop" = {
    enable = true;
    source = "${pkgs.unstable.jetbrains.idea}/share/applications/jetbrains-idea.desktop";
  };
}
