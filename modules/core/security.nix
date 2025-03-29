{ ... }:

{
  security.rtkit.enable = true;
  security.sudo.execWheelOnly = true;
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };
}