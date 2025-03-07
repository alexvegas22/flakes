{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Images/wallpaper.png" ];
      wallpaper = [ "eDP-1,~/Images/wallpaper.png" ];
      splash = false;
    };
  };
}
