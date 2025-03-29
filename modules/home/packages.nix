{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.qbittorrent
    unstable.sublime4
    unstable.protonvpn-gui
    unstable.shotwell
    unstable.libreoffice-fresh
    unstable.vlc
    unstable.ungoogled-chromium
    unstable.google-chrome
    unstable.gimp
    unstable.viber
    unstable.gapless
    unstable.spotify
    unstable.lmstudio
    deja-dup
    gparted
    veracrypt
    ventoy-full
    neofetch
    aria2
    zip
    unzip
    ddcutil #brightness control
    lsof
    dig
    wget
    gnupg
    rsync
    bleachbit
    guake
    jellyfin
    jellyfin-web

    # development - start
    unstable.jetbrains.idea-ultimate
    # development - end
  ];
}