{ config, pkgs, ... }:

{
  programs.terminator = {
    enable = false;
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
}