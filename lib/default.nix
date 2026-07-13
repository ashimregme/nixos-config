{ inputs, self }:

let
  defaultSystem = "x86_64-linux";
  defaultUsername = "ashim";

  pkgsConfig = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
      "qbittorrent-4.6.4"
      "ventoy-1.1.12"
    ];
  };

  mkPkgs =
    nixpkgs: system:
    import nixpkgs {
      inherit system;
      config = pkgsConfig;
      overlays = import ../overlays { inherit inputs; };
      lib = inputs.nixpkgs.lib;
    };

  mkHost =
    {
      name,
      system ? defaultSystem,
      username ? defaultUsername,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        host = name;
        flakeRoot = self.outPath;
        inherit self inputs username;
      };
      modules = [
        inputs.nixpkgs.nixosModules.readOnlyPkgs
        { nixpkgs.pkgs = mkPkgs inputs.nixpkgs system; }
        ../hosts/${name}
      ];
    };
in
{
  inherit defaultSystem defaultUsername mkHost mkPkgs;
}
