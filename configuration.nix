{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./main/boot.nix
      ./main/networking.nix
      ./main/hardware-services.nix
      ./main/system-packages.nix
      ./main/programs.nix
      ./users/users.nix
      ./services/services.nix
      ./systemd-timer.nix
    ];

  system.stateVersion = "24.05";

  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
  nix.settings = {
    allowed-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  documentation.nixos.enable = false;

  environment.defaultPackages = lib.mkForce [];

  security.rtkit.enable = true;
  security.sudo.execWheelOnly = true;

  environment.sessionVariables.LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [
            pkgs.OVMFFull
          ];
        };
        swtpm.enable = true;
      };
    };
  };
}
