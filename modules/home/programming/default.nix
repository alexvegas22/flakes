{ inputs, pkgs, ... }: {
  imports = [
    ./devops.nix
    ./languages.nix
    ./llm.nix
    ./c-tools.nix
    ./misc-tools.nix
  ];
}
