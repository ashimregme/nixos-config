# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # To unlock the encrypted SWAP partition (change the UUID if necessary, cmd to print UUID, e.g. sudo blkid -s UUID /dev/sdaX or lsblk -f)
  # boot.initrd.luks.devices."luks-6b381d33-7aa5-48ec-8c62-dc31e19cff96".device = "/dev/disk/by-uuid/6b381d33-7aa5-48ec-8c62-dc31e19cff96";

  networking.hostName = "homestation"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    gnome = {
      core-utilities.enable = false;
      tracker-miners.enable = false;
      tracker.enable = false;
      gnome-browser-connector.enable = true;
    };

    xserver = {
      enable = true; # Enable the X11 windowing system.
      desktopManager.gnome.enable = true; # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;

      # Configure keymap in X11
      xkb.layout = "us";
      xkb.variant = "";

      excludePackages = [ pkgs.xterm ];
    };

    printing.enable = false; # Enable CUPS to print documents.

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    libinput.enable = false; # Touchpad support (enabled by default in most desktopManager).

    journald.storage = "volatile"; # Store journald logs only in RAM (to be kind to ssd)
  };

  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-tour
  ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  programs = {
    zsh.enable = true;
    evince.enable = true;
    git.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashim = {
    isNormalUser = true;
    description = "Ashim Regmi";
    extraGroups = [ "networkmanager" "wheel" "docker" "i2c" ];
    initialPassword = "changeme";
    shell = pkgs.zsh;
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.ashim = import ./ashim-home.nix;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnomeExtensions.gsconnect
    vlc
    google-chrome
    gnome.gnome-clocks
    gnome.gnome-calculator
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome.nautilus
    gnome.eog
    wget
    gnupg
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # GSConnect ports
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # GSConnect ports
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  
  documentation.nixos.enable = false;

  virtualisation.docker.enable = true;
  
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  hardware.i2c.enable = true; # For controlling monitor brightness (ddcutil pkg)
}
