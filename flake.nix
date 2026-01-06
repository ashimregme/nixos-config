{
  description = "NixOS configuration";

  nixConfig = {
    # will be appended to the system-level substituters
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    # will be appended to the system-level trusted-public-keys
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
          };
          modules = [
            inputs.nixpkgs.nixosModules.readOnlyPkgs
            { nixpkgs.pkgs = import nixpkgs {
                system = "x86_64-linux";
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [
                    "openssl-1.1.1w"
                    "qbittorrent-4.6.4"
                    "ventoy-1.1.07"
                  ];
                };
                overlays = [
                  overlay-unstable
                  (final: prev: {
                    tailscale = prev.tailscale.overrideAttrs (old: {
                      doCheck = false;
                    });
                  })
                ];
                lib = nixpkgs.lib;
              }; }
            ./hosts/homestation
          ];
        };
      };
    };
}