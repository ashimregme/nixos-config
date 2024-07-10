{ pkgs, ... }:

{
  systemd = {
    timers.simple-timer = {
      wantedBy = [ "timers.target" ];
      partOf = [ "simple-timer.service" ];
      timerConfig = {
        OnBootSec = "5m"; # 5 minutes after boot
        OnCalendar = "*-*-* *:30:00"; # Every hour at half past e.g. 12:30, 13:30, 14:30 and so on.
      };
    };
    services.simple-timer = {
      serviceConfig.Type = "oneshot";
      script = (builtins.readFile ./set-brightness.sh);
    };
  };
}