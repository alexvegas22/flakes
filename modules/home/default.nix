{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./environment
    ./fonts
    ./foot
    ./git
    ./latex
    ./nemo.nix
    ./net
    ./packages.nix
    ./programming
    ./scripts
    ./xdg
    ./zen-browser
    ./zsh
  ];
}
