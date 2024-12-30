{ inputs, pkgs, ... }: {
  imports =
    [
      (import ./xdg-mimes.nix)
      (import ./git)
      (import ./foot) 
      (import ./zsh) 
      (import ./package)
    ];
}
