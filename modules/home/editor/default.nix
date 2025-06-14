{ inputs, pkgs, ... }:

{
  imports = [
    ./codium.nix
    ./emacs.nix
    ./vim.nix
  ];
}
