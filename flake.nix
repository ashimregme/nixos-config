{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @inputs:
    let
      username = "ashim";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          system = prev.system;
          config = {
            allowUnfree = true;
              permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];
          };
        };
      };
    in {
      nixosConfigurations = {
        homestation = nixpkgs.lib.nixosSystem {
          specialArgs = {
            host = "homestation";
            inherit self inputs username;
            pkgs = import nixpkgs {
              system = "x86_64-linux";
              config = {
                allowUnfree = true;
                permittedInsecurePackages = [
                  "openssl-1.1.1w"
                  "qbittorrent-4.6.4"
		              "ventoy-1.1.05"
                ];
              };
              overlays = [
                overlay-unstable
              ];
              lib = nixpkgs.lib;
            };
          };
          modules = [
            ./hosts/homestation
          ];
        };
      };
    };
}