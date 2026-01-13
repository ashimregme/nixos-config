{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/luks-1f063d49-e190-4eac-a9d6-9d04b035fbb5";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-1f063d49-e190-4eac-a9d6-9d04b035fbb5".device = "/dev/disk/by-uuid/1f063d49-e190-4eac-a9d6-9d04b035fbb5";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2034-13F9";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  # Hibernation - Start
  boot.kernelParams = [
    "resume_offset=28624896" # sudo filefrag -v /var/lib/swapfile | head
  ];
  boot.resumeDevice = "/dev/disk/by-uuid/3fc474fa-2e1a-480c-9995-02fb245ca93d"; # lsblk -f (root UUID)
  powerManagement.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 25 * 1024; # in MB
      options = [ "discard" ]; # equivalent to swapon --discard
    }
  ];
  # Hibernation - End

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
