{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Ctrl><Alt>t";
        command = "terminator";
        name = "open terminal";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          appindicator.extensionUuid
          workspace-indicator.extensionUuid
          system-monitor.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
        enable-hot-corners = true;
        show-battery-percentage = true;
      };

      "org/gnome/desktop/sound" = {
        allow-volume-above-100-percent = true;
        event-sounds = true;
      };

      # To avoid "no default hypervisor" warning, see: https://nixos.wiki/wiki/Virt-manager
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };
}