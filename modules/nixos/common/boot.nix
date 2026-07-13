{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 100;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
#    To unlock the encrypted SWAP partition (change the UUID if necessary, cmd to print UUID, e.g. sudo blkid -s UUID /dev/sdaX or lsblk -f)
#    initrd.luks.devices."luks-6b381d33-7aa5-48ec-8c62-dc31e19cff96".device = "/dev/disk/by-uuid/6b381d33-7aa5-48ec-8c62-dc31e19cff96";
  };
}