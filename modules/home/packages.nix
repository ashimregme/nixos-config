{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.qbittorrent
#    unstable.sublime4
    unstable.shotwell
    unstable.libreoffice-fresh
    unstable.vlc
    unstable.ungoogled-chromium
    unstable.google-chrome
    unstable.gimp                                                     # Photo editor
    unstable.gapless                                                  # Music player
    unstable.spotify
    deja-dup                                                          # Backup
    gparted
    veracrypt
    ventoy-full
#    neofetch --removed in 26.05
    aria2
    zip
    unzip
    ddcutil #brightness control
    lsof
    dig
    gnupg
    rsync
    bleachbit
    guake
    jellyfin
    jellyfin-web
    mission-center
    tailscale
    tailscale-systray
    cheese

    # development - start
    unstable.jetbrains.idea
    unstable.vscode
    unstable.code-cursor
    unstable.antigravity
    unstable.postman
    unstable.lmstudio
    unstable.warp-terminal
    unstable.filezilla
    unstable.proton-vpn
    # development - end
  ];
}