{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./nemo.nix
    ./packages.nix
    ./scripts
    ./waybar
    ./xdg-mimes.nix
    ./zen-browser
    ./zsh
  ];
}
