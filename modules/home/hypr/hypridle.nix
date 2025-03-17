{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = {
        timeout = 1800;
        on-timeout = "systemctl suspend";
        on-battery-timeout = 1800;
        on-plugged-timeout = 0; 
      };
    };
  };
}
