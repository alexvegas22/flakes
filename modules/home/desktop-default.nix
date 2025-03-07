{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./zen-browser
    ./nemo.nix
    ./package
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
