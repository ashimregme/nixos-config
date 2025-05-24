{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.qbittorrent
    unstable.sublime4
#    unstable.protonvpn-gui
    unstable.shotwell
    unstable.libreoffice-fresh
    unstable.vlc
    unstable.ungoogled-chromium
    unstable.google-chrome
    unstable.gimp                                                     # Photo editor
    unstable.viber                                                    # Chat
    unstable.gapless                                                  # Music player
    unstable.spotify
    deja-dup                                                          # Backup
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
    gnupg
    rsync
    bleachbit
    guake
    jellyfin
    jellyfin-web

    # development - start
    unstable.jetbrains.idea-ultimate
    unstable.postman
    # development - end
  ];
}