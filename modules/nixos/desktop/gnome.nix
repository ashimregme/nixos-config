{ config, pkgs, ... }:

let
  gnomeExtensionNames = import ../../../lib/gnome-extensions.nix;
  gnomeExtensionPackages = map (name: pkgs.gnomeExtensions.${name}) gnomeExtensionNames;
in
{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      localsearch.enable = false;
      tinysparql.enable = false;
      # Note: This enables the system service that provides the native messaging
      # host for GNOME Shell integration (aka chrome-gnome-shell /
      # gnome-browser-connector). When Firefox is managed via Home Manager,
      # you still need to register the host for that Firefox by adding
      # `gnome-browser-connector` to
      # `programs.firefox.nativeMessagingHosts.packages` in Home Manager.
      # See: modules/home/firefox/default.nix
      gnome-browser-connector.enable = true;
    };
  };

  environment.systemPackages = gnomeExtensionPackages ++ (with pkgs; [
    gnome-calculator
    gnome-disk-utility
    nautilus
    eog
    gnome-clocks
    gnome-tweaks
  ]);

  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-tour
  ];

  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];

  systemd.tmpfiles.settings."10-accounts-service-root" = {
    "/var/lib/AccountsService/users/root" = {
      "f+" = {
        mode = "0600";
        user = "root";
        group = "root";
        argument = ''
          [User]
          SystemAccount=true
        '';
      };
    };
  };
}
