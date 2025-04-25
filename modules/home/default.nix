{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./waybar
    ./swaync
    ./latex
    ./net
    ./zen-browser
    ./nemo.nix
    ./package
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
