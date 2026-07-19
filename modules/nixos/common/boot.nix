{ pkgs, lib, ... }:

{
  environment.systemPackages = [ pkgs.sbctl ];

  boot = {
    loader = {
      # Lanzaboote replaces the systemd-boot installer; keep the option
      # settings below because lanzaboote still reads them (e.g. limit).
      systemd-boot = {
        enable = lib.mkForce false;
        configurationLimit = 100;
      };
      efi.canTouchEfiVariables = true;
    };

    # Signed UKIs for UEFI Secure Boot (required so firmware does not
    # skip NixOS and fall through to Windows Boot Manager).
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
#    To unlock the encrypted SWAP partition (change the UUID if necessary, cmd to print UUID, e.g. sudo blkid -s UUID /dev/sdaX or lsblk -f)
#    initrd.luks.devices."luks-6b381d33-7aa5-48ec-8c62-dc31e19cff96".device = "/dev/disk/by-uuid/6b381d33-7aa5-48ec-8c62-dc31e19cff96";
  };
}
