{ config, pkgs, inputs, username, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  file."${config.home-manager.users.${username}.xdg.configHome}/autostart/protonvpn-app.desktop" = {
    enable = true;
    source = "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop";
  };

  file."${config.home-manager.users.${username}.xdg.configHome}/autostart/thunderbird.desktop" = {
    enable = true;
    source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
  };

  file."${config.home-manager.users.${username}.xdg.configHome}/autostart/firefox.desktop" = {
    enable = true;
    source = "${pkgs.firefox}/share/applications/firefox.desktop";
  };

  file."${config.home-manager.users.${username}.xdg.configHome}/autostart/guake.desktop" = {
    enable = true;
    source = "${pkgs.guake}/share/applications/guake.desktop";
  };

  file."${config.home-manager.users.${username}.xdg.configHome}/autostart/idea-ultimate.desktop" = {
    enable = true;
    source = "${pkgs.guake}/share/applications/idea-ultimate.desktop";
  };
}