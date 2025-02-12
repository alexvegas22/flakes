{ inputs, pkgs, ... }:

{
  imports = [
    ./xdg-mimes.nix
    ./nemo.nix
    ./fonts
    ./git
    ./foot
    ./zsh
    ./scripts
    ./package
    ./hypr
  ];
}
