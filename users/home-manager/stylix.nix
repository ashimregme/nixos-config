{ config, pkgs, ... }:

{
  stylix = {
    enable = false;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ./wallpapers/nepal-village.jpg;

    fonts = {
      sizes = {
        applications = 10;
        terminal = 14;
        desktop = 10;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono from pkgs.nerfonts";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    cursor = {
      size = 16;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    polarity = "dark";
  };
}