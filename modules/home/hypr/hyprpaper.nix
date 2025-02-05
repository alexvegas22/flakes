{ config, pkgs, ... }:

{
  programs.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Images/wallpaper.png" ];
      wallpaper = [ "eDP-1,/home/alex/Images/wallpaper.png" ];
      splash = false;
    };
  };
}
