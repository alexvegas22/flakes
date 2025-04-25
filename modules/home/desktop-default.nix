{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./net
    ./waybar
    ./zen-browser
    ./nemo.nix
    ./packages.nix
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
