{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./nemo.nix
    ./net
    ./packages.nix
    ./programming
    ./scripts
    ./waybar
    ./xdg-mimes.nix
    ./zen-browser
    ./zsh
  ];
}
