{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./latex
    ./zen-browser
    ./nemo.nix
    ./package
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
