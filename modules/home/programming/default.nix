{ inputs, pkgs, ... }: {
  imports = [
    ./devops.nix
    ./languages.nix
    ./c-tools.nix
    ./misc-tools.nix
  ];
}
