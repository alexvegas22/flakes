{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./waybar
    ./swaync
    ./latex
    ./hypr
    ./net
    ./zen-browser
    ./nemo.nix
    ./packages.nix
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
