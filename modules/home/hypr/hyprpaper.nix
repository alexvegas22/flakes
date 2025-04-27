{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Images/Wallpapers/wallpaper.jpg" ];
      wallpaper = [ ",~/Images/Wallpapers/wallpaper.jpg" ];
      splash = false;
    };
  };
}
