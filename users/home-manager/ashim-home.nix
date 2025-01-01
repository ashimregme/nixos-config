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
  users.groups.libvirtd.members = ["ashim"];
  users.users.ashim = {
    isNormalUser = true;
    description = "Ashim Regmi";
    extraGroups = [ "networkmanager" "wheel" "docker" "i2c" "adbusers" "libvirtd" "kvm" "qemu-libvirtd" ];
    # Generated using mkpasswd
    hashedPassword = "$6$p4bLCfzviuVdPdJQ$JHovVk/cj9VbKN3J5hsRde2Gc5U.snCDWsvhA0K3hYiFWgo1A.S8jWr08UT29VPDN5U5dT7..KlvcGIit4KYG/";
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

      sessionVariables = {
        ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
        GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidComposition.androidsdk}/libexec/android-sdk/build-tools/${buildToolsVersion}/aapt2";
      };

      packages = with pkgs; [
        unstable.qbittorrent
        unstable.sublime4
        unstable.protonvpn-gui
        unstable.shotwell
        unstable.libreoffice-fresh
        unstable.vlc
        unstable.ungoogled-chromium
        unstable.gimp
        unstable.viber
        unstable.gapless
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
        wget
        gnupg
        rsync
        bleachbit
        guake

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
        enable = false;
        source = "${pkgs.firefox}/share/applications/firefox.desktop";
      };

      file."${config.home-manager.users.ashim.xdg.configHome}/autostart/guake.desktop" = {
        enable = true;
        source = "${pkgs.guake}/share/applications/guake.desktop";
      };
    };

    programs = {
      home-manager.enable = true; # Let Home Manager install and manage itself.
      zsh.enable = true;
      thunderbird = {
        enable = true;
        profiles = { };
      };
      git = {
        enable = true;
        userName = "Ashim Regmi";
        userEmail = "5734294+ashimregme@users.noreply.github.com";
      };
      java = {
        enable = true;
        package = pkgs.temurin-bin-17;
      };
      gnome-shell = {
        enable = true;
        extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
      };
      fzf.enableBashIntegration = true;
    };
  };
  
  # set profile picture
  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp /home/ashim/Pictures/profile-pic.jpg /var/lib/AccountsService/icons/ashim
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/ashim\n" > /var/lib/AccountsService/users/ashim

    chown root:root /var/lib/AccountsService/users/ashim
    chmod 0600 /var/lib/AccountsService/users/ashim

    chown root:root /var/lib/AccountsService/icons/ashim
    chmod 0444 /var/lib/AccountsService/icons/ashim
  '';
}
