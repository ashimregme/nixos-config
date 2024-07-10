{ config, pkgs, ... }:

{
  imports = [ ./firefox.nix ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ashim";
  home.homeDirectory = "/home/ashim";

  home.packages = with pkgs; [
    qbittorrent
    sublime4
    protonvpn-gui
    shotwell
    libreoffice
    jetbrains.idea-ultimate
    deja-dup
    gparted
    veracrypt
    ventoy-full
    neofetch
    aria2
    persepolis #GUI for aria2
    zip
    unzip

    ddcutil #gnome brightness control
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";

  dconf = {
    enable = true;
    settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Ctrl><Alt>t";
        command = "terminator";
        name = "open-terminal";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          appindicator.extensionUuid
          workspace-indicator.extensionUuid
          system-monitor.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
      };
    };
  };
  
  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
    git = {
      enable = true;
      userName = "Ashim Regmi";
      userEmail = "5734294+ashimregme@users.noreply.github.com";
    };

    terminator = {
      enable = true;
      config = {
        global_config = {
          "window_state" = "maximise";
        };
        profiles.default = {
          "use_system_font" = false;
          "font" = "Monospace 13";
          "background_darkness" = 0.9;
          "background_type" = "transparent";
          "scrollback_infinite" = true;
          "audible_bell" = true;
        };
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = "source ~/.p10k.zsh";

      shellAliases = {
        ll = "ls -halt";
        nixupd = "sudo nixos-rebuild --upgrade-all switch";
        nixreb = "sudo nixos-rebuild switch";
        nixcog = "sudo nix-collect-garbage --delete-older-than 14d";
        traceroute = "() { nix-shell -p traceroute --command \"traceroute $1\" --pure ;}";
      };
      history = {
        size = 100000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
      plugins = [   
        {                                                                                   
          name = "powerlevel10k";                                                           
          src = pkgs.zsh-powerlevel10k;                                                     
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
        }
      ];
    };

    firefox = {
      enable = true;
      
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";

            "signon.rememberSignons" = false;
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "browser.aboutConfig.showWarning" = false;
            "browser.compactmode.show" = true;

            # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
            # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
            # then have Firefox open on some other workspace.
            "widget.disable-workspace-management" = true;
          };
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [ "DuckDuckGo" "Google" ];
          };
        };
      };
    };
  };

  # systemd.user.services.custombrightness = {
  #   description = "Change brightness of monitor according to the time of the day";
  #   script = ''
      
  #   '';
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  # };
}