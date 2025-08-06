{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./nemo.nix
    ./packages.nix
    ./scripts
    ./waybar
    ./xdg-mimes.nix
    ./zen-browser
    ./zsh
  ];
}
