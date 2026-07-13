{ inputs }:

[
  (import ./unstable.nix { inherit inputs; })
  (import ./tailscale.nix)
]
