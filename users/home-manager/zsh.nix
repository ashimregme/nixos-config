{ config, pkgs, ... }:

{
  programs.zsh = {
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
      nixopt = "sudo nix-store --optimise";
      traceroute = "() { nix-shell -p traceroute --command \"traceroute $1\" --pure ;}";
    };
    history = {
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" ];
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
}