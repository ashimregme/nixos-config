{ inputs }:

final: prev: {
  unstable = import inputs.nixpkgs-unstable {
    system = prev.system;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
    };
  };
}
