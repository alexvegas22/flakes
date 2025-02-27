{ inputs, pkgs, ... }:

{
  imports = [
    ./editor
    ./fonts
    ./foot
    ./git
    ./hypr
    ./nemo.nix
    ./package
    ./programming
    ./scripts
    ./xdg-mimes.nix
    ./zsh
  ];
}
