{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
