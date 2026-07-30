{
  pkgs,
  inputs,
  username,
  host,
  flakeRoot,
  self,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../users/${username}/nixos.nix
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host flakeRoot self; };
    users.${username} = {
      imports = [ ../../users/${username} ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
      };
      programs.home-manager.enable = true;
    };
    backupFileExtension = "backup";
  };
}
