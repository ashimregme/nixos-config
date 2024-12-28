{ config, pkgs, systemd, ... }:

let
  buildToolsVersion = "34.0.0";
  androidComposition = pkgs.unstable.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ buildToolsVersion ];
    platformVersions = [ "33" "34" ];
    cmakeVersions = [ "3.10.2" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    includeNDK = false;
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    extraLicenses = [
     "android-sdk-license"
    ];
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
        unstable.qbittorrent
        unstable.sublime4
        unstable.protonvpn-gui
        unstable.shotwell
        unstable.libreoffice
        unstable.vlc
        unstable.google-chrome
        unstable.gimp
        unstable.viber
        unstable.deja-dup
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
        wget
        gnupg
        calibre
        rsync
        bleachbit
        copyq

        # development - start
        unstable.jetbrains.idea-ultimate
        unstable.android-tools
        unstable.android-studio
        androidComposition.androidsdk
        unstable.flutter
        # development - end
      ];

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/protonvpn-app.desktop" = {
        enable = false;
        source = "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/thunderbird.desktop" = {
        enable = true;
        source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/firefox.desktop" = {
        enable = false;
        source = "${pkgs.firefox}/share/applications/firefox.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/com.github.hluk.copyq.desktop" = {
        enable = true;
        source = "${pkgs.copyq}/share/applications/com.github.hluk.copyq.desktop";
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
        GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidComposition.androidsdk}/libexec/android-sdk/build-tools/${buildToolsVersion}/aapt2";
      };
      java = {
        enable = true;
        package = pkgs.temurin-bin-17;
      };
      gnome-shell = {
        enable = true;
        extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
      };
    };
  };
}
