{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./waybar
    ./nemo.nix
    ./packages.nix
    ./scripts
    ./xdg-mimes.nix
    ./zen-browser
    ./zsh
  ];
}
