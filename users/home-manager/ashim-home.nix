{ config, pkgs, systemd, ... }:

let
  androidComposition = pkgs.unstable.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "30.0.3" ];
    platformVersions = [ "28" "29" "30" ];
    cmakeVersions = [ "3.10.2" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    includeNDK = false;
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
  };
in {
  imports = [
  ];
  users.users.ashim = {
    isNormalUser = true;
    description = "Ashim Regmi";
    extraGroups = [ "networkmanager" "wheel" "docker" "i2c" "adbusers" "kvm" ];
    initialPassword = "changeme";
    shell = pkgs.zsh;
  };
  programs.adb.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  home-manager.users.ashim = {
    imports = [
      ./firefox/firefox.nix
      ./zsh.nix
      ./terminal.nix
      ./dconf.nix
    ];

    home = {
      stateVersion = "24.05";
      username = "ashim";
      homeDirectory = "/home/ashim";

      packages = with pkgs; [
        qbittorrent
        sublime4
        protonvpn-gui
        shotwell
        libreoffice
        deja-dup
        gparted
        veracrypt
        ventoy-full
        neofetch
        aria2
        zip
        unzip
        ddcutil #brightness control
        lsof
        dig
        vlc
        google-chrome
        wget
        gnupg
        gimp
        viber
        calibre
        rsync

        # development - start
        unstable.jetbrains.idea-ultimate
        unstable.android-tools
        unstable.android-studio
        androidComposition.androidsdk
        unstable.flutter
        # development - end
      ];

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/protonvpn-app.desktop" = {
        enable = true;
        source = "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/thunderbird.desktop" = {
        enable = true;
        source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/firefox.desktop" = {
        enable = true;
        source = "${pkgs.firefox}/share/applications/firefox.desktop";
      };
    };

    programs = {
      home-manager.enable = true; # Let Home Manager install and manage itself.
      thunderbird = {
        enable = true;
        profiles = { };
      };
      git = {
        enable = true;
        userName = "Ashim Regmi";
        userEmail = "5734294+ashimregme@users.noreply.github.com";
      };
      zsh.sessionVariables = {
        ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
      };
      java = {
        enable = true;
        package = pkgs.temurin-bin-17;
      };
    };
  };
}
