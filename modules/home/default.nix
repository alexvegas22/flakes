{ inputs, pkgs, ... }:

{
  imports = [
    ./xdg-mimes.nix
    ./git
    ./foot
    ./zsh
    ./package
  ];
}
