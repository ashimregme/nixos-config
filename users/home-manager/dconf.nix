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
          control-monitor-brightness-and-volume-with-ddcutil.extensionUuid
          gsconnect.extensionUuid
          appindicator.extensionUuid
          system-monitor.extensionUuid
          open-bar.extensionUuid
          hibernate-status-button.extensionUuid
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "chromium-browser.desktop"
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
        enable-hot-corners = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        gtk-im-module = "gtk-im-context-simple";
        locate-pointer = false;
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

      "org/gnome/shell/extensions/open-bar" = {
        accent-color=["0" "0.75" "0.75"];
        autohg-bar=true;
        autohg-menu=true;
        autotheme-dark="Dark";
        autotheme-font=true;
        autotheme-light="Light";
        autotheme-refresh=true;
        balpha=0.66000000000000003;
        bcolor=["0.051" "0.659" "0.392"];
        bg-change=false;
        bgalpha=0.94999999999999996;
        bgcolor=["0.784" "0.910" "0.788"];
        bgcolor-wmax=["0.922" "0.922" "0.922"];
        bgcolor2=["0.729" "0.780" "0.808"];
        bgpalette=false;
        bguri="file:///home/ashim/.config/background";
        boxalpha=0.0;
        boxcolor=["0.784" "0.910" "0.788"];
        bradius=10.0;
        bwidth=0.0;
        color-scheme="default";
        count1=217486;
        count10=173;
        count11=92;
        count12=0;
        count2=90169;
        count3=84419;
        count4=77056;
        count5=63718;
        count6=21050;
        count7=7054;
        count8=541;
        count9=242;
        dark-bcolor=["0.051" "0.659" "0.392"];
        dark-bgcolor=["0.012" "0.090" "0.173"];
        dark-bgcolor-wmax=["0.118" "0.118" "0.118"];
        dark-bgcolor2=["0.165" "0.251" "0.267"];
        dark-bguri="file:///home/ashim/.config/background";
        dark-boxcolor=["0.012" "0.090" "0.173"];
        dark-hscd-color=["0.176" "0.522" "0.357"];
        dark-iscolor=["0.012" "0.090" "0.173"];
        dark-mbcolor=["0.263" "0.639" "0.267"];
        dark-mbgcolor=["0.075" "0.102" "0.125"];
        dark-mscolor=["0.176" "0.522" "0.357"];
        dark-mshcolor=["0.000" "0.000" "0.000"];
        dark-palette1=["4" "20" "36"];
        dark-palette10=["4" "36" "52"];
        dark-palette11=["11" "140" "84"];
        dark-palette12=["40" "40" "68"];
        dark-palette2=["4" "28" "52"];
        dark-palette3=["4" "110" "99"];
        dark-palette4=["4" "52" "76"];
        dark-palette5=["4" "76" "92"];
        dark-palette6=["12" "148" "83"];
        dark-palette7=["67" "163" "68"];
        dark-palette8=["4" "45" "66"];
        dark-palette9=["4" "36" "60"];
        dark-shcolor=["0.000" "0.000" "0.000"];
        dark-smbgcolor=["0.165" "0.251" "0.267"];
        dark-vw-color=["0.176" "0.522" "0.357"];
        dark-winbcolor=["0.176" "0.522" "0.357"];
        default-font="Sans 12";
        fgalpha=1.0;
        fgcolor=["1.0" "1.0" "1.0"];
        hcolor=["0" "0.7" "0.9"];
        height=36.0;
        hscd-color=["0.251" "0.745" "0.510"];
        import-export=true;
        isalpha=0.94999999999999996;
        iscolor=["0.784" "0.910" "0.788"];
        light-bcolor=["0.051" "0.659" "0.392"];
        light-bgcolor=["0.784" "0.910" "0.788"];
        light-bgcolor-wmax=["0.922" "0.922" "0.922"];
        light-bgcolor2=["0.729" "0.780" "0.808"];
        light-bguri="file:///home/ashim/.config/background";
        light-boxcolor=["0.784" "0.910" "0.788"];
        light-hscd-color=["0.251" "0.745" "0.510"];
        light-iscolor=["0.784" "0.910" "0.788"];
        light-mbcolor=["0.016" "0.078" "0.141"];
        light-mbgcolor=["0.902" "0.925" "0.922"];
        light-mscolor=["0.251" "0.745" "0.510"];
        light-mshcolor=["0.000" "0.000" "0.000"];
        light-palette1=["4" "20" "36"];
        light-palette10=["4" "36" "52"];
        light-palette11=["11" "140" "84"];
        light-palette12=["40" "40" "68"];
        light-palette2=["4" "28" "52"];
        light-palette3=["4" "110" "99"];
        light-palette4=["4" "52" "76"];
        light-palette5=["4" "76" "92"];
        light-palette6=["12" "148" "83"];
        light-palette7=["67" "163" "68"];
        light-palette8=["4" "45" "66"];
        light-palette9=["4" "36" "60"];
        light-shcolor=["0.000" "0.000" "0.000"];
        light-smbgcolor=["0.729" "0.780" "0.808"];
        light-vw-color=["0.251" "0.745" "0.510"];
        light-winbcolor=["0.251" "0.745" "0.510"];
        margin=4.0;
        mbcolor=["0.016" "0.078" "0.141"];
        mbgcolor=["0.902" "0.925" "0.922"];
        mfgalpha=1.0;
        mfgcolor=["1.0" "1.0" "1.0"];
        mhcolor=["0" "0.7" "0.9"];
        mscolor=["0.251" "0.745" "0.510"];
        mshcolor=["0.000" "0.000" "0.000"];
        neon=true;
        palette1=["4" "20" "36"];
        palette10=["4" "36" "52"];
        palette11=["11" "140" "84"];
        palette12=["40" "40" "68"];
        palette2=["4" "28" "52"];
        palette3=["4" "110" "99"];
        palette4=["4" "52" "76"];
        palette5=["4" "76" "92"];
        palette6=["12" "148" "83"];
        palette7=["67" "163" "68"];
        palette8=["4" "45" "66"];
        palette9=["4" "36" "60"];
        pause-reload=false;
        reloadstyle=true;
        set-overview=false;
        shcolor=["0.000" "0.000" "0.000"];
        smbgcolor=["0.729" "0.780" "0.808"];
        trigger-autotheme=true;
        trigger-reload=true;
        vw-color=["0.251" "0.745" "0.510"];
        winbcolor=["0.251" "0.745" "0.510"];
        wmaxbar=false;
      };
    };
  };
}