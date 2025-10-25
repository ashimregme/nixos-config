{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/24d4fc9a-29ea-4f3d-8981-c756e966d26b";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-109c109d-965a-4a0a-9e4e-e032051512bf".device = "/dev/disk/by-uuid/109c109d-965a-4a0a-9e4e-e032051512bf";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6736-FDE0";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  # Hibernation - Start
  boot.kernelParams = ["resume_offset=1681408"]; # sudo filefrag -v /var/lib/swapfile | head
  boot.resumeDevice = "/dev/disk/by-uuid/24d4fc9a-29ea-4f3d-8981-c756e966d26b"; # lsblk -f (root UUID)
  powerManagement.enable = true;
  swapDevices = [
#    {
#      device = "/var/lib/swapfile";
#      size = 16 * 1024; # 36GB in MB
#    }
  ];
  # Hibernation - End

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
