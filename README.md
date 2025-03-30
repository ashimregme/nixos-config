# NixOS Configuration

- Security hardened Nix (no impermanence module ... yet)
- Gnome
- Hardened Firefox
- VLC
- Single user with home-manager
- Flake based
- systemd-resolved for local DNS resolution
- systemd-boot
- GSConnect
- stylix (disabled for now)
- oh-my-zsh
- ...

If there's white square cursor on gnome, use this to fix:
https://github.com/NixOS/nixpkgs/issues/140505
```
dconf reset /org/gnome/desktop/interface/cursor-theme
```