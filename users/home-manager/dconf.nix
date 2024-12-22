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
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "google-chrome.desktop"
          "protonvpn-app.desktop"
          "thunderbird.desktop"
          "viber.desktop"
          "veracrypt.desktop"
          "org.gnome.DejaDup.desktop"
          "sublime_text.desktop"
          "idea-ultimate.desktop"
          "android-studio.desktop"
          "terminator.desktop"
          "gimp.desktop"
          "org.qbittorrent.qBittorrent.desktop"
        ];
      };

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        center-new-windows = true;
        dynamic-workspaces = true;
        edge-tiling = true;
        focus-change-on-pointer-rest = true;
        workspaces-only-on-primary = true;
        experimental-features = ["scale-monitor-framebuffer" "xwayland-native-scaling"];
      };

      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        enable-animations = true;
        enable-hot-corners = true;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        gtk-im-module = "gtk-im-context-simple";
        locate-pointer = true;
        show-battery-percentage = true;
        toolkit-accessibility = false;
      };

      "org/gnome/desktop/sound" = {
        allow-volume-above-100-percent = true;
        event-sounds = true;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        click-method = "areas";
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-timeout = 1800;
      };

      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-schedule-automatic = true;
        night-light-schedule-from = 18.0;
        night-light-schedule-to = 5.0;
        night-light-temperature = 500;
      };

      "org/gnome/desktop/privacy" = {
        disable-microphone = false;
        old-files-age = 7;
        remember-recent-files = false;
        remove-old-temp-files = true;
        remove-old-trash-files = true;
      };

      # To avoid "no default hypervisor" warning, see: https://nixos.wiki/wiki/Virt-manager
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };
}