{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Images/wallpaper.png" ];
      wallpaper = [ ",~/Images/wallpaper.png" ];
      splash = false;
    };
  };
}
