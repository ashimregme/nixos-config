{ config, pkgs, flakeRoot, host, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "source ~/.p10k.zsh";

    shellAliases = {
      ll = "ls -halt";
      nixupd = "sudo nix flake update --flake ${flakeRoot}; nixreb";
      nixreb = "sudo nixos-rebuild switch --flake ${flakeRoot}#${host}";
      nixcog = "sudo nix-collect-garbage -d; nix-collect-garbage -d; nixreb; sudo nix-collect-garbage -d; nix-collect-garbage -d; nixopt";
      nixopt = "sudo nix-store --optimise";
      nixrepl = "nix repl -f '<nixpkgs>'";
      traceroute = "() { nix-shell -p traceroute --command \"traceroute $1\" --pure ;}";
      setbri = "() { nix-shell -p ddcutil --command \"ddcutil setvcp 10 $1\" ;}";
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