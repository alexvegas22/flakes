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
    ./packages.nix
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
