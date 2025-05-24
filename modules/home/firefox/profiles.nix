{ config, pkgs, ... }:

{
  programs.firefox.profiles = {
    default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "browser.search.defaultenginename" = "ddg";
        "browser.search.order.1" = "ddg";

        "signon.rememberSignons" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "browser.aboutConfig.showWarning" = false;
        "browser.compactmode.show" = true;

        # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
        # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
        # then have Firefox open on some other workspace.
        "widget.disable-workspace-management" = true;
      };
      search = {
        force = true;
        default = "ddg";
        order = [ "ddg" "google" ];
      };
    };
  };
}