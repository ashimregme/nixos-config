{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
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
            android_sdk.accept_license = true;
              permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];
          };
        };
      };
      overlay-gnome = final: prev: {
        gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
          mutter = gnomePrev.mutter.overrideAttrs (old: {
            src = pkgs.fetchFromGitLab  {
              domain = "gitlab.gnome.org";
              owner = "vanvugt";
              repo = "mutter";
              rev = "triple-buffering-v4-46";
              hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
            };
          });
        });
      };
    in {
      nixosConfigurations = {
        homestation = nixpkgs.lib.nixosSystem {
          specialArgs = {
            host = "homestation";
            inherit inputs username;
            pkgs = import nixpkgs {
              system = "x86_64-linux";
              config = {
                allowUnfree = true;
                android_sdk.accept_license = true;
                permittedInsecurePackages = [
                  "openssl-1.1.1w"
                  "qbittorrent-4.6.4"
                ];
              };
              overlays = [
                overlay-unstable
                overlay-gnome
              ];
            };
          };
          modules = [
            ./hosts/homestation
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}