{ inputs, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./vim.nix
  ];
}
