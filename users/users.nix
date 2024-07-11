{ config, pkgs, inputs, ... }:

{
  imports = [ ./home-manager/ashim-home.nix ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };
}