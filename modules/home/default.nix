{ inputs, pkgs, ... }:

{
  imports = [
    ./xdg-mimes.nix
    ./fonts
    ./git
    ./foot
    ./zsh
    ./package
    ./hypr
  ];
}
