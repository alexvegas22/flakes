{ inputs, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];
}
