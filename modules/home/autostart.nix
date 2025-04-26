{ config, pkgs, inputs, username, ... }:

{
#  xdg.configFile."autostart/protonvpn-app.desktop" = {
#    enable = true;
#    source = "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop";
#  };

  xdg.configFile."autostart/thunderbird.desktop" = {
    enable = true;
    source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
  };

  xdg.configFile."autostart/firefox.desktop" = {
    enable = true;
    source = "${pkgs.firefox}/share/applications/firefox.desktop";
  };

  xdg.configFile."autostart/guake.desktop" = {
    enable = true;
    source = "${pkgs.guake}/share/applications/guake.desktop";
  };

  xdg.configFile."autostart/idea-ultimate.desktop" = {
    enable = true;
    source = "${pkgs.guake}/share/applications/idea-ultimate.desktop";
  };
}