# NixOS Configuration

Flake-based NixOS config for a GNOME workstation with Home Manager.

## Layout

```
flake.nix              # Inputs and host definitions
lib/                   # mkHost helper and shared lists (e.g. GNOME extensions)
overlays/              # unstable and package overrides
hosts/<hostname>/      # Per-machine hardware and host-specific overrides
modules/nixos/         # System modules (common, services, desktop)
modules/home/          # Shared Home Manager modules
users/<username>/      # Per-user NixOS and Home Manager config
nix.conf               # Untracked — GitHub access tokens for private flakes
```

## Rebuild

Apply configuration changes:

```bash
nixreb
```

This alias runs `sudo nixos-rebuild switch --flake <flakeRoot>#<host>` using the flake path and host from your config.

Other useful aliases (defined in `modules/home/zsh.nix`):

| Alias | What it does |
|-------|----------------|
| `nixreb` | Rebuild and switch to the new system |
| `nixupd` | Update flake inputs, then rebuild |
| `nixcog` | Collect garbage, rebuild, collect garbage again, then optimise |
| `nixopt` | Optimise the Nix store |

Full command (if you need it outside a shell with these aliases):

```bash
sudo nixos-rebuild switch --flake /home/ashim/nixos-config#homestation
```

## Secrets

- **`nix.conf`** — keep untracked in the repo root. `NIX_CONF_DIR` points here so Nix reads `access-tokens` for private flake inputs.
- **`users/<username>/password.hash`** — untracked file at `/home/<username>/nixos-config/users/<username>/password.hash` with the hashed password (`mkpasswd -m sha-512`).

## stateVersion

`system.stateVersion` and `home.stateVersion` are `24.05` (install date). They are intentionally not bumped when updating the nixpkgs channel.

## Features

- GNOME desktop with consolidated extension list in `lib/gnome-extensions.nix`
- Hardened Firefox (Home Manager)
- Home Manager single-user setup
- systemd-resolved, systemd-boot
- GSConnect
- Docker and libvirt

## GNOME cursor fix

If you see a white square cursor on GNOME:

https://github.com/NixOS/nixpkgs/issues/140505

```bash
dconf reset /org/gnome/desktop/interface/cursor-theme
```
