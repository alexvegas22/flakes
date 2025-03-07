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
    ./scripts
    ./xdg-mimes.nix
    ./zen-browser
    ./zsh
  ];
}
