{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
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
    users.ashim = import ./home-manager/ashim-home.nix;
  };
}